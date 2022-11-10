
import 'dart:async';

import 'package:rxdart/rxdart.dart';

import '../../base/baseviewmodel.dart';

class SettingsViewModel extends BaseViewModel with SettingsViewModelInput,SettingsViewModelOutput{
  StreamController _currentIndexStreamController = BehaviorSubject<int>();

  @override
  void start() {
  }

  @override
  void dispose() {
    _currentIndexStreamController.close();
    super.dispose();
  }
  
  onTap(int index){
    inputCurrentIndex.add(index);
  }

  @override
  Sink get inputCurrentIndex => _currentIndexStreamController.sink;
  
  @override
  Stream<int> get outputCurrentIndex => _currentIndexStreamController.stream.map((currentIndex) => currentIndex);
}

abstract class SettingsViewModelInput {
  onTap(int index);
  Sink get inputCurrentIndex;
}

abstract class SettingsViewModelOutput {
  Stream<int> get outputCurrentIndex;
}