
// ignore_for_file: sort_child_properties_last, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_swifttest/adduser_page.dart';

import 'alluser_page.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key, required this.title});


  final String title;

  @override
  State<UserPage> createState() => _UserPage();
}

class _UserPage extends State<UserPage> {

  static const List<UserMenu> userMenuList = const <UserMenu>[
  const UserMenu(title: 'รายชื่อทั้งหมด', icon: Icons.file_present),
  const UserMenu(title: 'เพิ่มรายชื่อ', icon: Icons.add_circle),

];

   





  @override
  Widget build(BuildContext context) {

    return 
    
    DefaultTabController(length: userMenuList.length, 
    child: 
    
    Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
            bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.list_alt_outlined),
                text:'รายชื่อทั้งหมด' ,
              ),
              Tab(
                icon: Icon(Icons.add_circle),
                text: 'เพิ่มรายชื่อ',
              ),
            
            ],
          ),
      ),
      body:

  TabBarView(
    children: userMenuList.map((UserMenu choice) {

      if(choice.title == 'รายชื่อทั้งหมด'){
        return AllUserPage(title: 'รายชื่อทั้งหมด');

      }else{
         return AddUserPage(title: 'เพิ่มรายชื่อ');

      }
           
            }).toList(),
  ),
// bottomNavigationBar: SafeArea(

//   child: Container(
//               color: Theme.of(context).primaryColor,
//               child: TabBar(
//                 unselectedLabelColor: Colors.black,
//                 onTap: (index) {
//                   print("index: ${index}");
//                 },
//                 tabs: userMenuList.map((UserMenu choice) {
//                   return Tab(
//                     text: choice.title,
//                     icon: Icon(choice.icon),
//                   );
//                 }).toList(),
//               ),
//             ),
// ),

    )

      
      
      );
    

    
  }
}

class UserMenu {
  const UserMenu({required this.title, required this.icon});

  final String title;
  final IconData icon;
}