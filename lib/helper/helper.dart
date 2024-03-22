
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../model/usermodel.dart';
class SQLiteHelper with ChangeNotifier{

  final String nameDatabase = 'swifttest.db';

  final int version = 1;
  final String tableDatabase = 'tableUser';
  final String columnId = 'id';
  final String columnName ='name';
  final String columnSurName ='surname';
    final String columnAge ='age';
  final String columnWeight ='weight';
  final String columnHeight ='height';
  final String columnAddress ='address';
  final String columnProvince ='province';
  final String columnAumpher ='aumpher';
  final String columnTumbon ='tumbon';
  final String columnPostCode ='postcode';

  List<UserModel> _UserModelResponse = [];


  SQLiteHelper(){
    initDatabase();

  }
  
  List<UserModel> get UserModelResponse => _UserModelResponse;

  set UserModelResponse(List<UserModel> value) {
    _UserModelResponse = value;
     notifyListeners();
  }

  Future<Null> initDatabase() async{
    await openDatabase(join(await getDatabasesPath(),nameDatabase),
    version: version,
    onCreate: (db,version) => db.execute('CREATE TABLE $tableDatabase ($columnId integer primary key autoincrement,$columnName TEXT,$columnSurName TEXT,$columnWeight REAL,$columnAge INTEGER,$columnHeight REAL,$columnAddress TEXT,$columnProvince TEXT,$columnAumpher TEXT,$columnTumbon TEXT,$columnPostCode TEXT)'),
    
    ).then((value) => getAllUser());
  }

  Future<Database>connectedDatabase()async {
    return await openDatabase(join(await getDatabasesPath(),nameDatabase));

  }


  Future<List<UserModel>>getAllUser()async{
    Database db = await connectedDatabase();
    List<UserModel> result = [];
    List<Map<String,dynamic>> maps = await db.query(tableDatabase);
    for (var item in maps){
      UserModel model = UserModel.fromMap(item);
      result.add(model);

    }
     print('get all success${result.toString()}');
      //print('get name 1${result.first.name}');
      
      if(result.isNotEmpty){
 UserModelResponse = result;
  print('UserModelResponse 1${_UserModelResponse.first.name}');
      }
     
      
   

    return result;

  }

  Future<Null>insertUser(UserModel userModel) async{
      Database db = await connectedDatabase();
      await db.insert(tableDatabase, userModel.toMap()).
      then((value) =>
       {
          print('insert success${userModel.name}'),
          getAllUser()
      
        
      });


  }

  Future<Null> deleteUser(int id) async {
    final db = await connectedDatabase(); // อ้างอิงฐานข้อมูล
 
    // คืนค่าเป็นตัวเลขจำนวนรายการที่มีการเปลี่ยนแปลง
    db.delete(
      tableDatabase, 
      where: '$columnId = ?',
      whereArgs: [id],      
    ).then((value) => getAllUser() );
 
  }

   Future<List<UserModel>> getUserbyProvince(String province) async {
    final db = await connectedDatabase();
     List<UserModel> result = []; // อ้างอิงฐานข้อมูล
 
    // ทำคำสั่งคิวรี่ข้อมูลตามเงื่อนไข 
    final maps = await db.query(
      tableDatabase,
      where: '${columnProvince} = ?',
      whereArgs: [province],
    );

     for (var item in maps){
      UserModel model = UserModel.fromMap(item);
      result.add(model);

    }
 
    // ถ้ามีข้อมูล แสดงข้อมูลกลับออกไป
     print('get from province success${result.toString()}');
      //print('get name 1${result.first.name}');
      
      if(result.isNotEmpty){
       UserModelResponse = result;
       print('UserModelResponse 1${_UserModelResponse.first.name}');
      }
     
    return result;
  
  }  

}