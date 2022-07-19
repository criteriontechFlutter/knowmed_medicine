import 'dart:developer';

import 'package:get/get.dart';
import 'package:knowmed/AppManager/UserRepository/user_data.dart';
import 'package:knowmed/AppManager/appUtils.dart';
import 'package:knowmed/AppManager/progress_dialogue.dart';
import 'package:knowmed/AppManager/raw_api.dart';
import 'package:knowmed/Pages/Dashboard/DashboardOption/FoodAndHerbs/Details/foodAndHerbController.dart';
import 'package:knowmed/Pages/Dashboard/DashboardOption/FoodAndHerbs/Details/food_and_herb_details_page_view.dart';
import 'package:knowmed/Pages/Dashboard/DashboardOption/FoodAndHerbs/food_And_Herb_Controller.dart';



import '../../../../../AppManager/AlertDialogue.dart';



class FoodHerbDetailsModal{

  FoodAndHerbDetailController controller=Get.put(FoodAndHerbDetailController());
  FoodAndHerbController controller2 =Get.put(FoodAndHerbController());

  RawData rawData=RawData();
  App app =App();


  //check side effects
  getFoodAndHerbDetails(context, int index)async{
    var body={
      //"medicineId": controller.medicineId.toString(),
     // "foodId": controller2.getFoodAlphabet[index].id.toString(),
      "foodId": '95815',
      "userId": UserData().getUserData.id.toString(),
    };

    print(body);
    var data=await rawData.api('Knowmed/foodReport', body, context,token: true);
    print(data);
    if(data['responseCode']==1){
      controller.updateMedicineDetailsList=data['responseValue'];
    }
    else{
      alertToast(context,'kbvhfsd');
    }
  }
}