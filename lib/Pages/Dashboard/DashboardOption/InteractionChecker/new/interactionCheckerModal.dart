import 'dart:developer';

import 'package:get/get.dart';
import 'package:knowmed/AppManager/UserRepository/user_data.dart';
import 'package:knowmed/AppManager/appUtils.dart';
import 'package:knowmed/AppManager/progress_dialogue.dart';
import 'package:knowmed/AppManager/raw_api.dart';
import 'package:knowmed/Pages/Dashboard/DashboardOption/InteractionChecker/InteractionCheckerResult/resultView.dart';
import 'package:knowmed/Pages/Dashboard/DashboardOption/InteractionChecker/new/interactionCheckerController.dart';

import '../../../../../AppManager/AlertDialogue.dart';



class InteractionCheckerModal{

  InteractionCheckerController controller=Get.put(InteractionCheckerController());

  UserData userData=UserData();
  RawData rawData=RawData();
  App app =App();

  getInteractionsData(context) async{
    // controller.updateShowNoData=false;
     //ProgressDialogue().show(context, loadingText: 'Please wait...');
    var body={
     // 'userId': "120",
      //'alphabet':"",
      "alphabet":controller.searchC.value.text.toString(),
      "userId":UserData().getUserData.id.toString(),
    };
    var data=await rawData.api('Knowmed/interactionCheckerMedicineList', body, context,token: true);
    // controller.updateShowNoData=true;
    log("   " + data.toString());
    controller.updateMedicineData = data['responseValue'];
    // ProgressDialogue().hide();
  }


  checkInteraction(context)async{

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

    var body={
      //"medicineId": controller.medicineId.toString(),
      "medicineId": controller.medicineIDS.toString(),
      "userId": UserData().getUserData.id.toString(),
    };

    print(body);
    var data=await rawData.api('Knowmed/interactionChecker', body, context,token: true);
    print(data);
    if(data['responseCode']==1){
      alertToast(context,'Success');
      app.replaceNavigate(context, ResultView());
    }
    else{
      alertToast(context,'kbvhfsd');
    }
  }
}