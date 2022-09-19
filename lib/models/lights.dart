import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:smart_light_iot/models/Light.dart';
import 'package:http/http.dart' as http;

class Lights extends ChangeNotifier{
  bool isOn;
  List<Light> lightData = [];

  Lights({required this.isOn});

  // late Light lightModel;

  void turnOn(){
    isOn = !isOn;
    notifyListeners();
  }

  fetchDate () async {
    lightData = await getData();

    notifyListeners();
  }

  Future<List<Light>> getData() async {
    try {
      final response = await http.get(
          Uri.http("192.168.0.112:8000" , "lights/manage-lights")
      );

      var jsonData = jsonDecode(response.body);
      for(var light in jsonData) {
        Light l = Light(id: light['_id'], inDate: DateTime.parse(light['inDate']), outDate: DateTime.parse(light['outDate']), timeDifference: light['timeDifference']);
        lightData.add(l);
      }
    } catch (err) {
      print(err.toString());
    }

    return lightData;
  }
}