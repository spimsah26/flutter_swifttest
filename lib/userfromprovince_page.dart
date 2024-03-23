
// ignore_for_file: sort_child_properties_last, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swifttest/helper/helper.dart';
import 'package:flutter_swifttest/helper/readjson.dart';
import 'package:flutter_swifttest/model/usermodel.dart';
import 'package:flutter_swifttest/userdatailpage.dart';
import 'package:provider/provider.dart';

class UserFromProvincePage extends StatefulWidget {
  const UserFromProvincePage({super.key, required this.title});


  final String title;

  @override
  State<UserFromProvincePage> createState() => _UserFromProvincePage();
}

class _UserFromProvincePage extends State<UserFromProvincePage> {
  //  int _index = 0;
    List<UserModel> allUserList = [];
     GlobalKey<AutoCompleteTextFieldState<String>> key = GlobalKey();
   

 

 ReadJsonHelper? readJsonObj ;
  List<String> searchSuggess = [];
 getProvincesData()async{
  searchSuggess = [];
  //sugg = [];
   readJsonObj = ReadJsonHelper();
    searchSuggess = await  readJsonObj!.getOnlyProvincesSuggess();
    
    _selectedItem = searchSuggess.first;
   
    
 
   
    print('all user get Province $searchSuggess');

    
   

   
    setState(() {
    // sugg =searchSuggess;
    getUserFromProvince();
      
    });
}

getUserFromProvince()async{
   await SQLiteHelper().getUserbyProvince(_selectedItem);
   setState(() {
     
   });
}

@override
  void dispose() {
    // TODO: implement dispose
    
    super.dispose();
  }

@override
  void initState() {
    // TODO: implement initState
   getProvincesData();
    

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
                    content: Text('ต้องการลบ ${sqLiteHelper.UserProvincesModelResponse[index].name} ${sqLiteHelper.UserProvincesModelResponse[index].surname}'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          // Close the dialog
                          sqLiteHelper.deleteUser(int.parse(sqLiteHelper.UserProvincesModelResponse[index].id.toString())).then((value) =>  Navigator.of(context).pop());
                        
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
  
   


String _selectedItem ='กรุงเทพมหานคร';


  @override
  Widget build(BuildContext context) {

    return 

    Consumer<SQLiteHelper>(builder: (context,sqLiteHelper,child) {

      return
    
    
    Scaffold(
      resizeToAvoidBottomInset: false,
     
      body: 
      
      SingleChildScrollView(
        child:
        
         Column(


          children: [


    //         Container(
    //           margin: EdgeInsets.all(8),
    //           width: double.infinity,
    //           height: 50,
    //           child: 
    //          DropdownButton<String>(
    //   value: _selectedItem,
    //   icon: const Icon(Icons.arrow_downward),
    //   elevation: 16,
    //   style: const TextStyle(color: Colors.deepPurple),
    //   underline: Container(
    //     height: 2,
    //     color: Colors.deepPurpleAccent,
    //   ),
    //   onChanged: (String? value) {
    //     // This is called when the user selects an item.
    //     setState(() {
    //       _selectedItem = value!;
    //     });
    //   },
    //   items: searchSuggess.map<DropdownMenuItem<String>>((String value) {
    //     return DropdownMenuItem<String>(
    //       value: value,
    //       child: Text(value),
    //     );
    //   }).toList(),
    // ),
              
              
    //         ),
          Center(
          child: DropdownButton<String>(
            value: _selectedItem,
            items: searchSuggess.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {

             
                _selectedItem = newValue!;
                  sqLiteHelper.getUserbyProvince(newValue);
              setState(() {
               
              });
            },
          ),
        ),

       

            SizedBox(
              height: 600,
              child: sqLiteHelper.UserProvincesModelResponse.isNotEmpty?     
  ListView.builder(
  itemCount: sqLiteHelper.UserProvincesModelResponse.length,
  itemBuilder: (BuildContext context, int index) {
    return 
       Column(
            children: [

          

      



              
            //  Text('${searchSuggess.length}'),
            // Text('${sqLiteHelper.UserModelResponse.length}'),
   ListTile(
              title: Text('${sqLiteHelper.UserProvincesModelResponse[index].name} ${sqLiteHelper.UserProvincesModelResponse[index].surname}'),
            trailing:
            IconButton(onPressed: () =>{
               print('delete $index id ${sqLiteHelper.UserProvincesModelResponse[index].id}'),
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
            ),


  





          ],
        )),
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