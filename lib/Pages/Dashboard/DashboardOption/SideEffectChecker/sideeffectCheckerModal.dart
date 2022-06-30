import 'package:get/get.dart';
import 'package:knowmed/AppManager/AlertDialogue.dart';
import 'package:knowmed/AppManager/UserRepository/user_data.dart';
import 'package:knowmed/AppManager/appUtils.dart';
import 'package:knowmed/AppManager/raw_api.dart';
import 'package:knowmed/Pages/Dashboard/DashboardOption/SideEffectChecker/SideEffectCheckerDetails/sideeffect_checker_details_page_view.dart';
import 'package:knowmed/Pages/Dashboard/DashboardOption/SideEffectChecker/sideeffectCheckerController.dart';

class SideEffectCheckerModal{

  SideEffectCheckerController controller=Get.put(SideEffectCheckerController());

  UserData userData=UserData();
  RawData rawData=RawData();
  App app =App();


  getAllMedicine(context)async{

    var body={
      "alphabet":controller.medicineC.value.text.toString(),
      "userId":UserData().getUserData.id.toString(),
    };

    var data=await rawData.api('Knowmed/interactionCheckerMedicineList', body, context,token: true);
   if(data['responseCode']==1){

   controller.updateAllMedicineList=data['responseValue'];
   }

  }

  getAllSymptom(context)async{

    var body={
      "alphabet":controller.symptomC.value.text.toString(),
      "userId":UserData().getUserData.id.toString(),
    };

    var data=await rawData.api('Knowmed/getAllSymptoms', body, context,token: true);
    if(data['responseCode']==1){

      controller.updateAllSymptomList=data['responseValue'];   }

  }



  checkSideeffect(context)async{

    var body={
     // "medicineId": controller.medicineId.toString(),
     // "problemId": controller.medicineId.toString(),
      "medicineId": '495,384',
      "problemId": '2869,7925',
      "userId": UserData().getUserData.id.toString(),
    };

    print(body);
    var data=await rawData.api('Knowmed/sideEffectChecker', body, context,token: true);
    print(data);
    if(data['responseCode']==1){
      //alertToast(context,'Success');
       print('kkkkkkkkkkkkkkkkkkk'+data.toString());
       controller.updateEffectedMedicineDetailsList=data['responseValue'][0];
       app.replaceNavigate(context, const SideEffectCheckerDetailsPageView());
    }
    else{
      alertToast(context,'kbvhfsd');
    }
  }
}