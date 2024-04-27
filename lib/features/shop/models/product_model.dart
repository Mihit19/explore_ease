import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:explore_ease/features/shop/models/product_attribute_model.dart';
import 'Product_variation_model.dart';
import 'state_model.dart';

class LandmarkModel {
  String id;
  double price;
  String title;
  DateTime? date;
  double salePrice;
  String thumbnail;
  bool? isFeatured;
  StateModel? brand;
  String? description;
  String? categoryId;
  List<String>? images;
  String productType;
  List<ProductAttributeModel>? productAttributes;
  List<ProductVariationModel>? productVariations;

  LandmarkModel({
    required this.id,
    required this.title,
    required this.price,
    required this.thumbnail,
    required this.productType,
    this.brand,
    this.date,
    this.images,
    this.salePrice = 0.0,
    this.isFeatured,
    this.categoryId,
    this.description,
    this.productAttributes,
    this.productVariations

  });

  /// Create Empty func for clean code
  static LandmarkModel empty() => LandmarkModel(id: '', title: '', price: 0, thumbnail: '', productType: '');

  /// Json Format
  toJson(){
    return {
      'Title': title,
      'Price': price,
      'Images': images ?? [],
      'Thumbnail': thumbnail,
      'SalePrice': salePrice,
      'IsFeatured': isFeatured,
      'CategoryId': categoryId,
      'Brand': brand!.toJson(),
      'Description': description,
      'ProductType': productType,
      'ProductAttributes': productAttributes != null ? productAttributes!.map((e) => e.toJson()).toList() : [],
      'Product Variations': productVariations != null ? productVariations!.map((e) => e.toJson()).toList() : [],
    };
  }

  /// Map Json oriented document snapshot from Firebase to Model
  factory LandmarkModel.fromSnapshot (DocumentSnapshot<Map<String, dynamic>> document) {
    if(document.data() == null) return LandmarkModel.empty();
    final data=document.data()!;
    return LandmarkModel(
    id: document.id,
    title: data['title'],
    isFeatured: data['IsFeatured'] ?? false,
    price: double.parse((data['Price'] ?? 0.0).toString()),
    salePrice: double.parse((data['SalePrice'] ?? 8.0).toString()),
    thumbnail: data['Thumbnail'] ??'',
    categoryId: data['CategoryId'] ?? '',
    description: data['Description'] ?? '',
    productType: data['ProductType'] ??'',
    brand: StateModel.fromJson(data['Brand']),
    images: data['Images'] != null ? List<String>.from(data['Images']): [],
    productAttributes: (data['ProductAttributes'] as List<dynamic>).map((e) => ProductAttributeModel.fromJson(e)).toList(),
    productVariations: (data['Product Variations'] as List<dynamic>).map((e) => ProductVariationModel.fromJson(e)).toList(),
    ); // ProductModel
  }

  // Map Json-oriented document snapshot from Firebase to Model
  factory LandmarkModel.fromQuerySnapshot (QueryDocumentSnapshot<Object?> document) {
    final data = document.data() as Map<String, dynamic>;
    return LandmarkModel(
        id: document.id,
        title: data['title'] ??'',
        isFeatured: data['IsFeatured'] ?? false,
        price: double.parse((data['Price'] ?? 0.0).toString()),
        salePrice: double.parse((data['SalePrice'] ?? 0.0).toString()),
        thumbnail: data['Thumbnail'] ?? "",
        categoryId: data['CategoryId'] ?? '',
        description: data['Description'] ?? '',
        productType: data['ProductType'] ?? '',
        brand: StateModel.fromJson(data['Brand']),
        images: data['Images'] != null ? List<String>.from(data['Images']): [],
        productAttributes: (data['ProductAttributes'] as List<dynamic>).map((e) => ProductAttributeModel.fromJson(e)).toList(),
        productVariations: (data['ProductVariations'] as List<dynamic>).map((e) => ProductVariationModel.fromJson(e)).toList(),
    );
  }

}
