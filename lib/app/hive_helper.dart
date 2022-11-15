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
}