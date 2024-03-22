
// ignore_for_file: sort_child_properties_last, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_swifttest/helper/helper.dart';
import 'package:flutter_swifttest/helper/readjson.dart';
import 'package:flutter_swifttest/model/usermodel.dart';
import 'package:provider/provider.dart';
import 'package:flutter_swifttest/constant/constant.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';

class AddUserPage extends StatefulWidget {
  const AddUserPage({super.key, required this.title});


  final String title;

  @override
  State<AddUserPage> createState() => _AddUserPage();
}

class _AddUserPage extends State<AddUserPage> {
   int _index = 0;
   late AutoCompleteTextField searchTextField;
   GlobalKey<AutoCompleteTextFieldState<String>> key = GlobalKey();
     GlobalKey<AutoCompleteTextFieldState<String>> key2 = GlobalKey();
   

   final nameController = TextEditingController();
   final surNameController = TextEditingController();
   final titleNameController = TextEditingController();
   final ageController = TextEditingController();
   final weightController = TextEditingController();
   final heighController = TextEditingController();

   final addressController = TextEditingController();
   final tumbonController = TextEditingController();
   final aumpherController = TextEditingController();
   final provinceController = TextEditingController();
   final postcodeController = TextEditingController();

   // ignore: non_constant_identifier_names
    List<String> searchSuggess = [];
   String zip_code = 'รหัสไปรษณีย์';
   String province = '';
   String tambon = '';
   String amphure = '';

   Widget inputText( TextEditingController ctrl,String hintText,TextInputType textInputType){
    return Padding(
          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 12),
          child: TextField(
            controller: ctrl,
            keyboardType: textInputType,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: hintText,
            ),
          ),
        );
   }


    showAlertDialog(){
    // ignore: avoid_print
    print('insert success in alert');

      showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('บันทึกข้อมูลสำเร็จ'),
                    content: Text('สามารถดูข้อมูลจากรายชื่อทั้งหมด'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          // Close the dialog
                          Navigator.of(context).pop();
                          Navigator.pushNamed(context, Constant.routeUserPage);
                        },
                        child: Text('OK'),
                      ),
                    ],
                  );
                },
              );

   }

   
    ReadJsonHelper? readJsonObj ;

