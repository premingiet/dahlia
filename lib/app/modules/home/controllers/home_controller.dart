import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:testw/app/constant/api_service.dart';
import 'package:testw/app/modules/home/model/product_model.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  var client = http.Client();
  final RxList<ProductModel> pmList = <ProductModel>[].obs;
  final RxInt maxProducts = 0.obs;
  final RxInt currentSkip = 0.obs;
  final RxInt currentLimit = 10.obs;


  Future<void> fetchProducts(int limit, int skip) async{

    final dio = Dio();

    try{
      var response = await dio.get('https://dummyjson.com/products?limit=$limit&skip=$skip');
      Map<String, dynamic> mResponse = response.data;
      List<dynamic> pList = mResponse["products"] as List<dynamic>;
      pmList.value = pList.map((e) => ProductModel(title: e["title"], desc: e["description"], price: e["price"], url: e["images"][0])).toList();


      maxProducts.value = mResponse["total"];

      if(mResponse["limit"] + mResponse["skip"] > maxProducts.value){
        pmList.clear();
      }


      pmList.refresh();


      print(pList);

      if (kDebugMode) {
        print("--- response -> $response ---");
      }
    }catch(e){
      if (kDebugMode) {
        print("error = $e");
      }
    }
  }


  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
