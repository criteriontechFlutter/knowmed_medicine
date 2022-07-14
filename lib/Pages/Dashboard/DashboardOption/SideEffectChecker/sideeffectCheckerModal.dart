import 'dart:developer';

import 'package:get/get.dart';
import 'package:knowmed/AppManager/UserRepository/user_data.dart';
import 'package:knowmed/AppManager/appUtils.dart';
import 'package:knowmed/AppManager/progress_dialogue.dart';
import 'package:knowmed/AppManager/raw_api.dart';
import 'package:knowmed/Pages/Dashboard/DashboardOption/SideEffectChecker/SideEffectCheckerDetails/sideeffect_checker_details_page_view.dart';
import 'package:knowmed/Pages/Dashboard/DashboardOption/SideEffectChecker/sideEffectCheckerController.dart';


import '../../../../../AppManager/AlertDialogue.dart';



class SideeffectCheckerModal{

  SideeffectCheckerController controller=Get.put(SideeffectCheckerController());

  UserData userData=UserData();
  RawData rawData=RawData();
  App app =App();

  //Use to get medicine list
  getMedicinesData(context) async{
    // controller.updateShowNoData=false;
     //ProgressDialogue().show(context, loadingText: 'Please wait...');
    var body={
     // 'userId': "120",
      //'alphabet':"",
      "alphabet":controller.medicineC.value.text.toString(),
      "userId":UserData().getUserData.id.toString(),
    };
    var data=await rawData.api('Knowmed/interactionCheckerMedicineList', body, context,token: true);
    // controller.updateShowNoData=true;
    log("   " + data.toString());
    controller.updateMedicineData = data['responseValue'];
    // ProgressDialogue().hide();
  }

  //Use to get symptoms
  getAllSymptom(context) async{
    // controller.updateShowNoData=false;
    //ProgressDialogue().show(context, loadingText: 'Please wait...');
    var body={
      // 'userId': "120",
      //'alphabet':"",
      "alphabet":controller.symptomC.value.text.toString(),
      "userId":UserData().getUserData.id.toString(),
    };
    var data=await rawData.api('Knowmed/getAllSymptoms', body, context,token: true);
    // controller.updateShowNoData=true;
    log("   " + data.toString());
    controller.updateSymptomData = data['responseValue'];
    // ProgressDialogue().hide();
  }



  //check side effects
  checkSideeffect(context)async{

    String demoString = "";
    String cached = "";
    demoString = demoString + controller.addedMedicineId.toString();
    for(int d =0;d<demoString.length;d++){
      if(demoString[d] == '[' || demoString[d] == "]" || demoString[d] == " "){
        print("");
      }
      else{
        cached = cached + demoString[d];
      }
    }
    controller.medicineIDS.value=cached;
    print("id -------------"+ controller.medicineIDS.toString());

    //for problem id
    String problemString = "";
    String symptom = "";
    problemString = problemString + controller.addedSymptomId.toString();
    for(int d =0;d<problemString.length;d++){
      if(problemString[d] == '[' || problemString[d] == "]" || problemString[d] == " "){
        print("");
      }
      else{
        symptom = symptom + problemString[d];
      }
    }
    controller.SymptomIDS.value=symptom;
    print("problemId -------------"+ controller.SymptomIDS.toString());

    var body={
      //"medicineId": controller.medicineId.toString(),
     // "medicineId": '495,384',
      //"problemId": '2869,7925',
      "medicineId": controller.medicineIDS.toString(),
      "problemId": controller.SymptomIDS.toString(),
      "userId": UserData().getUserData.id.toString(),
    };

    print(body);
    var data=await rawData.api('Knowmed/sideEffectChecker', body, context,token: true);
    print(data);
    if(data['responseCode']==1){
      //alertToast(context,'Success');
      controller.updateEffectedMedicineDetailsList=data['responseValue'][0];
      app.replaceNavigate(context, const SideEffectCheckerDetailsPageView());
    }
    else{
      alertToast(context,'kbvhfsd');
    }
  }
}