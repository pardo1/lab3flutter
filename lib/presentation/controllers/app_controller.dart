import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:blah2/data/models/wine_model.dart';
import 'package:blah2/data/models/wine_by_model.dart';
import 'package:blah2/data/repository/wine_repository_impl.dart';

class AppController extends GetxController {
  RxList<WineModel> wineList = <WineModel>[].obs;
  RxList<WinesByModel> winesByList = <WinesByModel>[].obs; // Lista pentru `wines_by`

  final WineRepositoryImpl _wineRepository = WineRepositoryImpl();

  @override
  void onInit() {
    super.onInit();
    loadWinesFromRepository();
  }

  Future<void> loadWinesFromRepository() async {
    try {
      List<WinesByModel> winesByData = await _wineRepository.getWinesByModelFromJson();
      winesByList.value = winesByData;

      List<WineModel> wineData = await _wineRepository.getWinesFromJson();
      wineList.value = wineData;

      for (var item in winesByList.value) {
        print('Tag: ${item.tag}, Name: ${item.name}');
      }

      for (var wine in wineList.value) {
        print('Wine: ${wine.name}, Type: ${wine.type}, Country: ${wine.country}, Price: ${wine.price}');
      }
    } catch (e) {
      print('Error loading wines: $e');
    }
  }
}