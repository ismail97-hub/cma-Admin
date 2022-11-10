import 'package:cma_admin/app/di.dart';
import 'package:cma_admin/data/mapper/mapper.dart';
import 'package:cma_admin/presentation/home/settings/account_settings/account_settings_view.dart';
import 'package:cma_admin/presentation/home/settings/components/settings_side_nav.dart';
import 'package:cma_admin/presentation/home/settings/settings_viewmodel.dart';
import 'package:cma_admin/presentation/resources/strings_manager.dart';
import 'package:cma_admin/presentation/update_info/update_info_view.dart';
import 'package:flutter/material.dart';


class SettingsView extends StatefulWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  SettingsViewModel _viewModel = instance<SettingsViewModel>();
  List _views = [
    AccountSettingsView(),
    UpdateInfoView(),
    Center(child: Text(AppStrings.language)),
  ];

  _bind(){

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
    return StreamBuilder<int>(
      stream: _viewModel.outputCurrentIndex,
      builder: (context, snapshot) {
        int currentIndex = snapshot.data??ZERO;
        return Row(
          children: [
            SettingsSideNav(currentIndex: currentIndex, onTap: (index)=>_viewModel.onTap(index)),
            Expanded(child: _views.elementAt(currentIndex))
          ],
        );
      }
    );
  }
}