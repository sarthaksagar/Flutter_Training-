import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/models/category_model.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  RxList<CategoryModel> categories = <CategoryModel>[].obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  void fetchCategories() {
    _firestore.collection('categories').snapshots().listen((snapshot) {
      categories.assignAll(
        snapshot.docs.map((doc) {
          return CategoryModel.fromMap(doc.data());
        }).toList(),
      );
      isLoading.value = false;
    });
  }
}
