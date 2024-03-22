
// ignore_for_file: sort_child_properties_last, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_swifttest/constant/constant.dart';
import 'package:flutter_swifttest/helper/helper.dart';
import 'package:flutter_swifttest/helper/readjson.dart';
import 'package:provider/provider.dart';

class DartTest1 extends StatefulWidget {
  const DartTest1({super.key, required this.title});


  final String title;

  @override
  State<DartTest1> createState() => _DartTest1();
}

class _DartTest1 extends State<DartTest1> {
 


@override
  void initState() {
 
  }

 
 final lastNumController = TextEditingController();
  final modFirstController = TextEditingController();
  final modSecondController = TextEditingController();
  String answer ='';
  calculate(){

answer ='';

int last =int.parse(lastNumController.text);
int mod1 =int.parse(modFirstController.text);
int mod2 =int.parse(modSecondController.text);

for(var i=1;i <= last ;i++){
  print('${3%3}');
   print('${5%5}');

  if(i % mod1== 0 && i % mod2 == 0){
   answer += '$i,';

  }

}
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
      SingleChildScrollView(
        child: Column(
          children: [
             SizedBox(height: 20,),
            Row(
               mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.center,
  mainAxisSize: MainAxisSize.min,
              children: [
                  

                Text('From 1 to '),
   SizedBox(
  width: 80.0,
  height: 40,
  child: 
                TextField(
                  
            controller: lastNumController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: '0',
              
            ),
          )),



              ],
            ),
            SizedBox(height: 10,),

              Row(
               mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.center,
  mainAxisSize: MainAxisSize.min,
              children: [
                Text('Divide '),
                 SizedBox(
  width: 80.0,
  height: 40,
  child: 
                TextField(
                  
            controller: modFirstController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: '0',
              
            ),
          )),
  Text(' and '),
       SizedBox(
  width: 80.0,
  height: 40,
  child: 
                TextField(
                  
            controller: modSecondController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: '0',
              
            ),
          )),

          Text(' evenly.'),

          


              ],
            ),
            

                      Container(
          width: double.infinity,
  margin: const EdgeInsets.only(left: 100,right: 100,top: 20,bottom: 20),
  padding: const EdgeInsets.all(4.0),
  decoration: BoxDecoration(
    border: Border.all(color: Colors.black26)
  ),
  child:  TextButton(
                        onPressed: () {
                           calculate();
                          
                         
                        },
                        child: Text('Answer'),
                      ),
),

Container(
  margin: EdgeInsets.all(8),
  child: 
  answer.length > 0?
  Text('${answer.substring(0,answer.length-1)}'):Container(),
),
                 


          ],
        ),
      )

    
    );

 

    
  
  }
}