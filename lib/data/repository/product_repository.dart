import 'package:concung_entrance_test/data/local_source/product_local.dart';
import 'package:concung_entrance_test/data/remote_source.dart/product_remote.dart';

import '../../model/product_model.dart';

abstract class ProductRepository {
  Future<List<ProductModel>> getData();
}

class ProductRepositoryImpl implements ProductRepository {
  late ProductLocal _local;
  late ProductRemote _remote;
  ProductRepositoryImpl._privateConstructor() {
    _local = ProductLocal();
    _remote = ProductRemote();
  }
  static final ProductRepositoryImpl _instance =
      ProductRepositoryImpl._privateConstructor();
  factory ProductRepositoryImpl.instance() => _instance;


  ///Using Caching method.
  @override
  Future<List<ProductModel>> getData() async {
    //Get from local first
    final fromLocal = await _local.getProductsFromLocal();
    if (fromLocal.isEmpty) {
      //If there is no Data in local database -> get from Server
      final fromServer = await _remote.getProducts();
      final List<ProductModel> data = fromServer.listProducts;
      _local.saveProductToLocal(data);
      return data;
    }
    return fromLocal;
  }
}
