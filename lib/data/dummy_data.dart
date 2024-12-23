import 'package:explore_ease/features/shop/models/Product_variation_model.dart';
import 'package:explore_ease/features/shop/models/product_attribute_model.dart';
import 'package:explore_ease/features/shop/models/state_model.dart';
import 'package:explore_ease/utils/constants/image_strings.dart';
import '../features/shop/models/category_model.dart';
import '../features/shop/models/product_model.dart';

class EEDummyData {
  // Banners
  //user
  //cart
  //order
  //List of all categories
  static final List<CategoryModel> categories = [
    CategoryModel(
        id: '1', name: 'Hotels', image: EEImage.hotel, isFeatured: true),
    CategoryModel(
        id: '5', name: 'Restaurants', image: EEImage.resto, isFeatured: true),
    CategoryModel(
        id: '2', name: 'Beaches', image: EEImage.beaches, isFeatured: true),
    CategoryModel(
        id: '3', name: 'Shopping', image: EEImage.shopping, isFeatured: true),
    CategoryModel(
        id: '4', name: 'Adventure', image: EEImage.adventure, isFeatured: true),
    CategoryModel(
        id: '6', name: 'Monuments', image: EEImage.monuments, isFeatured: true),

    ///subcategories
    //hotels
    CategoryModel(
        id: '7',
        name: 'Luxury Hotels',
        image: EEImage.hotel,
        isFeatured: false),
    CategoryModel(
        id: '8',
        name: 'Budget Hotels',
        image: EEImage.hotel,
        isFeatured: false),
    CategoryModel(
        id: '9',
        name: 'Boutique Hotels',
        image: EEImage.hotel,
        isFeatured: false),

    //Restaurants
    CategoryModel(
        id: '10', name: 'Fine Dining', image: EEImage.resto, isFeatured: false),
    CategoryModel(
        id: '11',
        name: 'Casual Dining',
        image: EEImage.resto,
        isFeatured: false),
    CategoryModel(
        id: '12',
        name: 'Fast Food Chains',
        image: EEImage.resto,
        isFeatured: false),

    //beaches
    CategoryModel(
        id: '13',
        name: 'Sandy Beaches',
        image: EEImage.beaches,
        isFeatured: false),
    CategoryModel(
        id: '14',
        name: 'Rocky Beaches',
        image: EEImage.beaches,
        isFeatured: false),
    CategoryModel(
        id: '15',
        name: 'Party Beaches',
        image: EEImage.beaches,
        isFeatured: false),

    //shopping
    CategoryModel(
        id: '16',
        name: 'Department Stores',
        image: EEImage.shopping,
        isFeatured: false),
    CategoryModel(
        id: '17',
        name: 'Shopping Mall',
        image: EEImage.shopping,
        isFeatured: false),
    CategoryModel(
        id: '18',
        name: 'Antique Shops',
        image: EEImage.shopping,
        isFeatured: false),

    //adventure
    CategoryModel(
        id: '19',
        name: 'Zip Lining',
        image: EEImage.adventure,
        isFeatured: false),
    CategoryModel(
        id: '20',
        name: 'Hiking Trails',
        image: EEImage.adventure,
        isFeatured: false),
    CategoryModel(
        id: '21',
        name: 'Mountain Climbing',
        image: EEImage.adventure,
        isFeatured: false),

    //monuments
    CategoryModel(
        id: '22',
        name: 'Historical Landmarks',
        image: EEImage.monuments,
        isFeatured: false),
    CategoryModel(
        id: '23',
        name: 'Architectural Wonders',
        image: EEImage.monuments,
        isFeatured: false),
    CategoryModel(
        id: '24',
        name: 'Temples and Shrines',
        image: EEImage.monuments,
        isFeatured: false),
  ];

  //list of landmarks
  static final List<LandmarkModel> landmarks = [
    LandmarkModel(
        id: '001',
        title: 'Taj Exotica Resort & Spa',
        price: 10000,
        isFeatured: true,
        thumbnail: EEImage.landmark1,
        description: '''Facilities: Parking , Bar , Wifi , Pool , Food 
                      
Located in the tranquil Benaulim, Goa, overlooking the Arabian Sea, Taj Exotica Resort & Spa offers a laid-back, luxury experience. The resort boasts lush greenery spread over 56 acres, featuring deluxe suites and villa rooms with old-world charm. It"s an ideal destination for romantic getaways or family vacations. The resort's 4,600 square feet Ballroom caters to social events and destination weddings. Indulge in diverse cuisines, relax by the pool, and enjoy rejuvenating therapies at J Wellness Circle. For the adventurous, water sports and various sports activities are available. Let the attentive staff pamper you while exploring Goa's historic sites and attractions.''',
        brand: StateModel(
            id: '1',
            image: EEImage.tajIcon,
            name: 'Goa',
            landmarksCount: 100,
            isFeatured: true),
        images: [
          EEImage.landmark1,
          EEImage.landmark2,
          EEImage.landmark3,
          EEImage.landmark4
        ],
        salePrice: 25,
        categoryId: '1',
        productAttributes: [
          ProductAttributeModel(
              name: 'Room Type',
              values: ['Deluxe Room', 'Suite', 'Presidential Suite']),
          ProductAttributeModel(
              name: 'Amenities',
              values: ['Swimming Pool', 'Spa', 'Gym', 'Restaurant']),
        ],
        productVariations: [
          ProductVariationModel(
              id: '1',
              price: 7500,
              attributeValues: {
                'Room Type': 'Deluxe Room',
                'Amenities': 'Swimming Pool',
              })
        ],
        productType: 'ProductType.variable'),
  ];
}
