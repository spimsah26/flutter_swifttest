
// ignore_for_file: sort_child_properties_last, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_swifttest/constant/constant.dart';
import 'package:flutter_swifttest/darttest1.dart';
import 'package:flutter_swifttest/darttest2.dart';
import 'package:flutter_swifttest/helper/helper.dart';
import 'package:flutter_swifttest/helper/readjson.dart';
import 'package:provider/provider.dart';

class DartTestMainMenu extends StatefulWidget {
  const DartTestMainMenu({super.key, required this.title});


  final String title;

  @override
  State<DartTestMainMenu> createState() => _DartTestMainMenu();
}

class _DartTestMainMenu extends State<DartTestMainMenu> {
 
  var menuTitle =['ข้อ 1.','ข้อ 2.','ข้อ 3.','ข้อ 4.'
  ];

    List<Route> route= [
     MaterialPageRoute(builder: (context) => const DartTest1(title: 'ข้อที่ 1',)),
      MaterialPageRoute(builder: (context) => const DartTest2(title: 'ข้อที่ 2',)),
    
   
  ];


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

       ListView.builder(
        itemCount: menuTitle.length,
        itemBuilder: (BuildContext context, index) {
          return 
          Column(
            children: [
   ListTile(
              title: Text(menuTitle[index]),
            //trailing: Icon(Icons.info_outlined),
            onTap: () {
              
              switch(index){
                case 0 : Navigator.pushNamed(context, Constant.routeDartTest1);
                case 1 : Navigator.pushNamed(context, Constant.routeDartTest2);
                 case 2 : Navigator.pushNamed(context, Constant.routeDartTest3);
                  case 3 : Navigator.pushNamed(context, Constant.routeDartTest4);
                  
              }
             
            },
          ),
          Divider()
            ],
          );
       
        },
      ),
    );

 

    
  
  }
}