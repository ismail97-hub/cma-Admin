import 'package:cma_admin/presentation/common/state_renderer/state_render_impl.dart';
import 'package:flutter/material.dart';
import '../../app/di.dart';
import '../../app/functions.dart';
import '../components/field_label.dart';
import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/strings_manager.dart';
import '../resources/styles_manager.dart';
import '../resources/values_manager.dart';
import 'update_info_viewmodel.dart';

class UpdateInfoView extends StatefulWidget {
  const UpdateInfoView({Key? key}) : super(key: key);

  @override
  State<UpdateInfoView> createState() => _UpdateInfoViewState();
}

class _UpdateInfoViewState extends State<UpdateInfoView> {
  UpdateInfoViewModel _viewModel = instance<UpdateInfoViewModel>();
  final _formKey = GlobalKey<FormState>();

  _bind() {
    _viewModel.start();
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
          return snapshot.data?.getScreenWidget(
                  context, _getContentScreenWidget(), () => _bind()) ??
              _getContentScreenWidget();
        });
  }

  Widget _getContentScreenWidget() {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: AppPadding.p40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //title
                Text(
                  AppStrings.updateInfo,
                  style: getSemiBoldStyle(
                      color: ColorManager.black, fontSize: FontSize.s24),
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
          padding: EdgeInsets.symmetric(
              horizontal: AppPadding.p20, vertical: AppPadding.p30),
          width: isMobile(context) ? AppSize.s400 : AppSize.s600,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // address field
                FieldLabel(AppStrings.address, isRequired: true),
                StreamBuilder<String?>(
                  stream: _viewModel.outputErrorAddress,
                  builder: (context, snapshot) {
                    return TextFormField(
                        keyboardType: TextInputType.text,
                        controller: _viewModel.addressEditingController,
                        decoration: InputDecoration(
                            hintText: AppStrings.address,
                            errorText: snapshot.data));
                  },
                ),
                SizedBox(height: AppSize.s30),
                // telephone field
                FieldLabel(AppStrings.telephone, isRequired: true),
                StreamBuilder<String?>(
                  stream: _viewModel.outputErrorTelephone,
                  builder: (context, snapshot) {
                    return TextFormField(
                        keyboardType: TextInputType.text,
                        controller: _viewModel.telephoneEditingController,
                        decoration: InputDecoration(
                            hintText: AppStrings.telephone,
                            errorText: snapshot.data));
                  },
                ),
                SizedBox(height: AppSize.s30),
                // wifi password field
                FieldLabel(AppStrings.wifiPassword, isRequired: true),
                StreamBuilder<String?>(
                  stream: _viewModel.outputErrorWifiPassword,
                  builder: (context, snapshot) {
                    return TextFormField(
                        keyboardType: TextInputType.text,
                        controller: _viewModel.wifiPasswordEditingController,
                        decoration: InputDecoration(
                            hintText: AppStrings.wifiPassword,
                            errorText: snapshot.data));
                  },
                ),
                SizedBox(height: AppSize.s40),
                StreamBuilder<bool>(
                  stream: _viewModel.outputIsValidToUpdate,
                  builder: (context, snapshot) {
                    return SizedBox(
                      width: double.infinity,
                      height: AppSize.s40,
                      child: ElevatedButton(
                          onPressed: (snapshot.data ?? false)
                              ? () {_viewModel.updateInfo(context);}
                              : null,
                          child: Text(AppStrings.update)),
                    );
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
