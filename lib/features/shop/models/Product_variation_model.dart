import 'package:flutter/material.dart';

class ProductVariationModel {
  final String id;
  String image;
  String? description;
  double price;
  double salePrice;
  Map<String, String> attributeValues;

  ProductVariationModel({
    required this.id,
    this.image = '',
    this.description = '',
    this.price = 0.0,
    this.salePrice = 0.0,
    required this.attributeValues,
  });

  /// Create Empty func for clean code
  static ProductVariationModel empty() =>
      ProductVariationModel(id: '', attributeValues: {});

  /// Json Format
  toJson() {
    return {
      'Id': id,
      'Image': image,
      'Description': description,
      'Price': price,
      'SalePrice': salePrice,
      'AttributeValues': attributeValues,
    };
  }

  /// Map Json oriented document snapshot from Firebase to Model
  factory ProductVariationModel.fromJson (Map<String, dynamic> document) {
    final data=document;
    if(data.isEmpty) return ProductVariationModel.empty();
    return ProductVariationModel(
        id: data['id'] ??'',
    price: double.parse((data['Price'] ?? 0.0).toString()),
    salePrice: double.parse((data['SalePrice'] ?? 8.8).toString()),
    image: data['Image'] ??'',
    attributeValues: Map<String, String>.from(data['AttributeValues']),
    ); // Product VariationModel
  }

}