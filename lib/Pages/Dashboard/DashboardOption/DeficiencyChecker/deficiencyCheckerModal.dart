import 'dart:developer';

import 'package:get/get.dart';
import 'package:knowmed/AppManager/UserRepository/user_data.dart';
import 'package:knowmed/AppManager/appUtils.dart';
import 'package:knowmed/AppManager/progress_dialogue.dart';
import 'package:knowmed/AppManager/raw_api.dart';
import 'package:knowmed/Pages/Dashboard/DashboardOption/DeficiencyChecker/DificiencyCheckerDetails/dificiency_checker_details_page_view.dart';
import 'package:knowmed/Pages/Dashboard/DashboardOption/DeficiencyChecker/deficiencyCheckerController.dart';

import '../../../../../AppManager/AlertDialogue.dart';



class DificiencyCheckerModal{

  DificiencyCheckerController controller=Get.put(DificiencyCheckerController());

  UserData userData=UserData();
  RawData rawData=RawData();
  App app =App();

  getSymptomsData(context) async{
    // controller.updateShowNoData=false;
     //ProgressDialogue().show(context, loadingText: 'Please wait...');
    var body={
     // 'userId': "120",
      //'alphabet':"",
      "alphabet":controller.searchC.value.text.toString(),
      "userId":UserData().getUserData.id.toString(),
    };
    var data=await rawData.api('Knowmed/getAllSymptoms', body, context,token: true);
    // controller.updateShowNoData=true;
    log("   " + data.toString());
    controller.updateSymptomData = data['responseValue'];
    // ProgressDialogue().hide();
  }


  checkDeficiency(context)async{

    String demoString = "";
    String cached = "";
    demoString = demoString + controller.addedSymptomId.toString();
    for(int d =0;d<demoString.length;d++){
      if(demoString[d] == '[' || demoString[d] == "]" || demoString[d] == " "){
        print("");
      }
      else{
        cached = cached + demoString[d];
      }
    }
    controller.symptomIDS.value=cached;
    print("id -------------"+ controller.symptomIDS.toString());

    var body={
      //"medicineId": controller.medicineId.toString(),
      "problemId": controller.symptomIDS.toString(),
      //"problemId": '31,7743,15061,1279,1553,6030,7391,1302,4644,12355,1913,2898,1822,6447,2881,1949,4513',
      "userId": UserData().getUserData.id.toString(),
    };

    print(body);
    var data=await rawData.api('Knowmed/deficiencyChecker', body, context,token: true);
    print(data);
    if(data['responseCode']==1){
      controller.updateEffectedDificiencyDetailsList=data['responseValue'][0];
      app.replaceNavigate(context, const DeficiencyCheckerDetailsPageView());
    }
    else{
      alertToast(context,'kbvhfsd');
    }
  }
}