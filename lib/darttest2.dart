
// ignore_for_file: sort_child_properties_last, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_swifttest/constant/constant.dart';
import 'package:flutter_swifttest/helper/helper.dart';
import 'package:flutter_swifttest/helper/readjson.dart';
import 'package:flutter_swifttest/model/ZooModel.dart';
import 'package:provider/provider.dart';

class DartTest2 extends StatefulWidget {
  const DartTest2({super.key, required this.title});


  final String title;

  @override
  State<DartTest2> createState() => _DartTest2();
}

class _DartTest2 extends State<DartTest2> {

   List<Map<String, dynamic>> data = [ 

    {'id': 1, 'name': 'Elephant', 'age': 50}, 

    {'id': 2, 'name': 'Dog', 'age': 5}, 

    {'id': 3, 'name': 'Cat', 'age': 5}, 

    {'id': 4, 'name': 'Ant', 'age': 1}, 

    {'id': 5, 'name': 'Alligator', 'age': 20}, 

    {'id': 6, 'name': 'Bird', 'age': 3}, 

    {'id': 7, 'name': 'Horse', 'age': 2}, 

    {'id': 8, 'name': 'Tiger', 'age': 24}, 

  ]; 
 List<ZooModel> zooList = [];
  List<ZooModel> zooList2 = [];
  List<String> answer1 = [];
  List<String> answer2 = [];

  sortListAnswer1(){
     // Sort the list based on the 'value' property
     answer1 = [];
  zooList2.sort((a, b) => a.age!.compareTo(b.age!));

   zooList2.forEach((element) {
    if(element.age! <=20 ){
       print("Name: ${element.name}, age: ${element.age}");
       answer1.add("${element.name}");

    }
   
  });
  setState(() {
    
  });

  }

sortNameA(){
   answer2 = [];

    zooList.forEach((element) {
    if(element.name.toString()[0].toUpperCase() == 'A' ){
       print("Name: ${element.name}, age: ${element.age}");
       answer2.add("${element.name}");

    }
   
  });
  setState(() {
    
  });

}

  convertJsonToList(){
    zooList2 =[];
     String jsonData = jsonEncode(data);
     print(jsonData);

       try{



  // Parse the JSON string
  final jsonObj = json.decode(jsonData);

 
  for (var item in jsonObj) {
    zooList.add(ZooModel.fromJson(item));
  }

  zooList2 =zooList;
  print('read zooList from json ${zooList.toString()}');


    }catch(e){
        print('read from json error${e.toString()}');

    }


  }
 



@override
  void initState() {
     convertJsonToList();
    

 
  }

 



  @override
  Widget build(BuildContext context) {


    
  
    return   Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body:

      SingleChildScrollView(
        child: Column(
          children: [

                                Container(
          width: double.infinity,
  margin: const EdgeInsets.only(left: 100,right: 100,top: 20,bottom: 20),
  padding: const EdgeInsets.all(4.0),
  decoration: BoxDecoration(
    border: Border.all(color: Colors.black26)
  ),
  child:  TextButton(
                        onPressed: () {
                           sortListAnswer1();
                          
                         
                        },
                        child: Text('Answer 2.1'),
                      ),
),
answer1.isNotEmpty?
Text('answer 2.1 : $answer1'):Container(),


              Container(
          width: double.infinity,
  margin: const EdgeInsets.only(left: 100,right: 100,top: 20,bottom: 20),
  padding: const EdgeInsets.all(4.0),
  decoration: BoxDecoration(
    border: Border.all(color: Colors.black26)
  ),
  child:  TextButton(
                        onPressed: () {
                           sortNameA();
                          
                         
                        },
                        child: Text('Answer 2.2'),
                      ),
),
answer2.isNotEmpty?
Text('answer 2.2 : $answer2'):Container(),
          ],
        ),
      ),
    );

 

    
  
  }
}