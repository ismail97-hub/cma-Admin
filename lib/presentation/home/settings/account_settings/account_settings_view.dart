import 'package:cma_admin/app/di.dart';
import 'package:cma_admin/app/hive_helper.dart';
import 'package:cma_admin/presentation/common/state_renderer/state_render_impl.dart';
import 'package:cma_admin/presentation/components/action_button.dart';
import 'package:cma_admin/presentation/components/custom_dropdown.dart';
import 'package:cma_admin/presentation/components/custom_submit_button.dart';
import 'package:cma_admin/presentation/components/custom_textfield.dart';
import 'package:cma_admin/presentation/components/custom_upload_image.dart';
import 'package:cma_admin/presentation/components/headar_text.dart';
import 'package:cma_admin/presentation/components/responsive_widget.dart';
import 'package:cma_admin/presentation/home/settings/account_settings/account_settings_viewmodel.dart';
import 'package:cma_admin/presentation/home/settings/account_settings/components/profile_photo.dart';
import 'package:cma_admin/presentation/resources/strings_manager.dart';
import 'package:cma_admin/presentation/resources/styles_manager.dart';
import 'package:cma_admin/presentation/resources/values_manager.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import '../../../../app/enum.dart';
import '../../../../app/functions.dart';
import '../../../components/field_label.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/font_manager.dart';

class AccountSettingsView extends StatefulWidget {
  const AccountSettingsView({Key? key}) : super(key: key);

  @override
  State<AccountSettingsView> createState() => _AccountSettingsViewState();
}

class _AccountSettingsViewState extends State<AccountSettingsView> {
  AccountSettingsViewModel _viewModel = instance<AccountSettingsViewModel>();
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameTextEditingController = TextEditingController();
  TextEditingController _usernameTextEditingController = TextEditingController();
  TextEditingController _oldPasswordTextEditingController = TextEditingController();
  TextEditingController _newPasswordTextEditingController = TextEditingController();
  TextEditingController _confirmationPasswordTextEditingController = TextEditingController();

  _bind(){
    _viewModel.start();
    _nameTextEditingController.text = HiveHelper.getCurrentUser().name;
    _usernameTextEditingController.text = HiveHelper.getCurrentUser().userName;
    _nameTextEditingController.addListener(() { 
      _viewModel.setName(_nameTextEditingController.text);
    });
    _usernameTextEditingController.addListener(() { 
      _viewModel.setUsername(_usernameTextEditingController.text);
    });
    _oldPasswordTextEditingController.addListener(() { 
      _viewModel.setOldPassword(_oldPasswordTextEditingController.text);
    });
    _newPasswordTextEditingController.addListener(() { 
      _viewModel.setNewPassword(_newPasswordTextEditingController.text);
    });
    _confirmationPasswordTextEditingController.addListener(() { 
      _viewModel.setConfirmationPassword(_confirmationPasswordTextEditingController.text);
    });
  } 

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FlowState>(
      stream: _viewModel.outputState,
      builder: (context, snapshot) {
        return snapshot.data?.getScreenWidget(context,_getContentScreenWidget(),(){})??_getContentScreenWidget();
      }
    );
  }

  Widget _getContentScreenWidget(){
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: AppPadding.p20,vertical: AppPadding.p10),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderText(AppStrings.account),
              SizedBox(height: AppSize.s20),
              _getSectionTitle("Profile"),
              SizedBox(height: AppSize.s14),
              // Name and Username
              ResponsiveWidget(
                children: [
                  // Name
                  CustomTextField(
                    label: AppStrings.name, 
                    errorStream: _viewModel.outputErrorName, 
                    textEditingController: _nameTextEditingController),
                  SizedBox(width: AppSize.s20,height: AppSize.s14),
                  // Username
                  CustomTextField(
                    label: AppStrings.username, 
                    errorStream: _viewModel.outputErrorUsername, 
                    textEditingController: _usernameTextEditingController),
                ],
              ),
              SizedBox(height: AppSize.s14),
              // Upload Image
              CustomUploadImage(
                imageUrl: HiveHelper.getCurrentUser().image,
                setImage: (image)=>_viewModel.setImage(image), 
                imageStream: _viewModel.outputImage),
              SizedBox(height: AppSize.s14),
              // Role
              CustomDropDown<UserRole>(
                label: AppStrings.role, 
                stream: _viewModel.outputRoles, 
                selectedItem: HiveHelper.getCurrentUser().role.toUserRoleEnum(),
                itemAsString: (UserRole? role)=>role!.toStr(), 
                onTap: (role){
                  _viewModel.setRole(role);
                }),
              SizedBox(height: AppSize.s20),
              _getSectionTitle("Password"),
              SizedBox(height: AppSize.s14),
              // Old pasword
              CustomTextField(
                obscureText: true,
                label: AppStrings.oldPassword, 
                errorStream: _viewModel.outputErrorOldPasswrd, 
                textEditingController: _oldPasswordTextEditingController),
              SizedBox(height: AppSize.s14),
              // New password and confirmation
              ResponsiveWidget(
                children: [
                  // New password
                  CustomTextField(
                    obscureText: true,
                    label: AppStrings.newPassword, 
                    errorStream: _viewModel.outputErrorNewPassword, 
                    textEditingController: _newPasswordTextEditingController),
                  SizedBox(width: AppSize.s20,height: AppSize.s14),
                  // Confirmation new password
                  CustomTextField(
                    obscureText: true,
                    label: AppStrings.confirmationNewPassword, 
                    errorStream: _viewModel.outputErrorConfirmatioNewPassword, 
                    textEditingController: _confirmationPasswordTextEditingController),  
                ],
              ), 
              SizedBox(height: AppSize.s30),
              // Submit button
              CustomSubmitButton(
                buttonText: AppStrings.save, 
                isAllInputValidStream: _viewModel.outputIsValidToUpdate, 
                onTap: ()=>_viewModel.updateMyAccount(context))  
            ],
          ),
        ),
      ),
    );
  }

  Widget _getSectionTitle(String title){
    return Text(title,style: getSemiBoldStyle(
      color: ColorManager.black, 
      fontSize:isMobile(context)?FontSize.s12:FontSize.s20));
  }    

}