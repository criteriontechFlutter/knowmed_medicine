import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:knowmed/AppManager/UserRepository/user_data.dart';
import 'package:knowmed/AppManager/appUtils.dart';
import 'package:knowmed/AppManager/raw_api.dart';

import 'clinicalCalculatorController.dart';

class ClinicalCalculatorModal{

  ClinicalCalculatorController controller=Get.put(ClinicalCalculatorController());

  int i = 0;
  List alphabets = [];

  RawData rawData=RawData();
  App app=App();
  UserData userData=UserData();


  onDropdown(context)async{

    var body={
      "userId":UserData().getUserData.id.toString()
    };

    var data=await rawData.api('Knowmed/getAllSpeciality', body, context);
    if(data['responseCode']==1){
      controller.updateFilterList=data['responseValue'];
      print(data.toString()+'faheem');
    }
  }








  getLetters(){
    for(i = 65;i<=90;i++){
      alphabets.add(String.fromCharCode(i));
    }
  }


  onCalculator(context,{
    bool getAllData=false,
    bool removeAlphabet=false,
  })async{

    controller.updateShowNoData=false;
    var body={
      "alphabet":getAllData?"":controller.alpha.toString(),
      "userId":UserData().getUserData.id.toString()
    };

    if(removeAlphabet){
      body.remove('alphabet');
    }
    print(body);

    var data=await rawData.api('Knowmed/calculatorList', body, context,token: true);
    controller.updateShowNoData=true;
    if(data['responseCode']==1){
      print('--------'+data.toString());
      controller.updateClinicalCalculatorList=data['responseValue'];
    }


  }
}