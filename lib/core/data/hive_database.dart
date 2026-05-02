import 'package:hive_flutter/hive_flutter.dart';
import '../../features/product/data/models/product_model.dart';
import '../../features/shop/data/models/shop_model.dart';

class HiveDatabase {
  static const String productBoxName = 'products';
  static const String shopBoxName = 'shop';
  static const String settingsBoxName = 'settings';

  static Future<void> init() async {
    await Hive.initFlutter();

    // Register Adapters
    Hive.registerAdapter(ProductModelAdapter());
    Hive.registerAdapter(ShopModelAdapter());

    // Open Boxes
    await Hive.openBox<ProductModel>(productBoxName);
    await Hive.openBox<ShopModel>(shopBoxName);
    
    // فتح صندوق الإعدادات لحفظ الـ Dark Mode
    await Hive.openBox(settingsBoxName); 
  }

  // ميثود مساعدة لمعرفة هل الوضع الليلي مفعل أم لا
  static bool isDarkMode() {
    return Hive.box(settingsBoxName).get('isDarkMode', defaultValue: false);
  }

  // ميثود لحفظ حالة الوضع الليلي
  static Future<void> setDarkMode(bool value) async {
    await Hive.box(settingsBoxName).put('isDarkMode', value);
  }

  static Box<ProductModel> get productBox =>
      Hive.box<ProductModel>(productBoxName);
      
  static Box<ShopModel> get shopBox => Hive.box<ShopModel>(shopBoxName);
  
  static Box get settingsBox => Hive.box(settingsBoxName);
}