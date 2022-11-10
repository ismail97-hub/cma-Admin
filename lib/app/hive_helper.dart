import 'package:hive_flutter/hive_flutter.dart';

import '../domain/model/model.dart';
import 'constant.dart';

class HiveHelper {

  static init() async{
    await Hive.initFlutter();
    Hive.registerAdapter<User>(UserAdapter());
    await Hive.openBox<User>(Constant.userBox);
  }
  
  static User getCurrentUser(){
    return Hive.box<User>(Constant.userBox).getAt(0)??User.empty();
  }
  
  static signIn(User user)async{
    var box = Hive.box<User>(Constant.userBox);
    box.add(user);
  }

  static update(User user)async{
    var box = Hive.box<User>(Constant.userBox);
    box.putAt(0, user);
  }
   
  static logout()async{
    var box = Hive.box<User>(Constant.userBox);
    box.clear();
  }
}