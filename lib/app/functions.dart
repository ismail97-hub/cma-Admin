import 'dart:typed_data';
import 'package:cma_admin/presentation/resources/language_manager.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import '../domain/model/model.dart';
import '../presentation/resources/routes_manager.dart';
import 'app_prefs.dart';
import 'di.dart';
import 'hive_helper.dart';

bool isNumeric(String num) {
  return RegExp(r'^-?[0-9]+$').hasMatch(num);
}

dateFormat(String date){
  DateTime tempDate = DateFormat("yyyy-MM-ddThh:mm").parse(date);
  var inputDate = DateTime.parse(tempDate.toString());
  var outputDate =  DateFormat('dd MMMM yyyy HH:mm',HiveHelper.getLanguage().getValue()).format(inputDate);
  return arabicNumberToEnglish(outputDate);
}

dateToStringFormat(DateTime? dateTime) {
  return DateFormat('yyyy-MM-dd').format(dateTime!);
}

dateToStringFormat2(DateTime? dateTime){
  return arabicNumberToEnglish(DateFormat('dd MMMM yyyy',HiveHelper.getLanguage().getValue()).format(dateTime!));
}

arabicNumberToEnglish(String text){
  const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
  const arabic = ['\u0660', '\u0661', '\u0662', '\u0663', '\u0664', '\u0665', '\u0666', '\u0667', '\u0668', '\u0669'];

  for (int i = 0; i < arabic.length; i++) {
    text = text.replaceAll(arabic[i], english[i]);
  }
  return text;
}

logout(BuildContext context,AppPreferences appPreferences){
  appPreferences.logout();
  HiveHelper.logout();
  resetModules();
  Navigator.pushNamedAndRemoveUntil(
      context, Routes.loginRoute, ModalRoute.withName('/'),
      arguments: 0);
}

startFilePicker(Function(PickerFile) setImage) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    Uint8List byte = result!.files.first.bytes!;
    String extension = result.files.first.extension!;
    setImage.call(PickerFile(byte, extension));
}

bool isMobile(BuildContext context) => MediaQuery.of(context).size.width < 700;
bool isTab(BuildContext context) =>
    MediaQuery.of(context).size.width < 1300 &&
    MediaQuery.of(context).size.width >= 700;
bool isDesktop(BuildContext context) =>
    MediaQuery.of(context).size.width >= 1300;
