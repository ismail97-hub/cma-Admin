import 'package:cma_admin/app/di.dart';
import 'package:cma_admin/app/hive_helper.dart';
import 'package:cma_admin/presentation/common/state_renderer/state_render_impl.dart';
import 'package:cma_admin/presentation/components/action_button.dart';
import 'package:cma_admin/presentation/components/headar_text.dart';
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
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _getTextFieldWidget(AppStrings.name, _viewModel.outputErrorName,_nameTextEditingController),
                  SizedBox(width: AppSize.s20),
                  _getTextFieldWidget(AppStrings.username, _viewModel.outputErrorUsername,_usernameTextEditingController)
                ],
              ),
              SizedBox(height: AppSize.s14),
              _getImageSection(),
              SizedBox(height: AppSize.s14),
              _getRoleDropDown(),
              SizedBox(height: AppSize.s20),
              _getSectionTitle("Password"),
              SizedBox(height: AppSize.s14),
              _getTextFieldWidget(AppStrings.oldPassword, _viewModel.outputErrorOldPasswrd,_oldPasswordTextEditingController),
              SizedBox(height: AppSize.s14),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _getTextFieldWidget(AppStrings.newPassword, _viewModel.outputErrorNewPassword,_newPasswordTextEditingController),
                  SizedBox(width: AppSize.s20),
                  _getTextFieldWidget(AppStrings.confirmationNewPassword, _viewModel.outputErrorConfirmatioNewPassword,_confirmationPasswordTextEditingController)
                ],
              ), 
              SizedBox(height: AppSize.s30),
              _getSubmitButton()  
            ],
          ),
        ),
      ),
    );
  }

  _getSectionTitle(String title){
    return Text(title,style: getSemiBoldStyle(
      color: ColorManager.black, 
      fontSize:isMobile(context)?FontSize.s12:FontSize.s20));

  }

  Widget _getTextFieldWidget(String label,Stream<String?> errorStream,TextEditingController textEditingController){
    return Container(
      width: AppSize.s250,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FieldLabel(label,isRequired: true),
          StreamBuilder<String?>(
            stream: errorStream,
            builder: (context, snapshot) {
              return TextFormField(
                  keyboardType: TextInputType.text,
                  controller: textEditingController,
                  decoration: InputDecoration(
                      hintText: label,
                      errorText: snapshot.data));
            },
          ),
        ],
      ),
    );
  }

  Widget _getImageSection(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FieldLabel("Photo"),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ProfilePhoto(
              imageUrl: HiveHelper.getCurrentUser().image,
              setImage: (image)=> _viewModel.setImage(image), 
              imageStream: _viewModel.outputImage),
            SizedBox(width: AppSize.s24),
            ActionButton(onTap: () {
              startFilePicker((pickerFile)=>_viewModel.setImage(pickerFile));
            }, title: "Change", color: ColorManager.primary)
          ],
        )
      ],
    );
  }

  _getRoleDropDown(){
    return Container(
      width: AppSize.s250,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FieldLabel(AppStrings.role,isRequired: true),
          StreamBuilder<List<UserRole>>(
            stream: _viewModel.outputRoles,
            builder: (context, snapshot) {
              return DropdownSearch<UserRole>(
                mode: Mode.MENU,
                selectedItem: HiveHelper.getCurrentUser().role.toUserRoleEnum(),
                items: snapshot.data,
                itemAsString: (UserRole? userRole) => userRole!.toStr(),
                dropdownSearchDecoration: InputDecoration(hintText: AppStrings.role),
                onChanged: <UserRole>(value) {
                  _viewModel.setRole(value);
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _getSubmitButton(){
    return StreamBuilder<bool>(
      stream: _viewModel.outputIsValidToUpdate,
      builder: (context, snapshot) {
        return SizedBox(
          width: AppSize.s100,
          height: AppSize.s40,
          child: ElevatedButton(
              onPressed: (snapshot.data ?? false)? () =>_viewModel.updateMyAccount(context,): null,
              child: Text(AppStrings.save)),
        );
      },
    );
  }
}