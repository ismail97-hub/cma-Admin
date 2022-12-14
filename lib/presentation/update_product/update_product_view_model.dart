import 'dart:async';

import 'package:cma_admin/app/functions.dart';
import 'package:cma_admin/data/mapper/mapper.dart';
import 'package:cma_admin/domain/model/model.dart';
import 'package:cma_admin/domain/usecase/update_product_usecase.dart';
import 'package:cma_admin/presentation/base/baseviewmodel.dart';
import 'package:cma_admin/presentation/common/freezed_data_classes.dart';
import 'package:cma_admin/presentation/common/state_renderer/state_render_impl.dart';
import 'package:cma_admin/presentation/common/state_renderer/state_renderer.dart';
import 'package:cma_admin/presentation/resources/strings_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:rxdart/rxdart.dart';

class UpdateProductViewModel extends BaseViewModel
    with UpdateProductViewModelInput, UpdateProductViewModelOutput {
  final _categorieStreamController = BehaviorSubject<List<Category>>();
  StreamController _colorStreamController = StreamController<Color>.broadcast();
  StreamController _priceStreamController = StreamController<String>.broadcast();
  StreamController _titleStreamController = StreamController<String>.broadcast();
  StreamController _categoryIdStreamController = StreamController<String>.broadcast();
  StreamController _imageStreamController = StreamController<PickerFile?>.broadcast();
  StreamController _isAllInputsValidStreamController = StreamController<bool>.broadcast();
  
  UpdateProductUseCase _updateProductUseCase;
  UpdateProductViewModel(this._updateProductUseCase);

  var updateProductViewObject = UpdateProductObject(EMPTY, EMPTY, EMPTY, null,EMPTY,EMPTY);
  @override
  void start() {
    inputState.add(ContentState());
    loadCategory();
  }

  init(Product product){
    setId(product.id.toString());
    setTitle(product.title);
    setColor(product.color);
    setCategoryId(product.category!.id.toString());
    setPrice(product.price.toString());
  }

  @override
  updateProduct(BuildContext context) async {
    inputState.add(LoadingState(stateRendererType: StateRendererType.POPUP_LOADING_STATE));
    (await _updateProductUseCase.execute(UpdateProductUseCaseInput(
      updateProductViewObject.id,
      updateProductViewObject.categoryId,
      updateProductViewObject.color.toString(),
      updateProductViewObject.image,
      updateProductViewObject.price,
      updateProductViewObject.title,
    ))).fold(
    (failure) => inputState.add(ErrorState(StateRendererType.POPUP_ERROR_STATE, failure.message)), 
    (data) {
      inputState.add(ContentState());
      Navigator.of(context).pop();
      Navigator.of(context).pop();
    });
  }

  loadCategory() async {
    inputState.add(LoadingState(stateRendererType: StateRendererType.FULL_SCREEN_LOADING_STATE));
    (await _updateProductUseCase.getCategories(EMPTY)).fold(
      (failure)=>inputState.add(ErrorState(StateRendererType.FULL_SCREEN_ERROR_STATE, failure.message)),
      (categories) async {
        inputState.add(ContentState());
        inputCategories.add(categories);
      },
    );
  }

  @override
  void dispose() {
    _imageStreamController.close();
    _colorStreamController.close();
    _titleStreamController.close();
    _priceStreamController.close();
    _categoryIdStreamController.close();
    _isAllInputsValidStreamController.close();
    _categorieStreamController.close();
    super.dispose();
  }

  //  -- inputs
  @override
  setColor(Color color) {
    inputPickerColor.add(color);
    updateProductViewObject = updateProductViewObject.copyWith(color: colorToHex(color, includeHashSign: false));
  }

  @override
  setTitle(String title) {
    inputTitle.add(title);
    if (_isTitleValid(title)) {
      updateProductViewObject = updateProductViewObject.copyWith(title: title);
    } else {
      updateProductViewObject = updateProductViewObject.copyWith(title: "");
    }
    _validate();
  }

  @override
  setPrice(String price) {
    inputPrice.add(price);
    if (_isPriceValid(price)) {
      updateProductViewObject = updateProductViewObject.copyWith(price: price);
    } else {
      updateProductViewObject = updateProductViewObject.copyWith(price: "");
    }
    _validate();
  }

  @override
  setCategoryId(String id) {
    inputCategoryId.add(id);
    if (_isCategoryIdValid(id)) {
      updateProductViewObject =
          updateProductViewObject.copyWith(categoryId: id);
    } else {
      updateProductViewObject =
          updateProductViewObject.copyWith(categoryId: "");
    }
    _validate();
  }

  @override
  setImage(PickerFile file) {
    inputImage.add(file);
    updateProductViewObject = updateProductViewObject.copyWith(image: file);
    _validate();
  }

  setId(String id) {
    updateProductViewObject = updateProductViewObject.copyWith(id: id);
  }

  @override
  Sink get inputPickerColor => _colorStreamController.sink;

  @override
  Sink get inputCategoryId => _categoryIdStreamController.sink;

  @override
  Sink get inputImage => _imageStreamController.sink;

  @override
  Sink get inputTitle => _titleStreamController.sink;

  @override
  Sink get inputPrice => _priceStreamController.sink;

  @override
  Sink get inputAllInputsValid => _isAllInputsValidStreamController.sink;

  @override
  Sink get inputCategories => _categorieStreamController.sink;

  // -- outputs

  @override
  Stream<Color> get outputPickerColor =>
      _colorStreamController.stream.map((color) => color);

  @override
  Stream<String> get outputCategoryId =>
      _categoryIdStreamController.stream.map((categoryId) => categoryId);

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

  @override
  Stream<List<Category>> get outputCategories =>
      _categorieStreamController.stream.map((categories) => categories);

  // -- private methods
  bool _isTitleValid(String title) {
    return title.isNotEmpty;
  }

  bool _isPriceValid(String price) {
    return isNumeric(price);
  }

  bool _isCategoryIdValid(String id) {
    return id.isNotEmpty;
  }

  bool _validateAllInputs() {
    return updateProductViewObject.title.isNotEmpty &&
        updateProductViewObject.categoryId.toString().isNotEmpty &&
        updateProductViewObject.price.toString().isNotEmpty;
  }

  _validate() {
    inputAllInputsValid.add(true);
  }
}

abstract class UpdateProductViewModelInput {
  updateProduct(BuildContext context);

  setColor(Color color);

  setImage(PickerFile file);

  setCategoryId(String id);

  setPrice(String price);

  setTitle(String title);

  Sink get inputPickerColor;

  Sink get inputImage;

  Sink get inputPrice;

  Sink get inputCategoryId;

  Sink get inputTitle;

  Sink get inputAllInputsValid;

  Sink get inputCategories;
}

abstract class UpdateProductViewModelOutput {
  Stream<Color> get outputPickerColor;

  Stream<PickerFile?> get outputImage;

  Stream<String?> get outputCategoryId;

  Stream<bool> get outputIsPriceValid;

  Stream<String?> get outputErrorPrice;

  Stream<bool> get outputIsTitleValid;

  Stream<String?> get outputErrorTitle;

  Stream<bool> get outputIsAllInputsValid;

  Stream<List<Category>> get outputCategories;
}
