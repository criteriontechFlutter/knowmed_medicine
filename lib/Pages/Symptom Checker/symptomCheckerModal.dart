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

int i=0;
  List alphabets = [];
  getLetters(){
    for(i = 65;i<=90;i++){
      alphabets.add(String.fromCharCode(i));
    }

  }


  onSymptomsClick(context)async{

    var body={
      "regionOrganId": controller.getSelectSymptomId.toString(),
      "alphabet":controller.alpha.toString()
    };

    var data=await rawData.api('Knowmed/getAllSymptoms', body, context,token: true);
    controller.updateAllSymptomsList=data['responseValue'];
    print("rrrrrrrrrr"+data.toString());
  }

  onOptionTap(int index){
    print( controller.getAllSymptomsList[index]['id'].toString(),);
    if(controller.onTapSymptomsId.contains(controller.getAllSymptomsList[index]['id'])){
      controller.onTapSymptomsId.remove(controller.getAllSymptomsList[index]['id']);
      controller.update();
    }
    else{
      controller.onTapSymptomsId.add(controller.getAllSymptomsList[index]['id']);
      controller.update();
      print("list : " + controller.onTapSymptomsId.toString());
    }

  }

}