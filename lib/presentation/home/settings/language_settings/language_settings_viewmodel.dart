
import 'dart:async';
import 'package:cma_admin/app/app_prefs.dart';
import 'package:cma_admin/app/di.dart';
import 'package:cma_admin/presentation/base/baseviewmodel.dart';
import 'package:cma_admin/presentation/resources/language_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/material.dart';

class LanguageSettingsViewModel extends BaseViewModel with LanguageSettingsViewModelInput,LanguageSettingsViewModelOutput{
  StreamController _selectedLanguageStreamController = BehaviorSubject<LanguageType>();
  AppPreferences _appPreferences;
  LanguageSettingsViewModel(this._appPreferences);

  @override
  void start() async{
    String language = await _appPreferences.getAppLanguage();
    setLanguage(language.toLanguageType());
  }

  @override
  void dispose() {
    _selectedLanguageStreamController.close();
    super.dispose();
  }

  @override
  changeLanguage(BuildContext context,LanguageType languageType) async{
    _appPreferences.setLanguageChanged(languageType);
    resetModules();
    Phoenix.rebirth(context);
  }

  @override
  setLanguage(LanguageType languageType) {
    inputSelectedLanguage.add(languageType);   
  }

  @override
  Sink get inputSelectedLanguage => _selectedLanguageStreamController.sink;
  
  @override
  Stream<LanguageType> get outputSelectedLanguage => 
    _selectedLanguageStreamController.stream.map((selectedLanguage) => selectedLanguage);
  
}

abstract class LanguageSettingsViewModelInput{
  changeLanguage(BuildContext context,LanguageType languageType);
  setLanguage(LanguageType languageType);
  Sink get inputSelectedLanguage;
}

abstract class LanguageSettingsViewModelOutput {
  Stream<LanguageType> get outputSelectedLanguage;
}