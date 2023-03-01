class ProductModel {
  final String deviceName;
  final double rate;
  final String price;
  final String imgUrl;

  ProductModel({
    required this.deviceName,
    required this.rate,
    required this.price,
    required this.imgUrl,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      deviceName: json['device_name'],
      rate: json['rate'] as double,
      price: json['price'],
      imgUrl: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "device_name": deviceName,
      "rate": rate,
      "price": price,
      "url": imgUrl,
    };
  }
}

class ProductsResponse {
  final List<ProductModel> listProducts;

  ProductsResponse({required this.listProducts});

  factory ProductsResponse.fromJson(dynamic json) {
    final data = json["data"] as List<dynamic>;
    final List<ProductModel> result = [];
    for (final element in data) {
      result.add(ProductModel.fromJson(element));
    }
    return ProductsResponse(listProducts: result);
  }
}
