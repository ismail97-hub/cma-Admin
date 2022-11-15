import 'package:cma_admin/app/di.dart';
import 'package:cma_admin/app/enum.dart';
import 'package:cma_admin/domain/model/model.dart';
import 'package:cma_admin/presentation/common/state_renderer/state_render_impl.dart';
import 'package:cma_admin/presentation/components/custom_appbar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../app/functions.dart';
import '../components/custom_dropdown.dart';
import '../components/custom_submit_button.dart';
import '../components/custom_textfield.dart';
import '../components/image_picker_widget.dart';
import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/strings_manager.dart';
import '../resources/styles_manager.dart';
import '../resources/values_manager.dart';
import 'update_user_viewmodel.dart';

class UpdateUserView extends StatefulWidget {
  final User user;
  const UpdateUserView(this.user,{Key? key}) : super(key: key);

  @override
  State<UpdateUserView> createState() => _UpdateUserViewState();
}

class _UpdateUserViewState extends State<UpdateUserView> {
  UpdateUserViewModel _viewModel = instance<UpdateUserViewModel>();  
  final _formKey = GlobalKey<FormState>();

  TextEditingController _nameTextEditingController = TextEditingController();
  TextEditingController _usernameTextEditingController = TextEditingController();
  
  _bind(){
    _viewModel.init(widget.user);
    _viewModel.start();
    _nameTextEditingController.text = widget.user.name;
    _usernameTextEditingController.text=widget.user.userName; 
    
    _nameTextEditingController.addListener(() { 
      _viewModel.setName(_nameTextEditingController.text);
    });
    _usernameTextEditingController.addListener(() { 
      _viewModel.setUsername(_usernameTextEditingController.text);
    });
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      body: StreamBuilder<FlowState>(
        stream: _viewModel.outputState,
        builder: (context, snapshot) {
          return snapshot.data?.getScreenWidget(context, _getContentScreenWidget(),
                         ()=>_viewModel.updateUser(context, widget.user.id))
                         ??_getContentScreenWidget();
        }
      ),
    );
  }

  Widget _getContentScreenWidget(){
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
                  AppStrings.updateUser,
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
                //image
                ImagePickerWidget(
                  imageUrl: widget.user.image,
                  setImage: (image)=>_viewModel.setImage(image), 
                  imageStream: _viewModel.outputImage),
                SizedBox(height: AppSize.s30),
                // name field
                CustomTextField(
                  width: double.infinity,
                  label: AppStrings.name, 
                  errorStream: _viewModel.outputErrorName, 
                  textEditingController: _nameTextEditingController),
                SizedBox(height: AppSize.s30),
                // role field
                CustomDropDown<UserRole>(
                  width: double.infinity,
                  selectedItem: widget.user.getRole,
                  label: AppStrings.role, 
                  stream: _viewModel.outputRoles, 
                  itemAsString: (UserRole? role)=> role!.totr(), 
                  onTap: (role)=>_viewModel.setRole(role)),
                SizedBox(height: AppSize.s30),
                // username field
                CustomTextField(
                  width: double.infinity,
                  label: AppStrings.username, 
                  errorStream: _viewModel.outputErrorUsername, 
                  textEditingController: _usernameTextEditingController),
                SizedBox(height: AppSize.s40),
                CustomSubmitButton(
                  width: double.infinity,
                  isAllInputValidStream: _viewModel.outputIsValidToUpdate, 
                  onTap: ()=>_viewModel.updateUser(context, widget.user.id), 
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