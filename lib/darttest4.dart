
// ignore_for_file: sort_child_properties_last, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';



class DartTest4 extends StatefulWidget {
  const DartTest4({super.key, required this.title});


  final String title;

  @override
  State<DartTest4> createState() => _DartTest4();
}

class _DartTest4 extends State<DartTest4> {
 



@override
  void initState() {
 
  }

  List<int> answer = [];

  convertList(){

List<List<int>> data = [ 

    [1,2,3], 

    [4,5,6], 

    [7,8,9], 

  ]; 

  answer = data.expand((list) => list).toList();

  print("Flattened list: $answer");

  setState(() {
    
  });



  }

 



  @override
  Widget build(BuildContext context) {


    
  
    return   Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body:

    Column(children: [

                        Container(
          width: double.infinity,
  margin: const EdgeInsets.only(left: 100,right: 100,top: 20,bottom: 20),
  padding: const EdgeInsets.all(4.0),
  decoration: BoxDecoration(
    border: Border.all(color: Colors.black26)
  ),
  child:  TextButton(
                        onPressed: () {
                        convertList();
                          
                         
                        },
                        child: Text('Answer 4'),
                      ),
),
//answer2.isNotEmpty?

answer.isNotEmpty?
Text('answer 4. : $answer'):Container(),


    ],),
    );

 

    
  
  }
}