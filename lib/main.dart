import 'package:explore_ease/data/repositories/categories/category_repository.dart';
import 'package:explore_ease/features/shop/controllers/category_controller.dart';
import 'package:explore_ease/features/shop/models/category_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app.dart';
import 'data/dummy_data.dart';
import 'data/repositories/authentication/authentication_repository.dart';
import 'firebase_options.dart';

final controller = Get.put(CategoryRepository());
Future<void> main() async {
  /// Widgets binding
  final WidgetsBinding widgetsBinding=WidgetsFlutterBinding.ensureInitialized();
  /// Getx local storage
  await GetStorage.init();
  // Await Native Splash
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  /// Initialize firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((FirebaseApp value) => Get.put(AuthenticationRepository()));

  try{
    final categories = EEDummyData.categories;
    await controller.uploadDummyData(categories);
  } catch (e) {
    throw 'Error uploading dummy data: $e';
  }

  runApp(const App());
}

