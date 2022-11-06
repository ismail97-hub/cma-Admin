import 'package:cma_admin/data/network/app_api.dart';
import 'package:cma_admin/data/request/request.dart';
import 'package:cma_admin/data/responses/responses.dart';

abstract class RemoteDataSource {
  Future<SignInResponse> signIn(String userName, String password);
  Future<List<CategoryResponse>> getAllCategory();
  Future<List<ProductResponse>> getAllProduct();
  Future<List<SupplementResponse>> getAllSupplement();
  Future<List<UserResponse>> getAllUser();
  Future<bool> activeToggle(String type, String id);
  Future<HomeResponse> home();
  Future<List<ProductResponse>> getProductsByCategory(String id);
  Future<List<SupplementResponse>> getSupplemensByProduct(String id);
  Future<List<SupplementResponse>> getSupplementsForAdd(String id);
  Future<ProductResponse> addSupplementsToProduct(String productId, String suppsId);
  Future<void> deleteSupplementsToProduct(String productId, String suppId);
  Future<SignInResponse> addUser(AddUserRequest addUserRequest);
  Future<UserResponse> updateUser(UpdateUserRequest updateUserRequest);
  Future<CategoryResponse> addCategory(AddCategoryRequest addCategoryRequest);
  Future<ProductResponse> addProduct(AddProductRequest addProductRequest);
  Future<SupplementResponse> addSupplement( AddSupplementRequest addSupplementRequest);
  Future<SupplementResponse> updateSupplement(UpdateSupplementRequest updateSupplementRequest);
  Future<bool> delete(String type, String id);
  Future<CategoryResponse> updateCategory(UpdateCategoryRequest updateCategoryRequest);
  Future<ProductResponse> updateProduct(UpdateProductRequest updateProductRequest);
  Future<void> print(String id);
  Future<void> reorder(String type,String id1,String id2);
  Future<AllWaitersInsightsResponse> getAllWaitersInsights(String date1,String date2);
  Future<WaiterInsightsResponse> getWaiterInsights(String date1,String date2,String id);
  Future<OrdersInsightsResponse> getOrdersInsights(String date1,String date2,String pageIndex);
  Future<List<CategoryCountResponse>> getCategoriesQuantityConsumed(String date1,String date2);
  Future<List<ProductCountResponse>> getProductsQuantityConsumedByCategory(String date1,String date2,String categoryId);
  Future<List<OrderResponse>> getOrdersByState(String status);
  Future<void> acceptCancelOrder(String id);
  Future<void> rejectCancelOrder(String id);
  Future<int> getNumberOrdersByState(String status);
  Future<InfoResponse> getInfo();
  Future<InfoResponse> updateInfo(String telephone,String address,String wifiPassword);
}

class RemoteDataSourceImplementer implements RemoteDataSource {
  AppServiceClient _appServiceClient;

  RemoteDataSourceImplementer(this._appServiceClient);

  @override
  Future<SignInResponse> signIn(String userName, String password) async {
    return await _appServiceClient.signIn(
        username: userName, password: password);
  }

  @override
  Future<List<CategoryResponse>> getAllCategory() {
    return _appServiceClient.getAllCategory();
  }

  @override
  Future<List<ProductResponse>> getAllProduct() {
    return _appServiceClient.getAllProduct();
  }

  @override
  Future<List<SupplementResponse>> getAllSupplement() {
    return _appServiceClient.getAllSupplement();
  }

  @override
  Future<List<UserResponse>> getAllUser() {
    return _appServiceClient.getAllUser();
  }

  @override
  Future<bool> activeToggle(String type, String id) {
    return _appServiceClient.activeTogle(type, id);
  }

  @override
  Future<HomeResponse> home() {
    return _appServiceClient.home();
  }

  @override
  Future<List<ProductResponse>> getProductsByCategory(String id) {
    return _appServiceClient.getProductsByCategory(id);
  }

  @override
  Future<List<SupplementResponse>> getSupplemensByProduct(String id) {
    return _appServiceClient.getSupplementsByProduct(id);
  }

  @override
  Future<ProductResponse> addSupplementsToProduct(
      String productId, String suppsId) {
    return _appServiceClient.addSupplementsToProduct(productId, suppsId);
  }

  @override
  Future<List<SupplementResponse>> getSupplementsForAdd(String id) {
    return _appServiceClient.getSupplementsForAdd(id);
  }

  Future<SignInResponse> addUser(AddUserRequest addUserRequest) async {
    return await _appServiceClient.addUser(
        image: addUserRequest.image,
        name: addUserRequest.name,
        password: addUserRequest.password,
        role: addUserRequest.role,
        username: addUserRequest.username);
  }

