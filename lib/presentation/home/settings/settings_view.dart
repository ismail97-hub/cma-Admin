import 'package:cma_admin/app/di.dart';
import 'package:cma_admin/app/functions.dart';
import 'package:cma_admin/data/mapper/mapper.dart';
import 'package:cma_admin/presentation/home/settings/account_settings/account_settings_view.dart';
import 'package:cma_admin/presentation/home/settings/components/settings_side_nav.dart';
import 'package:cma_admin/presentation/home/settings/info_settings/info_settings_view.dart';
import 'package:cma_admin/presentation/home/settings/language_settings/language_settings_view.dart';
import 'package:cma_admin/presentation/home/settings/settings_viewmodel.dart';
import 'package:cma_admin/presentation/resources/color_manager.dart';
import 'package:cma_admin/presentation/resources/font_manager.dart';
import 'package:cma_admin/presentation/resources/icon_manager.dart';
import 'package:cma_admin/presentation/resources/strings_manager.dart';
import 'package:cma_admin/presentation/resources/styles_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';


class SettingsView extends StatefulWidget {
  SettingsView({Key? key}) : super(key: key);

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> with TickerProviderStateMixin {
  SettingsViewModel _viewModel = instance<SettingsViewModel>();
  late TabController _tabController;
  List<Widget> _views = [
    AccountSettingsView(),
    InfoSettingsView(),
    LanguageSettingsView()
  ];

  _bind(){
    _tabController= TabController(length: 3, vsync: this);
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
    return isMobile(context)?_getTabView():_getSideNavigation();
  }

  Widget _getSideNavigation(){
    return StreamBuilder<int>(
      stream: _viewModel.outputCurrentIndex,
      builder: (context, snapshot) {
        int currentIndex = snapshot.data??ZERO;
        return Row(
          children: [
            SettingsSideNav(currentIndex: currentIndex, onTap: (index){
              _viewModel.onTap(index);
              _tabController.animateTo(index);  
            }),
            Expanded(child: _views.elementAt(currentIndex))
          ],
        );
      }
    );
  }

  Widget _getTabView(){
    return Scaffold(
      appBar: AppBar(
          backgroundColor: ColorManager.white,
          elevation: ZEROD,
          bottom: TabBar(
            onTap: (index)=>_viewModel.onTap(index),
            controller: _tabController,
            labelColor: ColorManager.black,
            unselectedLabelColor: ColorManager.lightGrey,
            indicatorColor: ColorManager.black,
            tabs: [
              Tab(icon: Icon(IconManger.account)),
              Tab(icon: Icon(IconManger.info)),
              Tab(icon: Icon(IconManger.language)),
            ],
          ),
          titleTextStyle: getSemiBoldStyle(color: ColorManager.black,fontSize: FontSize.s24),
          centerTitle: false,
          title: Text(AppStrings.settings).tr(),
        ),
        body: TabBarView(
          controller: _tabController,
          children: _views
        ),
    );
  }
}