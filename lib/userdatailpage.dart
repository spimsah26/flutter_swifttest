
// ignore_for_file: sort_child_properties_last, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_swifttest/constant/constant.dart';
import 'package:flutter_swifttest/helper/helper.dart';
import 'package:flutter_swifttest/helper/readjson.dart';
import 'package:provider/provider.dart';

class UserDetailPage extends StatefulWidget {
  const UserDetailPage({super.key, required this.title,required this.indexData});


  final String title;
  final int indexData;

  @override
  State<UserDetailPage> createState() => _UserDetailPage();
}

class _UserDetailPage extends State<UserDetailPage> {
 



@override
  void initState() {
 
  
   
    super.initState();
  }

  Widget showText(String title,String txt){

    return 
    Column(
      children: [

Container(
  width: double.infinity,
    margin: const EdgeInsets.only(left: 16,right: 16),
  padding: const EdgeInsets.all(4.0),
  
  child: 
 Text(title,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
),
         Container(
          width: double.infinity,
  margin: const EdgeInsets.only(left: 16,right: 16,top: 4,bottom: 4),
  padding: const EdgeInsets.all(4.0),
  decoration: BoxDecoration(
    border: Border.all(color: Colors.black26)
  ),
  child: Text(txt,style: TextStyle(fontSize: 16),),
)

      ],
    )
   ;

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
      SingleChildScrollView(
        child: 
      
      Column(
        children: [
         showText('ชื่อ-นามสกุล','${sqLiteHelper.UserModelResponse[widget.indexData].name} ${sqLiteHelper.UserModelResponse[widget.indexData].surname}'),
          showText('อายุ','${sqLiteHelper.UserModelResponse[widget.indexData].age} ปี'),
           showText('น้ำหนัก','${sqLiteHelper.UserModelResponse[widget.indexData].weight} ก.ก.'),
            showText('ส่วนสูง','${sqLiteHelper.UserModelResponse[widget.indexData].height} ซม.'),
             showText('ที่อยู่','${sqLiteHelper.UserModelResponse[widget.indexData].address} '),
              showText('ตำบล','${sqLiteHelper.UserModelResponse[widget.indexData].tumbon}'),
               showText('อำเภอ','${sqLiteHelper.UserModelResponse[widget.indexData].aumpher}'),
                showText('จังหวัด','${sqLiteHelper.UserModelResponse[widget.indexData].province} '),
                 showText('รหัสไปรษณีย์','${sqLiteHelper.UserModelResponse[widget.indexData].postcode}'),


        ],
      )

     
    ));
  },
);
 

    
  
  }
}