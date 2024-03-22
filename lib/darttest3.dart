
// ignore_for_file: sort_child_properties_last, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_swifttest/constant/constant.dart';
import 'package:flutter_swifttest/helper/helper.dart';
import 'package:flutter_swifttest/helper/readjson.dart';
import 'package:provider/provider.dart';

class DartTest3 extends StatefulWidget {
  const DartTest3({super.key, required this.title});


  final String title;

  @override
  State<DartTest3> createState() => _DartTest3();
}

class _DartTest3 extends State<DartTest3> {
 
 
List<int> data = [1,44,5,89,100, 1, 44];
int answer =0;

findIndexOfMaxValue(){
  answer =0;

  
   // Find the maximum value in the list
  int maxValue = data.reduce((currentMax, element) => element > currentMax ? element : currentMax);
  
  // Find the index of the maximum value
  int maxIndex = data.indexOf(maxValue);
  
  print("Maximum value: $maxValue");
  print("Index of maximum value: $maxIndex");

  answer = maxIndex;
  setState(() {
    
  });
}

@override
  void initState() {
 
  }

 



  @override
  Widget build(BuildContext context) {


    
  
    return   Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body:

     Column(
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
                         findIndexOfMaxValue();
                          
                         
                        },
                        child: Text('Answer 3'),
                      ),
),
//answer2.isNotEmpty?
Text('Index of max value in [1,44,5,89,100, 1, 44]'),
answer > 0?
Text('answer 3. : $answer'):Container(),
      ],
     ),
    );

 

    
  
  }
}