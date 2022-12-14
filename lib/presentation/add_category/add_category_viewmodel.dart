import 'dart:async';
import 'package:cma_admin/domain/model/model.dart';
import 'package:cma_admin/domain/usecase/add_category_usecase.dart';
import 'package:cma_admin/presentation/base/baseviewmodel.dart';
import 'package:cma_admin/presentation/common/freezed_data_classes.dart';
import 'package:cma_admin/presentation/common/state_renderer/state_render_impl.dart';
import 'package:cma_admin/presentation/common/state_renderer/state_renderer.dart';
import 'package:cma_admin/presentation/resources/color_manager.dart';
import 'package:cma_admin/presentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import '../../data/mapper/mapper.dart';

class AddCategoryViewModel extends BaseViewModel
    with AddCategoryViewModelInput, AddCategoryViewModelOutput {
  StreamController _colorStreamController = StreamController<Color>.broadcast();
  StreamController _imageStreamController = StreamController<PickerFile?>.broadcast();
  StreamController _labelStreamController = StreamController<String>.broadcast();
  StreamController _isAllInputsValidStreamController = StreamController<void>.broadcast();
 
  AddCategoryUseCase _addCategoryUseCase;
  AddCategoryViewModel(this._addCategoryUseCase);

  var addCategoryViewObject = AddCategoryObject(ColorManager.grey.value.toRadixString(16), null, EMPTY);


  @override
  void start() {
    inputState.add(ContentState());
  }

  @override
  addCategory(BuildContext context) async {
    inputState.add(LoadingState(stateRendererType: StateRendererType.POPUP_LOADING_STATE));
    (await _addCategoryUseCase.execute(AddCategoryUseCaseInput(
      addCategoryViewObject.color,
      addCategoryViewObject.image,
      addCategoryViewObject.label,
    ))).fold(
    (failure) => inputState.add(ErrorState(StateRendererType.POPUP_ERROR_STATE, failure.message)), 
    (data) {
      inputState.add(ContentState());
      Navigator.of(context).pop();
      Navigator.of(context).pop();
    });
  }

  @override
  void dispose() {
    _isAllInputsValidStreamController.close();
    _imageStreamController.close();
    _colorStreamController.close();
    _labelStreamController.close();

    super.dispose();
  }

  //  -- inputs
  @override
  setColor(Color color) {
    inputPickerColor.add(color);
    addCategoryViewObject = addCategoryViewObject.copyWith(color: colorToHex(color, includeHashSign: false));
  }

  @override
  setLabel(String label) {
    inputLabel.add(label);
    if (_isLabelValid(label)) {
      addCategoryViewObject = addCategoryViewObject.copyWith(label: label);
    } else {
      addCategoryViewObject = addCategoryViewObject.copyWith(label: "");
    }
    _validate();
  }

  @override
  setImage(PickerFile file) {
    inputImage.add(file);
    addCategoryViewObject = addCategoryViewObject.copyWith(image: file);
    _validate();
  }

  @override
  Sink get inputPickerColor => _colorStreamController.sink;

  @override
  Sink get inputImage => _imageStreamController.sink;

  @override
  Sink get inputLabel => _labelStreamController.sink;

  @override
  Sink get inputAllInputsValid => _isAllInputsValidStreamController.sink;

  // -- outputs

  @override
  Stream<Color> get outputPickerColor =>
      _colorStreamController.stream.map((color) => color);

  @override
  Stream<bool> get outputIsLabelValid =>
      _labelStreamController.stream.map((label) => _isLabelValid(label));

  @override
  Stream<String?> get outputErrorLabel => outputIsLabelValid
      .map((isLabelValid) => isLabelValid ? null : AppStrings.nameError);

  @override
  Stream<PickerFile?> get outputImage =>
      _imageStreamController.stream.map((file) => file);

  @override
  Stream<bool> get outputIsAllInputsValid =>
      _isAllInputsValidStreamController.stream.map((_) => _validateAllInputs());

  // -- private methods
  bool _isLabelValid(String label) {
    return label.length > 0;
  }

  bool _validateAllInputs() {
    return addCategoryViewObject.label.isNotEmpty;
  }

  _validate() {
    inputAllInputsValid.add(null);
  }
}

abstract class AddCategoryViewModelInput {
  addCategory(BuildContext context);

  setColor(Color color);

  setImage(PickerFile file);

  setLabel(String label);

  Sink get inputPickerColor;

  Sink get inputImage;

  Sink get inputLabel;

  Sink get inputAllInputsValid;
}

abstract class AddCategoryViewModelOutput {
  Stream<Color> get outputPickerColor;

  Stream<PickerFile?> get outputImage;

  Stream<bool> get outputIsLabelValid;

  Stream<String?> get outputErrorLabel;

  Stream<bool> get outputIsAllInputsValid;
}