getProvincesData()async{
  searchSuggess = [];
  //sugg = [];
   readJsonObj = ReadJsonHelper();
    searchSuggess = await readJsonObj!.getProvincesSuggess();
    
    //print('setProvince obj${readJsonObj!.searchSuggess}');
     print('setProvince $sugg');
    print('setProvince $searchSuggess');
   

   
    setState(() {
    // sugg =searchSuggess;
      
    });
}

   @override
  void initState() {
    // TODO: implement initState
   getProvincesData();

    
     
    super.initState();
  }

   @override
  void dispose() {
    // TODO: implement dispose
      nameController.dispose();
          surNameController.dispose();
         ageController.dispose();
         weightController.dispose();
         heighController.dispose();

          addressController.dispose();
          tumbonController.dispose();
          aumpherController.dispose();
          provinceController.dispose();
         postcodeController.dispose();
    super.dispose();
  }

  List<String>sugg =['10200/พระบรมมหาราชวัง/เขตพระนคร/กรุงเทพมหานคร', '10200/วังบูรพาภิรมย์/เขตพระนคร/กรุงเทพมหานคร', '10200/วัดราชบพิธ/เขตพระนคร/กรุงเทพมหานคร', '10200/สำราญราษฎร์/เขตพระนคร/กรุงเทพมหานคร',];
  




   





  @override
  Widget build(BuildContext context) {

    return 

    Consumer<SQLiteHelper>(builder: (context,sQLiteHelper,child) =>
    
    
    Scaffold(

      resizeToAvoidBottomInset: true,
     
      body: SingleChildScrollView(
        child: Column(
          children: [
           // Text(widget.title),
              //Text(readJsonObj!.searchSuggess[0]),

            
         

            


          

            Stepper(
      currentStep: _index,
      onStepCancel: () {
        if (_index > 0) {
          setState(() {
            _index -= 1;
          });
        }
      },
      onStepContinue: () async{
            

         

        

        if (_index <= 0) {
          // ignore: avoid_print
          // print('read province provider ${readJsonHelper.ProvinceList[0].amphure?[0].nameTh}');
          // // ignore: avoid_print
          // print('read suggess provider ${readJsonHelper.searchSuggess.length}');
           print('continue tambon all ${searchSuggess.length}');
          setState(() {
            _index += 1;
          });
        }else{

           String name = nameController.text;
          String surname =surNameController.text;
          int age = int.parse(ageController.text);
          double weight =double.parse(weightController.text);
          double height = double.parse(heighController.text);

          String address = addressController.text;
          String tumbon =tumbonController.text;
          String aumpher =aumpherController.text;
          String province =provinceController.text;
          String postcode = postcodeController.text;

          UserModel userModel = UserModel(name: name, surname: surname, age: age, weight: weight, height: height, address: address, province: province, aumpher: aumpher, tumbon: tumbon, postcode: postcode);
         
          await  sQLiteHelper.insertUser(userModel).then((value) => {

          
             //print('insert success ${value.toString()}'),
             showAlertDialog(),
          }
         );

        }
  
      },
      onStepTapped: (int index) {
        setState(() {
          _index = index;
        });
      },
      steps: <Step>[
        Step(
          title: const Text('ข้อมูลส่วนตัว'),
          content: Container(
            alignment: Alignment.centerLeft,
            child: Column(
              children: [
                //inputText(titleNameController,'คำนำหน้า'),
                 inputText(nameController,'ชื่อ',TextInputType.text),
                  inputText(surNameController,'นามสกุล',TextInputType.text),
                   inputText(ageController,'อายุ',TextInputType.number),
                    inputText(weightController,'น้ำหนัก',TextInputType.number),
                     inputText(heighController,'ส่วนสูง',TextInputType.number),
              
                 



              ],
            ),
          ),
        ),
         Step(
          title: Text('ข้อมูลตามบัตรประชาชน'),
          content:  Container(
            alignment: Alignment.centerLeft,
            child: Column(
              children: [
                inputText(addressController,'ที่อยู่',TextInputType.text),

               AutoCompleteTextField<String>(
                key: key,
                
                clearOnSubmit: false,
                suggestions: searchSuggess,
                keyboardType: TextInputType.number,
                controller: postcodeController,
                decoration: InputDecoration(
                  hintText: "$zip_code",
                   border: OutlineInputBorder(),
                   
                ),
                itemFilter: (item, query) {
                  return item.toLowerCase().startsWith(query.toLowerCase());
                },
                itemSorter: (a, b) {
                  return a.compareTo(b);
                },
                itemSubmitted: (item) {
                  // setState(() {
                  //   //zip_code = item;
                  //     postcodeController.text = item.split('/')[0];
                  //     provinceController.text = item.split('/')[1];
                  //     aumpherController.text = item.split('/')[2];
                  //     tumbonController.text = item.split('/')[3];
                  // });
                },
                itemBuilder: (context, item) {
                  return ListTile(
                    title: Text(item),
                  );
                },
              ),

                 inputText(tumbonController,'ตำบล',TextInputType.text),
                  inputText(aumpherController,'อำเภอ',TextInputType.text),
                    inputText(provinceController,'จังหวัด',TextInputType.text),
                      //  inputText(postcodeController,'รหัสไปรษณีย์'),
              
                 



              ],
            ),
          ),
          ),
        
      ],
    )



          ],
        ),
      )


    )
     );

      
      
  
    

    
  }
}

class UserMenu {
  const UserMenu({required this.title, required this.icon});

  final String title;
  final IconData icon;
}