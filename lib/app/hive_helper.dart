import 'package:cma_admin/presentation/resources/language_manager.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../domain/model/model.dart';
import 'constant.dart';

class HiveHelper {

  static init() async{
    await Hive.initFlutter();
    Hive.registerAdapter<User>(UserAdapter());
    await Hive.openBox<User>(Constant.userBox);
    Hive.registerAdapter<Info>(InfoAdapter());
    await Hive.openBox<Info>(Constant.infoBox);
    await Hive.openBox<String>(Constant.languageBox);
  }
  
  static User getCurrentUser(){
    return Hive.box<User>(Constant.userBox).getAt(0)??User.empty();
  }
  
  static signIn(User user)async{
    var box = Hive.box<User>(Constant.userBox);
    box.add(user);
  }

  static updateMYAccount(User user)async{
    var box = Hive.box<User>(Constant.userBox);
    box.putAt(0, user);
  }
   
  //info
  static Info? getInfo(){
    var box = Hive.box<Info>(Constant.infoBox);
    if (box.length!=0) {
      return box.getAt(0)??Info.empty();
    } else {
      return null;
    }
  }

  static addInfo(Info info){
    var box = Hive.box<Info>(Constant.infoBox);
    box.add(info);
  }

  static updateInfo(Info info)async{
    var box = Hive.box<Info>(Constant.infoBox);
    box.putAt(0, info);
  }

  static logout()async{
    var userBox = Hive.box<User>(Constant.userBox);
    var infoBox = Hive.box<Info>(Constant.infoBox);
    userBox.clear();
    infoBox.clear();
  }

  //language
  static LanguageType getLanguage(){
    var box = Hive.box<String>(Constant.languageBox);
    if(box.isNotEmpty){
      return (box.get(0)??ENGLISH).toLanguageType();
    }else{
      return LanguageType.ENGLISH;
    }
  }

  static setLanguage(LanguageType languageType){
    var box = Hive.box<String>(Constant.languageBox);
    if (box.isEmpty) {
      box.add(languageType.getValue());
    } else {
      box.putAt(0,languageType.getValue());      
    }
  }
}