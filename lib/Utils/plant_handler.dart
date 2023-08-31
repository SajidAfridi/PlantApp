import 'dart:convert';

import 'package:flutter/cupertino.dart';

import '../models/plant.dart';

class PlantsHandler {
  static Future<List<Plants>> getAllPlants(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 1));

    var plants = <Plants>[];
    var assetBundle = DefaultAssetBundle.of(context);
    var data = await assetBundle.loadString('assets/PlantData/plantJson.json');
    var jsonData = json.decode(data);
    var plantsData = jsonData as List<dynamic>;

    for (var plantData in plantsData) {
      Plants plant = Plants.fromJson(plantData);
      plants.add(plant);
    }
    print(plants);
    return plants;
  }
  static List<Plants> getRecommendedPlants(List<Plants> plants) {
    return plants.where((plant) => plant.isRecommended == true).toList();
  }

  static List<Plants> getTopPlants(List<Plants> plants) {
    return plants.where((plant) => plant.isTop == true).toList();
  }

  static List<Plants> getIndoorPlants(List<Plants> plants) {
    return plants.where((plant) => plant.isIndoor == true).toList();
  }

  static List<Plants> getOutdoorPlants(List<Plants> plants) {
    return plants.where((plant) => plant.isOutdoor == true).toList();
  }
}