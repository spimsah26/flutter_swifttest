import 'package:flutter_swifttest/model/province/AllTahiProvinceModel.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swifttest/model/thai_provinces/ThaiProvincesModel.dart';

class ReadJsonHelper with ChangeNotifier{

  ReadJsonHelper(){
    fetProvince();
   

  }

  fetProvince()async{
    await  fetchAllThaiProvinces();

  }
  
   List<AllTahiProvinceModel> _ProvinceList = [];
   List<String> _searchSuggess = [];
   List<String> _thaiProvinces = [];

  List<String> get thaiProvinces => _thaiProvinces;

  set thaiProvinces(List<String> value) {
    _thaiProvinces = value;
      notifyListeners();
  }

 


  List<String> get searchSuggess => _searchSuggess;

  set searchSuggess(List<String> value) {
    _searchSuggess = value;
      notifyListeners();
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



Future<List<String>>getProvincesSuggess()async{

   List<String> sItem = [];
    List<String> pItem = [];
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

  
      for(var prjOb in items){
         pItem.add('${prjOb.nameTh}');

        var amp = prjOb.amphure;

        for(var amObj in amp!){
          var tam = amObj.tambon;


          for(var tamObj in tam!){

            sItem.add('${tamObj.zipCode}/${tamObj.nameTh}/${amObj.nameTh}/${prjOb.nameTh}');

          }

        }
      

      }
       thaiProvinces = pItem;

 

    }catch(e){
        print('read from json error${e.toString()}');

    }




   return sItem;

}


Future<List<String>>getOnlyProvincesSuggess()async{

  
    List<String> pItem = [];
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

  
      for(var prjOb in items){
         pItem.add('${prjOb.nameTh}');


      }
       thaiProvinces = pItem;

 

    }catch(e){
        print('read from json error${e.toString()}');

    }




   return pItem;




}



    settingProvinceSuggess(){
      List<String> sItem = [];
       List<String> pItem = [];
      

      for(var prjOb in ProvinceList){
        pItem.add('${prjOb.nameTh}');

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
      thaiProvinces = pItem;

      
    }



    

}