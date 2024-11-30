
class BrandModel{
  String id;
  String name;
  String image;
  bool? isFeatured;
  int? productsCount;

  BrandModel({required this.id, required this.image, required this.name, this.isFeatured, this.productsCount});

  static BrandModel empty() => BrandModel(id: '', image: '', name: '');

  toJson(){
    return{
      'Id':id,
      'Name':name,
      'Image':image,
      'ProductsCount':productsCount,
      'IsFeatured':isFeatured,
    };
  }

  /// Map Json oriented document snapshot from Firebase to UserModel
  factory BrandModel. fromJson(Map<String, dynamic> document) {
    final data = document;
    if (data.isEmpty) return BrandModel.empty();
    return BrandModel(
      id: data['Id'] ?? '',
      name: data['Name'] ?? '',
      image: data['Image'] ?? '',
      isFeatured: data['IsFeatured'] ?? false,
      productsCount: int.parse((data['ProductsCount'] ?? 0).toString()),
    );
  }

  // factory ProductModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic >> document){
  //
  //   final data = document.data()!;
  //   return ProductModel(id: document.id, title: data['Title'], stock: data['Stock'], price: double.parse((data['Price']?? 0.0).toString()), thumbnail: data['Thumbnail'], productType: data['ProductType'])
  // }


}