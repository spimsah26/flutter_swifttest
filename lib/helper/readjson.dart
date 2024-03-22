import 'package:flutter_swifttest/model/province/AllTahiProvinceModel.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class ReadJsonHelper with ChangeNotifier{

  ReadJsonHelper(){
    fetchAllThaiProvinces();

  }


   List<AllTahiProvinceModel> _ProvinceList = [];
   List<String> _searchSuggess = [];

  List<String> get searchSuggess => _searchSuggess;

  set searchSuggess(List<String> value) {
    _searchSuggess = value;
  }

  List<AllTahiProvinceModel> get ProvinceList => _ProvinceList;

  set ProvinceList(List<AllTahiProvinceModel> value) {
    _ProvinceList = value;
      notifyListeners();
  }

    Future<List<AllTahiProvinceModel>> fetchAllThaiProvinces() async {

     // Create a list of Item objects
  List<AllTahiProvinceModel> items = [];
    try{

       // Load the JSON file
  String jsonString = await rootBundle.loadString('assets/thai_alldata.json');

  // Parse the JSON string
  final jsonData = json.decode(jsonString);

 
  for (var item in jsonData) {
    items.add(AllTahiProvinceModel.fromJson(item));
  }
  print('read from json ${items.toString()}');
  ProvinceList = items;
   settingProvinceSuggess();

    }catch(e){
        print('read from json error${e.toString()}');

    }


  return items;
}

    settingProvinceSuggess(){
      List<String> sItem = [];
      

      for(var prjOb in ProvinceList){

        var amp = prjOb.amphure;

        for(var amObj in amp!){
          var tam = amObj.tambon;


          for(var tamObj in tam!){

            sItem.add('${tamObj.zipCode}/${amObj.nameTh}/${prjOb.nameTh}');

          }

        }
      

      }

      print('all tambon zipcode ${sItem.length}');
      searchSuggess = sItem;

      
    }

}