
import 'package:cma_admin/app/di.dart';
import 'package:cma_admin/app/enum.dart';
import 'package:cma_admin/app/functions.dart';
import 'package:cma_admin/presentation/add_user/add_user_viewmodel.dart';
import 'package:cma_admin/presentation/common/state_renderer/state_render_impl.dart';
import 'package:cma_admin/presentation/components/custom_appbar.dart';
import 'package:cma_admin/presentation/components/custom_dropdown.dart';
import 'package:cma_admin/presentation/components/custom_submit_button.dart';
import 'package:cma_admin/presentation/components/custom_textfield.dart';
import 'package:cma_admin/presentation/components/image_picker_widget.dart';
import 'package:cma_admin/presentation/resources/color_manager.dart';
import 'package:cma_admin/presentation/resources/font_manager.dart';
import 'package:cma_admin/presentation/resources/strings_manager.dart';
import 'package:cma_admin/presentation/resources/styles_manager.dart';
import 'package:cma_admin/presentation/resources/values_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AddUserView extends StatefulWidget {
  const AddUserView({Key? key}) : super(key: key);

  @override
  _AddUserViewState createState() => _AddUserViewState();
}

class _AddUserViewState extends State<AddUserView> {
  AddUserViewModel _viewModel = instance<AddUserViewModel>();
  final _formKey = GlobalKey<FormState>();

  TextEditingController _userNameTextEditingController = TextEditingController();
  TextEditingController _nameTextEditingController = TextEditingController();
  TextEditingController _passwordEditingController = TextEditingController();

  @override
  void initState() {
    _bind();
    super.initState();
  }

  _bind() {
    _viewModel.start();
    _userNameTextEditingController.addListener(() {
      _viewModel.setUserName(_userNameTextEditingController.text);
    });

    _passwordEditingController.addListener(() {
      _viewModel.setPassword(_passwordEditingController.text);
    });

    _nameTextEditingController.addListener(() {
      _viewModel.setName(_nameTextEditingController.text);
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
                  _viewModel.register(context);
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
                  AppStrings.createUser,
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //image
                ImagePickerWidget(
                  setImage: (image)=>_viewModel.setProfilePicture(image), 
                  imageStream: _viewModel.outputProfilePicture),
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
                  selectedItem: UserRole.WAITER,
                  label: AppStrings.role, 
                  stream: _viewModel.outputRoles, 
                  itemAsString: (UserRole? role)=> role!.totr(), 
                  onTap: (role)=>_viewModel.setRole(role)),
                SizedBox(height: AppSize.s30),
                // username field
                CustomTextField(
                  width: double.infinity,
                  label: AppStrings.username, 
                  errorStream: _viewModel.outputErrorUserName, 
                  textEditingController: _userNameTextEditingController),
                SizedBox(height: AppSize.s30),
                // password field
                CustomTextField(
                  width: double.infinity,
                  label: AppStrings.password, 
                  errorStream: _viewModel.outputErrorPassword, 
                  textEditingController: _passwordEditingController),
                SizedBox(height: AppSize.s40),
                CustomSubmitButton(
                  width: double.infinity,
                  isAllInputValidStream: _viewModel.outputIsAllInputsValid, 
                  onTap: ()=>_viewModel.register(context), 
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
