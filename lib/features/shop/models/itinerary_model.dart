import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../utils/helpers/helper_functions.dart';
import 'cart_item_model.dart';

class ItineraryModel {
  final String id;
  final String userId;
  final double totalAmount;
  final DateTime orderDate;
  final List<CartItemModel> items;

  ItineraryModel({
    required this.id,
    this.userId = '',
    required this.items,
    required this.totalAmount,
    required this.orderDate,
  });

  String get formattedOrderDate =>
      EEHelperFunctions.getFormattedDate(orderDate);

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'totalAmount': totalAmount,
      'orderDate': orderDate,
      'items': items.map((item) => item.toJson()).toList(),
      // Convert CartItemModel to map
    };
  }

  factory ItineraryModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;

    return ItineraryModel(
      id: data['id'] as String,
      userId: data['userId'] as String,
      totalAmount: data['totalAmount'] as double,
      orderDate: (data['orderDate'] as Timestamp).toDate(),
      items: (data['items'] as List<dynamic>)
          .map((itemData) =>
          CartItemModel.fromJson(itemData as Map<String, dynamic>))
          .toList(),
    ); // OrderModel
  }
}
