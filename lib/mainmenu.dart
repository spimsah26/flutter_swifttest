
// ignore_for_file: sort_child_properties_last, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_swifttest/constant/constant.dart';
import 'package:flutter_swifttest/helper/helper.dart';
import 'package:flutter_swifttest/helper/readjson.dart';
import 'package:provider/provider.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({super.key, required this.title});


  final String title;

  @override
  State<MainMenu> createState() => _MainMenu();
}

class _MainMenu extends State<MainMenu> {
 
  var menuTitle =['ข้อมูลบุคคล','แบบทดสอบ Dart'
  ];

  //   List<Route> route= [
  //    MaterialPageRoute(builder: (context) => const UserPage(title: 'ข้อมูลบุคคล',)),
  //    MaterialPageRoute(builder: (context) => const UserPage(title: 'ข้อมูลบุคคล',)),
   
  // ];


@override
  void initState() {
    ReadJsonHelper();
  
   
    super.initState();
  }

 



  @override
  Widget build(BuildContext context) {

    return 
    
    Consumer<SQLiteHelper>(
  builder: (context, sqLiteHelper, child) {
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
              if(index == 0) {
                Navigator.pushNamed(context, Constant.routeUserPage);
              } else {
                 Navigator.pushNamed(context, Constant.routeDartTestMain);
              }
            },
          ),
          Divider()
            ],
          );
       
        },
      ),
    );
  },
);
 

    
  
  }
}