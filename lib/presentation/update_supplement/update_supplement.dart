import 'dart:typed_data';
import 'package:cma_admin/app/functions.dart';
import 'package:cma_admin/domain/model/model.dart';
import 'package:cma_admin/presentation/components/color_picker_dialogue.dart';
import 'package:cma_admin/presentation/components/color_picker_label.dart';
import 'package:cma_admin/presentation/components/custom_appbar.dart';
import 'package:cma_admin/presentation/components/field_label.dart';
import 'package:cma_admin/presentation/components/image_picker.dart';
import 'package:cma_admin/presentation/components/image_picker_widget.dart';
import 'package:cma_admin/presentation/components/requiredlabel.dart';
import 'package:cma_admin/presentation/resources/font_manager.dart';
import 'package:cma_admin/presentation/resources/styles_manager.dart';
import 'package:cma_admin/presentation/update_supplement/update_supplement_view_model.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:cma_admin/app/di.dart';
import 'package:cma_admin/presentation/common/state_renderer/state_render_impl.dart';
import 'package:cma_admin/presentation/resources/color_manager.dart';
import 'package:cma_admin/presentation/resources/strings_manager.dart';
import 'package:cma_admin/presentation/resources/values_manager.dart';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class UpdateSupplementView extends StatefulWidget {
  final Supplement supplement;
  const UpdateSupplementView(this.supplement, {Key? key}) : super(key: key);

  @override
  _UpdateSupplementViewState createState() => _UpdateSupplementViewState();
}

class _UpdateSupplementViewState extends State<UpdateSupplementView> {
  UpdateSupplementViewModel _viewModel = instance<UpdateSupplementViewModel>();
  final _formKey = GlobalKey<FormState>();

  TextEditingController _titleTextEditingController = TextEditingController();
  TextEditingController _priceTextEditingController = TextEditingController();

  @override
  void initState() {
    _bind();
    super.initState();
  }

  _bind() {
    _viewModel.start();

    _titleTextEditingController.addListener(() {
      _viewModel.setTitle(_titleTextEditingController.text);
    });
    _titleTextEditingController.text = widget.supplement.title;

    _priceTextEditingController.addListener(() {
      _viewModel.setPrice(_priceTextEditingController.text);
    });
    _priceTextEditingController.text = widget.supplement.price.toString();
    _viewModel.setId(widget.supplement.id.toString());
    _viewModel.setColor(widget.supplement.color);

    _viewModel.isSupplementUpdatedSuccessfullyStreamController.stream
        .listen((isSuccessUpdateSupplement) {
      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      body: StreamBuilder<FlowState>(
        stream: _viewModel.outputState,
        builder: (context, snapshot) {
          return Center(
            child: snapshot.data?.getScreenWidget(context, _getContentWidget(),
                    () {
                  _viewModel.updateSupplement(context);
                }) ??
                _getContentWidget(),
          );
        },
      ),
    );
  }

  Widget _getContentWidget() {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical:AppPadding.p40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //title
                Text(
                  AppStrings.updateSupplement,
                  style: getSemiBoldStyle(
                  color: ColorManager.black,
                  fontSize: FontSize.s24),
                ),
                SizedBox(height: AppSize.s30),
                // form
                _getForm()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _getForm() {
    return Card(
      shadowColor: ColorManager.grey2,
      elevation: AppSize.s2,
      child: Container(
          padding: EdgeInsets.symmetric(horizontal:AppPadding.p20,vertical: AppPadding.p30),
          width: isMobile(context)?AppSize.s400:AppSize.s600,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // image picker
                ImagePickerWidget(
                  setImage:(pickerFile){
                    _viewModel.setProfilePicture(pickerFile);
                  }, 
                  imageStream: _viewModel.outputProfilePicture),
                SizedBox(height: AppSize.s30),
                // title field
                FieldLabel(AppStrings.title,isRequired: true),
                StreamBuilder<String?>(
                  stream: _viewModel.outputErrorTitle,
                  builder: (context, snapshot) {
                    return TextFormField(
                        keyboardType: TextInputType.text,
                        controller: _titleTextEditingController,
                        decoration: InputDecoration(
                            hintText: AppStrings.title,
                            errorText: snapshot.data));
                  },
                ),
                SizedBox(height: AppSize.s30),
                // price field
                FieldLabel(AppStrings.price,isRequired: true),
                StreamBuilder<String?>(
                  stream: _viewModel.outputErrorPrice,
                  builder: (context, snapshot) {
                    return TextFormField(
                        keyboardType: TextInputType.text,
                        controller: _priceTextEditingController,
                        decoration: InputDecoration(
                            hintText: AppStrings.price,
                            errorText: snapshot.data));
                  },
                ),
                SizedBox(height: AppSize.s30),
                // color field
                FieldLabel(AppStrings.color),
                StreamBuilder<Color?>(
                  stream: _viewModel.outputPickerColor,
                  builder: (context, snapshot) {
                    Color color = snapshot.data ?? widget.supplement.color;
                    return ColorPickerForm(
                      color: color,
                      setColor: (color)=>_viewModel.setColor(color),
                    );
                  },
                ),
                SizedBox(height: AppSize.s40),
                // button
                StreamBuilder<bool>(
                  stream: _viewModel.outputIsAllInputsValid,
                  builder: (context, snapshot) {
                    return SizedBox(
                      width: double.infinity,
                      height: AppSize.s40,
                      child: ElevatedButton(
                          onPressed: (snapshot.data ?? false)? () =>_viewModel.updateSupplement(context): null,
                          child: Text(AppStrings.update)),
                    );
                  },
                ),
              ],
            ),
          ),
        ));
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}