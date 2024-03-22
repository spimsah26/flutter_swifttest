
// ignore_for_file: sort_child_properties_last, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_swifttest/constant/constant.dart';
import 'package:flutter_swifttest/helper/helper.dart';
import 'package:flutter_swifttest/model/usermodel.dart';
import 'package:flutter_swifttest/userdatailpage.dart';
import 'package:provider/provider.dart';

class AllUserPage extends StatefulWidget {
  const AllUserPage({super.key, required this.title});


  final String title;

  @override
  State<AllUserPage> createState() => _AllUserPage();
}

class _AllUserPage extends State<AllUserPage> {
  //  int _index = 0;
    List<UserModel> allUserList = [];
   

 



@override
  void initState() {
    // TODO: implement initState
    // showData();
    

    super.initState();
  }
  showData()async{
    allUserList =await SQLiteHelper().getAllUser();
    setState(() {
      
    });

  }

   showAlertDialog(SQLiteHelper sqLiteHelper,  index){
    // ignore: avoid_print
    print('insert success in alert');

      showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('ต้องการลบข้อมูล'),
                    content: Text('ต้องการลบ ${sqLiteHelper.UserModelResponse[index].name} ${sqLiteHelper.UserModelResponse[index].surname}'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          // Close the dialog
                          sqLiteHelper.deleteUser(int.parse(sqLiteHelper.UserModelResponse[index].id.toString())).then((value) =>  Navigator.of(context).pop());
                        
                          // Navigator.pushNamed(context, Constant.routeUserPage);
                        },
                        child: Text('OK'),
                      ),
                       TextButton(
                        onPressed: () {
                   
                        Navigator.of(context).pop();
                        
                          // Navigator.pushNamed(context, Constant.routeUserPage);
                        },
                        child: Text('Cancel'),
                      ),
                    ],
                  );
                },
              );

   

   }
  
   





  @override
  Widget build(BuildContext context) {

    return 

    Consumer<SQLiteHelper>(builder: (context,sqLiteHelper,child) {

      return
    
    
    Scaffold(
     
      body: 
      
      // SingleChildScrollView(
      //   child:
        
        //  Column(
        //   children: [
        //     Text(widget.title),



  sqLiteHelper.UserModelResponse.isNotEmpty?     
  ListView.builder(
  itemCount: sqLiteHelper.UserModelResponse.length,
  itemBuilder: (BuildContext context, int index) {
    return 
       Column(
            children: [

              
            // Text('${allUserList?.length}'),
            // Text('${sqLiteHelper.UserModelResponse.length}'),
   ListTile(
              title: Text('${sqLiteHelper.UserModelResponse[index].name} ${sqLiteHelper.UserModelResponse[index].surname}'),
            trailing:
            IconButton(onPressed: () =>{
               print('delete $index id ${sqLiteHelper.UserModelResponse[index].id}'),
               showAlertDialog(sqLiteHelper,index)
               
                },
              icon: Icon(Icons.delete_outline),),
            
            onTap: () {
            //Navigator.pushNamed(context, Constant.routeUserPage);
            Navigator.push(context,
            MaterialPageRoute(builder: (context) => UserDetailPage(title: 'รายละเอียดข้อมูลบุคคล', indexData: index,)));
// ตัว SecondPage คือชื่อคลาสของ Page2 นะครับ
}
          
          ),
          Divider()
            ],
          );
   
  },
):Container(),





        //   ],
        // ),
   //  )


    );}
     );

      
      
  
    

    
  }
}

class UserMenu {
  const UserMenu({required this.title, required this.icon});

  final String title;
  final IconData icon;
}