import 'package:flutter/material.dart';

class Constant{
  //Route
  static String routeMainMenu ='/mainmenu';
  static String routeUserPage ='/user_page';
   static String routeUserDetail ='/user_detail';
    static String routeDartTestMain ='/darttestmain';
    static String routeDartTest1 ='/darttest1';
    static String routeDartTest2 ='/darttest2';
    static String routeDartTest3 ='/darttest3';
    static String routeDartTest4 ='/darttest4';

   static   showMsgAlertDialog(String title,String content,BuildContext context){
    print('alert msg $title');

    showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('$title'),
                    content: Text('$content'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          // Close the dialog
                          Navigator.of(context).pop();
                        },
                        child: Text('OK'),
                      ),
                    ],
                  );
                },
              );
   }

}