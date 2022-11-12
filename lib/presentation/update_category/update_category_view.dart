import 'package:cma_admin/app/di.dart';
import 'package:cma_admin/app/functions.dart';
import 'package:cma_admin/domain/model/model.dart';
import 'package:cma_admin/presentation/common/state_renderer/state_render_impl.dart';
import 'package:cma_admin/presentation/components/color_picker_label.dart';
import 'package:cma_admin/presentation/components/custom_appbar.dart';
import 'package:cma_admin/presentation/components/field_label.dart';
import 'package:cma_admin/presentation/components/image_picker_widget.dart';
import 'package:cma_admin/presentation/resources/color_manager.dart';
import 'package:cma_admin/presentation/resources/font_manager.dart';
import 'package:cma_admin/presentation/resources/strings_manager.dart';
import 'package:cma_admin/presentation/resources/styles_manager.dart';
import 'package:cma_admin/presentation/resources/values_manager.dart';
import 'package:cma_admin/presentation/update_category/update_category_view_model.dart';
import 'package:flutter/material.dart';

import '../components/custom_color_picker.dart';
import '../components/custom_submit_button.dart';
import '../components/custom_textfield.dart';

class UpdateCategoryView extends StatefulWidget {
  final Category category;
  const UpdateCategoryView(this.category, {Key? key}) : super(key: key);

  @override
  _UpdateCategoryViewState createState() => _UpdateCategoryViewState();
}

class _UpdateCategoryViewState extends State<UpdateCategoryView> {
  UpdateCategoryViewModel _viewModel = instance<UpdateCategoryViewModel>();
  final _formKey = GlobalKey<FormState>();

  TextEditingController _labelTextEditingController = TextEditingController();

  @override
  void initState() {
    _bind();
    super.initState();
  }

  _bind() {
    _viewModel.init(widget.category);
    _viewModel.start();
    _labelTextEditingController.addListener(() {
      _viewModel.setLabel(_labelTextEditingController.text);
    });

    _labelTextEditingController.text = widget.category.label;


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
                  _viewModel.updateCategory(context);
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
                  AppStrings.updateCategory,
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

  Widget _getForm(){
    return  Card(
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
                  imageUrl: widget.category.image,
                  setImage:(image)=>_viewModel.setImage(image), 
                  imageStream: _viewModel.outputImage),
                SizedBox(height: AppSize.s30),
                // label field
                CustomTextField(
                  width: double.infinity,
                  label: AppStrings.label, 
                  errorStream: _viewModel.outputErrorLabel, 
                  textEditingController: _labelTextEditingController),
                SizedBox(height: AppSize.s30),
                //color field
                CustomColorPicker(
                  initColor: widget.category.color,
                  stream: _viewModel.outputPickerColor, 
                  onTap: (color)=>_viewModel.setColor(color)),
                SizedBox(height: AppSize.s40),
                //submit button
                CustomSubmitButton(
                  width: double.infinity,
                  isAllInputValidStream: _viewModel.outputIsAllInputsValid, 
                  onTap: ()=>_viewModel.updateCategory(context), 
                  buttonText: AppStrings.create),
              ],
            ),
          )),
    );
  }

  
  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }


}
