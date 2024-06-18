import 'package:admin_panel/Services/LocalStorageService.dart';
import 'package:admin_panel/Services/SharedPreferencesService.dart';
import 'package:admin_panel/controller/BrandController.dart';
import 'package:admin_panel/controller/CategoryController.dart';
import 'package:admin_panel/controller/LoginController.dart';
import 'package:admin_panel/controller/ProductController.dart';
import 'package:admin_panel/controller/SubCategoryController.dart';
import 'package:admin_panel/model/SubCategoryModel.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Services/httpService.dart';

//getx controller instaces
LoginController  loginController = Get.put(LoginController());
ProductController productController = Get.put(ProductController());
CategoryController categoryController = Get.put(CategoryController());
SubCategoryControler subCategoryControler = Get.put(SubCategoryControler());
BrandController brandController = Get.put(BrandController());


//ApiService Instance
HttpService httpService = new HttpService();


//SharedPrefrences Instance
PrefService prefService = new PrefService();

//localStroge instance
localStorageService storageService = new localStorageService();