import 'package:get/get.dart';
import 'package:knowmed/AppManager/AlertDialogue.dart';
import 'package:knowmed/AppManager/UserRepository/user_data.dart';
import 'package:knowmed/AppManager/appUtils.dart';
import 'package:knowmed/AppManager/raw_api.dart';

import 'detailsController.dart';


class NutrientDetailsModal{

  NutrientDetailsController controller=Get.put(NutrientDetailsController());
  UserData userData=UserData();
  App app=App();
  RawData rawData=RawData();

  onPressDetails(context)async{

    var body=
    {
      "nutrientId":"2",
      "userId":UserData().getUserData.id.toString()
    };

    var data=await rawData.api('Knowmed/nutrientDetails', body, context,token: true);
    print(data.toString());
    controller.updateNutrientDetailsList=data['responseValue'];
  }
  
  onNutrientSelectFilter(context)async{
    
    var body={
      "userId":UserData().getUserData.id.toString(),
    };
    
    var data=await rawData.api('Knowmed/getAllFoodGroup', body, context,token: true);
    if(data['responseCode']==1){
      print('22222'+data.toString());
      controller.updateNutrientSelectFilterList=data['responseValue'];
    }
  }

  // onSecelctFoodCategory(context){
  //
  //   var body={
  //     "foodGroupId":"300",
  //       "nutrientCategoryId":"7",
  //       "nutrientId":"2",
  //       "pageIndex":"1",
  //       "pageSize":"50",
  //       "userId":"120"
  //   };
  //
  //   var data=rawData.api('Knowmed/getAllFoodByNutrient', body, context,token: true);
  //   print(data.toString()+"jjjjj");
  // }
}