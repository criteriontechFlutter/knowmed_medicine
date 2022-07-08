import 'package:get/get.dart';
import 'package:knowmed/AppManager/AlertDialogue.dart';
import 'package:knowmed/AppManager/UserRepository/user_data.dart';
import 'package:knowmed/AppManager/appUtils.dart';
import 'package:knowmed/AppManager/raw_api.dart';

import 'symptomCheckerController.dart';

class SymptomCheckerModal{

  SymptomCheckerController controller =Get.put(SymptomCheckerController());

  UserData userData=UserData();
  RawData rawData=RawData();
  App app=App();

  onClickAnimation(context)async{

    var body={
      "bodyRegionId": controller.getSelectedId.toString()
    };

    var data=await rawData.api('Knowmed/getBodyOrganRegion', body, context,token: true);
    if(data['responseCode']==1){
      controller.updateBodyOrganRegionList=data['responseValue'];
      print('00000000000000000000000000'+data.toString());
    }else{
      alertToast(context, 'Something went wrong');
    }

  }



  onSymptomsClick(context)async{

    var body={
      "regionOrganId": controller.getSelectSymptomId.toString(),
      "alphabet":"a".toString()
    };

    var data=await rawData.api('Knowmed/getAllSymptoms', body, context,token: true);
    controller.updateAllSymptomsList=data['responseValue'];
    print("rrrrrrrrrr"+data.toString());
  }

}