import 'package:concung_entrance_test/data/repository/product_repository.dart';
import 'package:concung_entrance_test/model/product_model.dart';
import 'package:concung_entrance_test/utils/custom_exception.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';

enum ProductStatus { inital, loading, done, fail }

class ProductState {
  late final List<ProductModel>? listProducts;
  late final String? errorMessage;
  late final ProductStatus? status;
  ProductState({this.errorMessage, this.listProducts, this.status});
  ProductState.initial() {
    errorMessage = "";
    listProducts = [];
    status = ProductStatus.inital;
  }

  ProductState copyWith(
      {List<ProductModel>? listProducts,
      String? errorMessage,
      ProductStatus? status}) {
    return ProductState(
        errorMessage: errorMessage ?? this.errorMessage,
        listProducts: listProducts ?? this.listProducts,
        status: status ?? this.status);
  }
}

class ProductProvider extends StateNotifier<ProductState> {
  ProductProvider() : super(ProductState.initial());
  final instance = ProductRepositoryImpl.instance();
  void getProduct() async {
    try {
      state = state.copyWith(status: ProductStatus.loading);
      final response = await instance.getData();
      state =
          state.copyWith(status: ProductStatus.done, listProducts: response);
    } on RemoteException catch (error) {
      state = state.copyWith(
        status: ProductStatus.fail,
        errorMessage: error.errorMessage,
      );
    }
  }
}
