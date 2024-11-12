import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../model/placeholderModel.dart';
import '../service/api_service.dart';

class HomeController extends GetxController {
  RxList<PlaceModel> dataList = <PlaceModel>[].obs;
  var isLoading = true.obs;

  Future<void> getData() async {
    isLoading.value = true;
    var response = await http.get(Uri.parse(ApiService.taskOneApi));

    try {
      if (response.statusCode == 200) {
        var decodeData = jsonDecode(response.body) as List;
        List<PlaceModel> fetchedData = decodeData.map((json) => PlaceModel.fromJson(json)).toList();

        dataList.value = fetchedData;
        debugPrint("=================datalist================= $fetchedData");
      } else {
        debugPrint("Status code is ====${response.statusCode.toString()}");
      }
    } catch (e) {
      debugPrint("catch error: ${e.toString()}");
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    getData();
  }
}
