import 'package:cma_admin/app/di.dart';
import 'package:cma_admin/app/functions.dart';
import 'package:cma_admin/domain/model/model.dart';
import 'package:cma_admin/presentation/common/state_renderer/state_render_impl.dart';
import 'package:cma_admin/presentation/components/custom_appbar.dart';
import 'package:cma_admin/presentation/components/image_picker_widget.dart';
import 'package:cma_admin/presentation/resources/color_manager.dart';
import 'package:cma_admin/presentation/resources/font_manager.dart';
import 'package:cma_admin/presentation/resources/strings_manager.dart';
import 'package:cma_admin/presentation/resources/styles_manager.dart';
import 'package:cma_admin/presentation/resources/values_manager.dart';
import 'package:cma_admin/presentation/update_product/update_product_view_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../components/custom_color_picker.dart';
import '../components/custom_dropdown.dart';
import '../components/custom_submit_button.dart';
import '../components/custom_textfield.dart';

class UpdateProductView extends StatefulWidget {
  final Product product;
  const UpdateProductView(this.product, {Key? key}) : super(key: key);

  @override
  _UpdateProductViewViewState createState() => _UpdateProductViewViewState();
}

class _UpdateProductViewViewState extends State<UpdateProductView> {
  UpdateProductViewModel _viewModel = instance<UpdateProductViewModel>();
  final _formKey = GlobalKey<FormState>();

  TextEditingController _titleTextEditingController = TextEditingController();
  TextEditingController _priceTextEditingController = TextEditingController();

  @override
  void initState() {
    _bind();
    super.initState();
  }

  _bind() {
    _viewModel.init(widget.product);
    _viewModel.start();
    _priceTextEditingController.text = widget.product.price.toString();
    _titleTextEditingController.text = widget.product.title;

    _titleTextEditingController.addListener(() {
      _viewModel.setTitle(_titleTextEditingController.text);
    });

    _priceTextEditingController.addListener(() {
      _viewModel.setPrice(_priceTextEditingController.text);
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
            ()=>_viewModel.updateProduct(context)) ?? _getContentWidget(),
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
                  AppStrings.updateProduct,
                  style: getSemiBoldStyle(
                  color: ColorManager.black,
                  fontSize: FontSize.s24),
                ).tr(),
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
                // image field
            ImagePickerWidget(
              imageUrl: widget.product.image,
              setImage: (image)=>_viewModel.setImage(image), 
              imageStream: _viewModel.outputImage),
            SizedBox(height: AppSize.s30),
            // title 
            CustomTextField(
              width: double.infinity,
              label: AppStrings.name, 
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
            // category field
            CustomDropDown<Category>(
              width: double.infinity,
              selectedItem: widget.product.category,
              label: AppStrings.category, 
              stream: _viewModel.outputCategories, 
              itemAsString: (Category? category)=>category!.label.tr(), 
              onTap: (category)=>_viewModel.setCategoryId(category.id.toString())),
            SizedBox(height: AppSize.s30),
            // color field
            CustomColorPicker(
              initColor: widget.product.color,
              stream: _viewModel.outputPickerColor, 
              onTap: (color)=>_viewModel.setColor(color)),
            SizedBox(height: AppSize.s40),
            // Button
            CustomSubmitButton(
              width: double.infinity,
              isAllInputValidStream: _viewModel.outputIsAllInputsValid, 
              onTap: ()=>_viewModel.updateProduct(context), 
              buttonText: AppStrings.update),
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
