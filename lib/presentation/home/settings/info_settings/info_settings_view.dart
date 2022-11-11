import 'package:cma_admin/app/hive_helper.dart';
import 'package:cma_admin/presentation/common/state_renderer/state_render_impl.dart';
import 'package:cma_admin/presentation/components/custom_textfield.dart';
import 'package:cma_admin/presentation/components/field_label.dart';
import 'package:cma_admin/presentation/home/settings/info_settings/info_settings_viewmodel.dart';
import 'package:cma_admin/presentation/resources/color_manager.dart';
import 'package:cma_admin/presentation/resources/font_manager.dart';
import 'package:cma_admin/presentation/resources/styles_manager.dart';
import 'package:flutter/material.dart';
import '../../../../app/di.dart';
import '../../../../domain/model/model.dart';
import '../../../components/custom_submit_button.dart';
import '../../../components/headar_text.dart';
import '../../../resources/strings_manager.dart';
import '../../../resources/values_manager.dart';

class InfoSettingsView extends StatefulWidget {
  const InfoSettingsView({Key? key}) : super(key: key);

  @override
  State<InfoSettingsView> createState() => _InfoSettingsViewState();
}

class _InfoSettingsViewState extends State<InfoSettingsView> {
  InfoSettingsViewModel _viewModel = instance<InfoSettingsViewModel>();
  TextEditingController _addressEditingController = TextEditingController();
  TextEditingController _telephoneEditingController = TextEditingController();
  TextEditingController _wifiPasswordEditingController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  

  _bind() {
    _viewModel.start();
    Info info = HiveHelper.getInfo(); 
    _addressEditingController.text = info.address;
    _telephoneEditingController.text = info.telephone;
    _wifiPasswordEditingController.text = info.wifiPassword;
    _addressEditingController.addListener(() { 
      _viewModel.setAddress(_addressEditingController.text);
    });
    
    _telephoneEditingController.addListener(() { 
      _viewModel.setTelephone(_telephoneEditingController.text);
    });
    
    _wifiPasswordEditingController.addListener(() { 
      _viewModel.setWifiPassword(_wifiPasswordEditingController.text);
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
          return snapshot.data?.getScreenWidget(context, _getContentScreenWidget(), () => _bind()) ??_getContentScreenWidget();
        });
  }

  Widget _getContentScreenWidget() {
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
              HeaderText(AppStrings.info),
              SizedBox(height: AppSize.s20),
              // Name
              FieldLabel(AppStrings.name),
              Text(HiveHelper.getInfo().name,style: getMediumStyle(color: ColorManager.black,fontSize: FontSize.s18)),
              SizedBox(height: AppSize.s14),
              // Addrese
              CustomTextField(
                label: AppStrings.address, 
                errorStream: _viewModel.outputErrorAddress, 
                textEditingController: _addressEditingController),
              SizedBox(height: AppSize.s14),
              // Telephone
              CustomTextField(
                label: AppStrings.telephone, 
                errorStream: _viewModel.outputErrorTelephone, 
                textEditingController: _telephoneEditingController),
              SizedBox(height: AppSize.s14),
              // Wifi password
              CustomTextField(
                label: AppStrings.wifiPassword, 
                errorStream: _viewModel.outputErrorWifiPassword, 
                textEditingController: _wifiPasswordEditingController),
              SizedBox(height: AppSize.s30),
              // Submit button
              CustomSubmitButton(
                buttonText: AppStrings.save, 
                isAllInputValidStream: _viewModel.outputIsValidToUpdate, 
                onTap: ()=>_viewModel.updateInfo(context))  
            ],
          ),
        ),
      ),
    );
  }
}
