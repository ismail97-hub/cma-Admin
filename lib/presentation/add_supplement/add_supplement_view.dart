import 'package:cma_admin/app/functions.dart';
import 'package:cma_admin/presentation/add_supplement/add_supplement_viewmodel.dart';
import 'package:cma_admin/presentation/components/color_picker_label.dart';
import 'package:cma_admin/presentation/components/custom_appbar.dart';
import 'package:cma_admin/presentation/components/custom_color_picker.dart';
import 'package:cma_admin/presentation/components/custom_submit_button.dart';
import 'package:cma_admin/presentation/components/custom_textfield.dart';
import 'package:cma_admin/presentation/components/field_label.dart';
import 'package:cma_admin/presentation/components/image_picker_widget.dart';
import 'package:cma_admin/presentation/resources/font_manager.dart';
import 'package:cma_admin/presentation/resources/styles_manager.dart';
import 'package:cma_admin/app/di.dart';
import 'package:cma_admin/presentation/common/state_renderer/state_render_impl.dart';
import 'package:cma_admin/presentation/resources/color_manager.dart';
import 'package:cma_admin/presentation/resources/strings_manager.dart';
import 'package:cma_admin/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

class AddSupplementView extends StatefulWidget {
  const AddSupplementView({Key? key}) : super(key: key);

  @override
  _AddSupplementViewState createState() => _AddSupplementViewState();
}

class _AddSupplementViewState extends State<AddSupplementView> {
  AddSupplementViewModel _viewModel = instance<AddSupplementViewModel>();
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
    
    _priceTextEditingController.addListener(() { 
      _viewModel.setPrice(_priceTextEditingController.text);
    });

    _titleTextEditingController.addListener((){
      _viewModel.setTitle(_titleTextEditingController.text);
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
                  _viewModel.addSupplement(context);
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
                  AppStrings.createSupplement,
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
              // image
              ImagePickerWidget(
                setImage: (image)=>_viewModel.setImage(image), 
                imageStream: _viewModel.outputImage),
              SizedBox(height: AppSize.s30),
              // title field
              CustomTextField(
                width: double.infinity,
                label: AppStrings.title, 
                errorStream: _viewModel.outputErrorTitle, 
                textEditingController: _titleTextEditingController),
              SizedBox(height: AppSize.s30),
              // price field
              CustomTextField(
                width: double.infinity,
                label: AppStrings.price, 
                errorStream: _viewModel.outputErrorPrice, 
                textEditingController: _priceTextEditingController),
              SizedBox(height: AppSize.s30),
              // color field
              CustomColorPicker(stream: _viewModel.outputPickerColor, onTap: (color)=>_viewModel.setColor(color)),
              SizedBox(height: AppSize.s40),
              // button
              CustomSubmitButton(
                width: double.infinity,
                isAllInputValidStream: _viewModel.outputIsAllInputsValid, 
                onTap: ()=>_viewModel.addSupplement(context), 
                buttonText: AppStrings.create),
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