  @override
  Future<UserResponse> updateUser(UpdateUserRequest updateUserRequest) async {
    return await _appServiceClient.updateUser(
        image: updateUserRequest.image,
        id: updateUserRequest.id, 
        name: updateUserRequest.name, 
        role: updateUserRequest.role, 
        username: updateUserRequest.username);
  }

  @override
  Future<CategoryResponse> addCategory(
      AddCategoryRequest addCategoryRequest) async {
    return await _appServiceClient.addCategory(
        color: addCategoryRequest.color,
        image: addCategoryRequest.image,
        label: addCategoryRequest.label);
  }

  @override
  Future<SupplementResponse> addSupplement(
      AddSupplementRequest addSupplementRequest) async {
    return await _appServiceClient.addSupplement(
      color: addSupplementRequest.color,
      image: addSupplementRequest.image,
      price: addSupplementRequest.price,
      title: addSupplementRequest.title,
    );
  }

  @override
  Future<ProductResponse> addProduct(
      AddProductRequest addProductRequest) async {
    return await _appServiceClient.addProduct(
        categoryId: addProductRequest.categoryId,
        color: addProductRequest.color,
        image: addProductRequest.image,
        price: addProductRequest.price,
        title: addProductRequest.title);
  }

  @override
  Future<void> deleteSupplementsToProduct(String productId, String suppId) {
    return _appServiceClient.deleteSupplementFromProduct(productId, suppId);
  }

  @override
  Future<bool> delete(String type, String id) {
    return _appServiceClient.delete(type, id);
  }

  @override
  Future<SupplementResponse> updateSupplement(
      UpdateSupplementRequest updateSupplementRequest) async {
    return await _appServiceClient.UpdateSupplement(
      id: updateSupplementRequest.id,
      color: updateSupplementRequest.color,
      image: updateSupplementRequest.image,
      price: updateSupplementRequest.price,
      title: updateSupplementRequest.title,
    );
  }

  @override
  Future<CategoryResponse> updateCategory(
      UpdateCategoryRequest updateCategoryRequest) async {
    return await _appServiceClient.UpdateCategory(
        id: updateCategoryRequest.id,
        color: updateCategoryRequest.color,
        image: updateCategoryRequest.image,
        label: updateCategoryRequest.label);
  }

  @override
  Future<ProductResponse> updateProduct(
      UpdateProductRequest updateProductRequest) async {
    return await _appServiceClient.updateProduct(
        id: updateProductRequest.id,
        categoryId: updateProductRequest.categoryId,
        color: updateProductRequest.color,
        image: updateProductRequest.image,
        price: updateProductRequest.price,
        title: updateProductRequest.title);
  }

  @override
  Future<void> print(String id) {
    return _appServiceClient.print(id);
  }

  @override
  Future<void> reorder(String type, String id1, String id2) {
    return _appServiceClient.reorder(type, id1, id2);
  }

  @override
  Future<AllWaitersInsightsResponse> getAllWaitersInsights(String date1, String date2) {
    return _appServiceClient.getAllWaitersInsights(date1, date2);
  }  

  @override
  Future<WaiterInsightsResponse> getWaiterInsights(String date1, String date2, String id) {
    return _appServiceClient.getWaiterInsights(date1, date2, id);
  }

  @override
  Future<OrdersInsightsResponse> getOrdersInsights(String date1, String date2, String pageIndex) {
    return _appServiceClient.getOrdersInsights(date1, date2, pageIndex);
  }

  @override
  Future<List<CategoryCountResponse>> getCategoriesQuantityConsumed(String date1, String date2) {
    return _appServiceClient.getCategoriesQuantityConsumed(date1, date2);
  }

  @override
  Future<List<ProductCountResponse>> getProductsQuantityConsumedByCategory(String date1, String date2, String categoryId) {
    return _appServiceClient.getProductsQuantityConsumedByCategory(date1, date2, categoryId);
  }
  
  @override
  Future<List<OrderResponse>> getOrdersByState(String status) {
    return _appServiceClient.getOrdersByState(status);
  }
  
  @override
  Future<void> acceptCancelOrder(String id) {
    return _appServiceClient.acceptCancelOrder(id);
  }
  
  @override
  Future<void> rejectCancelOrder(String id) {
    return _appServiceClient.rejectCancelOrder(id);
  }

  @override
  Future<int> getNumberOrdersByState(String status) {
    return _appServiceClient.getNumberOrdersByState(status);
  }
  
  @override
  Future<InfoResponse> getInfo() {
    return _appServiceClient.getInfo();
  }
  
  @override
  Future<InfoResponse> updateInfo(String telephone, String address, String wifiPassword) {
    return _appServiceClient.updateInfo(telephone, address, wifiPassword);
  }
}
