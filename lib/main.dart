import 'package:cma_admin/app/di.dart';
import 'package:cma_admin/app/hive_helper.dart';
import 'package:cma_admin/presentation/resources/language_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'app/app.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:easy_localization/easy_localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModule();
  await HiveHelper.init();
  await EasyLocalization.ensureInitialized();
  setUrlStrategy(PathUrlStrategy());
  runApp(EasyLocalization(
    supportedLocales: [FRENCH_LOCAL,ARABIC_LOCAL,ENGLISH_LOCAL],
    path: ASSETS_PATH_LOCALISATIONS,
    child: Phoenix(child: MyApp())));
}
