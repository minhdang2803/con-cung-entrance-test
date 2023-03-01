import 'package:concung_entrance_test/model/product_model.dart';
import 'package:concung_entrance_test/utils/constant.dart';
import 'package:concung_entrance_test/utils/http_request_service.dart';
import '../../utils/dio_wrapper.dart';

class ProductRemote {
  final _api = APIService.instance();
//
  Future<ProductsResponse> getProducts() {
    const String path =
        "https://6065f2b5b8fbbd0017567c45.mockapi.io/apiv1/listProducts";
    final header = {
      'Authorization': 'Bearer $token',
      "Accept": "application/json",
      'ContextID': "eaa95890-469d-11ed-ae23-e1bfc21d7128",
      'SessionID': "1751028",
      "Content-Type": "application/json",
      "UserID": "condung_id_1",
      "VersionApi": "v1",
    };
    final request = APIServiceRequest(
      path,
      header: header,
      (response) => ProductsResponse.fromJson(response),
    );
    return _api.get(request);
  }
}
