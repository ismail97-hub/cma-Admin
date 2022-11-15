import 'package:cma_admin/app/di.dart';
import 'package:cma_admin/presentation/components/headar_text.dart';
import 'package:cma_admin/presentation/home/settings/language_settings/language_settings_viewmodel.dart';
import 'package:cma_admin/presentation/resources/language_manager.dart';
import 'package:cma_admin/presentation/resources/strings_manager.dart';
import 'package:cma_admin/presentation/resources/values_manager.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LanguageSettingsView extends StatefulWidget {
  const LanguageSettingsView({Key? key}) : super(key: key);

  @override
  State<LanguageSettingsView> createState() => _LanguageSettingsViewState();
}

class _LanguageSettingsViewState extends State<LanguageSettingsView> {
  LanguageSettingsViewModel _viewModel = instance<LanguageSettingsViewModel>();
  _bind(){
    _viewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
     return StreamBuilder<LanguageType>(
        stream: _viewModel.outputSelectedLanguage,
        builder: (context, snapshot) {
         LanguageType? languageType = snapshot.data;
         return Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: AppPadding.p20,vertical: AppPadding.p10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderText(AppStrings.language.tr()),
                SizedBox(height: AppSize.s20),
                // Name
                SizedBox(
                  width: AppSize.s250,
                  child: DropdownSearch<LanguageType>(
                    mode: Mode.MENU,
                    selectedItem: languageType,
                    items: LanguageType.values,
                    itemAsString: (LanguageType? language)=> language!.getTitle().tr(),
                    dropdownSearchDecoration: InputDecoration(hintText: AppStrings.language.tr()),
                    onChanged: (value) { 
                      _viewModel.setLanguage(value!);
                    },
                  ),
                ),
                SizedBox(height: AppSize.s30),
                // Submit button
                SizedBox(
                  width: AppSize.s100,
                  height: AppSize.s40,
                  child: ElevatedButton(
                      onPressed: ()=>_viewModel.changeLanguage(context, languageType!),
                      child: Text(AppStrings.save).tr()),
                ) 
              ],
            ),
          ),
         );
       }
     );
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}