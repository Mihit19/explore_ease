import 'package:explore_ease/utils/constants/image_strings.dart';

import '../features/shop/models/category_model.dart';


class EEDummyData{
  // Banners
  //user
  //cart
  //order
  //List of all categories
  static final List<CategoryModel> categories = [
    CategoryModel(id: '1', name: 'Hotels', image: EEImage.hotel, isFeatured: true),
    CategoryModel(id: '5', name: 'Restaurants', image: EEImage.resto, isFeatured: true),
    CategoryModel(id: '2', name: 'Beaches', image: EEImage.beaches, isFeatured: true),
    CategoryModel(id: '3', name: 'Shopping', image: EEImage.shopping, isFeatured: true),
    CategoryModel(id: '4', name: 'Adventure', image: EEImage.adventure, isFeatured: true),
    CategoryModel(id: '6', name: 'Monuments', image: EEImage.monuments, isFeatured: true),


    ///subcategories
    //hotels
    CategoryModel(id: '7', name: 'Luxury Hotels', image: EEImage.hotel, isFeatured: false),
    CategoryModel(id: '8', name: 'Budget Hotels', image: EEImage.hotel, isFeatured: false),
    CategoryModel(id: '9', name: 'Boutique Hotels', image: EEImage.hotel, isFeatured: false),

    //Restaurants
    CategoryModel(id: '10', name: 'Fine Dining', image: EEImage.resto, isFeatured: false),
    CategoryModel(id: '11', name: 'Casual Dining', image: EEImage.resto, isFeatured: false),
    CategoryModel(id: '12', name: 'Fast Food Chains', image: EEImage.resto, isFeatured: false),

    //beaches
    CategoryModel(id: '13', name: 'Sandy Beaches', image: EEImage.beaches, isFeatured: false),
    CategoryModel(id: '14', name: 'Rocky Beaches', image: EEImage.beaches, isFeatured: false),
    CategoryModel(id: '15', name: 'Party Beaches', image: EEImage.beaches, isFeatured: false),

    //shopping
    CategoryModel(id: '16', name: 'Department Stores', image: EEImage.shopping, isFeatured: false),
    CategoryModel(id: '17', name: 'Shopping Mall', image: EEImage.shopping, isFeatured: false),
    CategoryModel(id: '18', name: 'Antique Shops', image: EEImage.shopping, isFeatured: false),

    //adventure
    CategoryModel(id: '19', name: 'Zip Lining', image: EEImage.adventure, isFeatured: false),
    CategoryModel(id: '20', name: 'Hiking Trails', image: EEImage.adventure, isFeatured: false),
    CategoryModel(id: '21', name: 'Mountain Climbing', image: EEImage.adventure, isFeatured: false),

    //monuments
    CategoryModel(id: '22', name: 'Historical Landmarks', image: EEImage.monuments, isFeatured: false),
    CategoryModel(id: '23', name: 'Architectural Wonders', image: EEImage.monuments, isFeatured: false),
    CategoryModel(id: '24', name: 'Temples and Shrines', image: EEImage.monuments, isFeatured: false),
];
}