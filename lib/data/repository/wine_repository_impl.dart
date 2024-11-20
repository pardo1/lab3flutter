import 'dart:convert';
import 'package:blah2/domain/repository/wine_repository.dart';
import 'package:flutter/services.dart';
import 'package:blah2/data/models/wine_by_model.dart';
import 'package:blah2/data/models/wine_model.dart';

class WineRepositoryImpl implements WineRepository {
  @override
  Future<List<WinesByModel>> getWinesByModelFromJson() async {
    final String response = await rootBundle.loadString('assets/v3.json');

    final Map<String, dynamic> jsonData = json.decode(response);

    final List<dynamic> carouselData = jsonData['wines_by'];

    List<WinesByModel> wineList = carouselData.map((wine) => WinesByModel.fromJson(wine)).toList();

    return wineList;
  }

  @override
  Future<List<WineModel>> getWinesFromJson() async {
    final String response = await rootBundle.loadString('assets/v3.json');

    final Map<String, dynamic> jsonData = json.decode(response);

    final List<dynamic> winesData = jsonData['carousel'];

    List<WineModel> wineList = winesData.map((wine) => WineModel.fromJson(wine)).toList();

    return wineList;
  }
}