import 'dart:async';

import 'package:cma_admin/app/functions.dart';
import 'package:cma_admin/domain/model/model.dart';
import 'package:cma_admin/domain/usecase/update_supplement_usecase.dart';
import 'package:cma_admin/presentation/base/baseviewmodel.dart';
import 'package:cma_admin/presentation/common/freezed_data_classes.dart';
import 'package:cma_admin/presentation/common/state_renderer/state_render_impl.dart';
import 'package:cma_admin/presentation/common/state_renderer/state_renderer.dart';
import 'package:cma_admin/presentation/resources/strings_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import '../../data/mapper/mapper.dart';

class UpdateSupplementViewModel extends BaseViewModel
    with UpdateSupplementViewModelInput, UpdateSupplementViewModelOutput {
  StreamController _colorStreamController = StreamController<Color>.broadcast();
  StreamController _priceStreamController = StreamController<String>.broadcast();
  StreamController _titleStreamController = StreamController<String>.broadcast();
  StreamController _imageStreamController = StreamController<PickerFile?>.broadcast();
  StreamController _isAllInputsValidStreamController = StreamController<bool>.broadcast();

  UpdateSupplementUseCase _updateSupplementUseCase;
  UpdateSupplementViewModel(this._updateSupplementUseCase);
  var updateSupplementViewObject = UpdateSupplementObject(EMPTY, EMPTY, null, EMPTY,EMPTY);

  @override
  void start() {
    inputState.add(ContentState());
  }

  init(Supplement supplement){
    setId(supplement.id.toString());
    setPrice(supplement.price.toString());
    setTitle(supplement.title);
    setColor(supplement.color);
  }

  @override
  void dispose() {
    _isAllInputsValidStreamController.close();
    _imageStreamController.close();
    _colorStreamController.close();
    _titleStreamController.close();
    _priceStreamController.close();
    super.dispose();
  }

  @override
  updateSupplement(BuildContext context) async {
    inputState.add(LoadingState(stateRendererType: StateRendererType.POPUP_LOADING_STATE));
    (await _updateSupplementUseCase.execute(UpdateSupplementUseCaseInput(
      updateSupplementViewObject.id,
      updateSupplementViewObject.color.toString(),
      updateSupplementViewObject.image,
      updateSupplementViewObject.price,
      updateSupplementViewObject.title,
    ))).fold(
    (failure) => inputState.add(ErrorState(StateRendererType.POPUP_ERROR_STATE, failure.message)), 
    (data) {
      inputState.add(ContentState());
      Navigator.of(context).pop();
      Navigator.of(context).pop();
    });
  }

  //  -- inputs
  @override
  setColor(Color color) {
    inputPickerColor.add(color);
    updateSupplementViewObject = updateSupplementViewObject.copyWith(color: colorToHex(color, includeHashSign: false));
  }

  @override
  setTitle(String title) {
    inputTitle.add(title);
    if (_isTitleValid(title)) {
      updateSupplementViewObject = updateSupplementViewObject.copyWith(title: title);
    } else {
      updateSupplementViewObject = updateSupplementViewObject.copyWith(title: "");
    }
    _validate();
  }

  @override
  setPrice(String price) {
    inputPrice.add(price);
    if (_isPriceValid(price)) {
      updateSupplementViewObject = updateSupplementViewObject.copyWith(price: price);
    } else {
      updateSupplementViewObject = updateSupplementViewObject.copyWith(price: "");
    }
    _validate();
  }

  setId(String id) {
    updateSupplementViewObject = updateSupplementViewObject.copyWith(id: id);
  }

  @override
  setImage(PickerFile file) {
    inputImage.add(file);
    updateSupplementViewObject = updateSupplementViewObject.copyWith(image: file);
    _validate();
  }

  @override
  Sink get inputPickerColor => _colorStreamController.sink;

  @override
  Sink get inputImage => _imageStreamController.sink;

  @override
  Sink get inputTitle => _titleStreamController.sink;

  @override
  Sink get inputPrice => _priceStreamController.sink;

  @override
  Sink get inputAllInputsValid => _isAllInputsValidStreamController.sink;

  // -- outputs

  @override
  Stream<Color> get outputPickerColor =>
      _colorStreamController.stream.map((color) => color);

  @override
  Stream<bool> get outputIsTitleValid =>
      _titleStreamController.stream.map((title) => _isTitleValid(title));

  @override
  Stream<String?> get outputErrorTitle => outputIsTitleValid
      .map((isTitleValid) => isTitleValid ? null : AppStrings.nameError);

  @override
  Stream<bool> get outputIsPriceValid =>
      _priceStreamController.stream.map((price) => _isPriceValid(price));

  @override
  Stream<String?> get outputErrorPrice => outputIsPriceValid
      .map((isPriceValid) => isPriceValid ? null : AppStrings.priceError);

  @override
  Stream<PickerFile?> get outputImage =>
      _imageStreamController.stream.map((file) => file);

  @override
  Stream<bool> get outputIsAllInputsValid =>
    _isAllInputsValidStreamController.stream.map((_) => _validateAllInputs());

  // -- private methods
  bool _isTitleValid(String title) {
    return title.isNotEmpty;
  }

  bool _isPriceValid(String price) {
    return isNumeric(price);
  }

  bool _validateAllInputs() {
    return updateSupplementViewObject.title.isNotEmpty &&
        updateSupplementViewObject.price.isNotEmpty;
  }

  _validate() {
    inputAllInputsValid.add(true);
  }
}

abstract class UpdateSupplementViewModelInput {
  updateSupplement(BuildContext context);
  setColor(Color color);

  setImage(PickerFile file);

  setPrice(String price);

  setTitle(String title);

  Sink get inputPickerColor;

  Sink get inputImage;

  Sink get inputPrice;

  Sink get inputTitle;

  Sink get inputAllInputsValid;
}

abstract class UpdateSupplementViewModelOutput {
  Stream<Color> get outputPickerColor;

  Stream<PickerFile?> get outputImage;

  Stream<bool> get outputIsPriceValid;

  Stream<String?> get outputErrorPrice;

  Stream<bool> get outputIsTitleValid;

  Stream<String?> get outputErrorTitle;

  Stream<bool> get outputIsAllInputsValid;
}
