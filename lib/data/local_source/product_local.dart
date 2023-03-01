import 'package:concung_entrance_test/data/database/database.dart';
import 'package:concung_entrance_test/model/product_model.dart';
import 'package:concung_entrance_test/utils/custom_exception.dart';
import 'package:get_it/get_it.dart';

class ProductLocal {
  final instance = GetIt.instance;

  Future<void> saveProductToLocal(List<ProductModel> produtcs) async {
    final db = instance.get<MyDatabase>();
    final listAdd = produtcs
        .map(
          (e) => ProductsCompanion.insert(
              deviceName: e.deviceName,
              rate: e.rate,
              price: e.price,
              imgUrl: e.imgUrl),
        )
        .toList();
    await db.batch((batch) => batch.insertAll(db.products, listAdd)).onError(
        (error, stackTrace) =>
            throw LocalException(LocalException.other, error.toString()));
  }

  Future<List<ProductModel>> getProductsFromLocal() async {
    final db = instance.get<MyDatabase>();
    final products = await (db.select(db.products)).get().onError(
          (error, stackTrace) =>
              throw LocalException(LocalException.other, "Error when get data"),
        );

    final List<ProductModel> result = products
        .map(
          (element) => ProductModel(
            deviceName: element.deviceName,
            rate: element.rate,
            price: element.price,
            imgUrl: element.imgUrl,
          ),
        )
        .toList();
    return result;
  }
}
