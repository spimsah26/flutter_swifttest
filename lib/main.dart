import 'package:flutter/material.dart';
import 'package:flutter_swifttest/constant/constant.dart';
import 'package:flutter_swifttest/helper/helper.dart';
import 'package:flutter_swifttest/helper/readjson.dart';
import 'package:flutter_swifttest/mainmenu.dart';
import 'package:flutter_swifttest/user_page.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
//  MultiProvider(
//       providers: [
//         ChangeNotifierProvider<SQLiteHelper>(create: (context) => SQLiteHelper()),
//         // Provider(create: (context) => SomeOtherClass()),
//       ],
//       child: const MyApp(),
//     );
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return 
    MultiProvider(
      providers: [
        ChangeNotifierProvider<SQLiteHelper>(create: (context) =>SQLiteHelper() ),
        ChangeNotifierProvider<ReadJsonHelper>(create: (context) =>ReadJsonHelper())
        ],

      child: 
           MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
     
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MainMenu(title: 'Home Page'), 
      routes: <String, WidgetBuilder> {
      Constant.routeUserPage: (BuildContext context) => UserPage(title: 'ข้อมูลบุคคล'),
     
    },
   
    )
      ,

    );
    

  }
}
