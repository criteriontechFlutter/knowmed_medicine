import 'package:get/get.dart';
import 'package:knowmed/AppManager/AlertDialogue.dart';
import 'package:knowmed/AppManager/UserRepository/user_data.dart';
import 'package:knowmed/AppManager/appUtils.dart';
import 'package:knowmed/AppManager/raw_api.dart';
import 'package:knowmed/Pages/Dashboard/DashboardOption/InteractionChecker/InteractionCheckerResult/resultView.dart';
import 'package:knowmed/Pages/Dashboard/DashboardOption/InteractionChecker/interactionCheckerController.dart';

class InteractionCheckerModal{

  InteractionCheckerController controller=Get.put(InteractionCheckerController());

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

controller.updateAllMedicineList=data['responseValue'];   }

  }


  checkInteraction(context)async{

    var body={
      "medicineId": controller.medicineId.toString(),
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