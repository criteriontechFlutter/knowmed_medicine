import 'dart:convert';

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
    controller.updateShowNoData=false;
    var body={
      "regionOrganId": controller.getSelectSymptomId.toString(),
      "alphabet":controller.alpha.toString()
    };

    var data=await rawData.api('Knowmed/getAllSymptoms', body, context,token: true);
    controller.updateShowNoData=true;
    if(data['responseCode']==1){
      controller.updateAllSymptomsList=data['responseValue'];
      print("rrrrrrrrrr"+data.toString());
    }else{
      alertToast(context, 'Something went wrong');
    }

  }

  onBodyPartSymptomsTap(int index){
    print( controller.getAllSymptomsList[index].id.toString(),);
    if(controller.onTapBodyPartSymptomsId.contains(controller.getAllSymptomsList[index].id)){
      controller.onTapBodyPartSymptomsId.remove(controller.getAllSymptomsList[index].id);
      controller.update();
    }
    else{
      controller.onTapBodyPartSymptomsId.add(controller.getAllSymptomsList[index].id);
      controller.update();
      print("list : " + controller.onTapBodyPartSymptomsId.toString());
    }

  }

  onSuggestedProblem(context)async{
    var body={
      "problemId":""
    };

    var data=await rawData.api('Knowmed/getAllSuggestedProblem', body, context,token: true);
    if(data['responseCode']==1){
      controller.updateSuggestedProblemList=data['responseValue'];
      print("_____------_____"+data.toString());
    }else{
      alertToast(context, 'Something went wrong');
    }

  }

  onSuggestProblemTap(int index){
    if(controller.unlocalizedProblemId.contains(controller.getSuggestedProblemList[index].id)){
      controller.unlocalizedProblemId.remove(controller.getSuggestedProblemList[index].id);
      controller.update();
    }else{
      controller.unlocalizedProblemId.add(controller.getSuggestedProblemList[index].id);
      controller.update();
      print("Unlocalized List :"+controller.unlocalizedProblemId.toString());
    }
  }



  onAddAnyOtherDisease(context)async{

    var body={
      "":""
    };

    var data=await rawData.api('Knowmed/getAllSuggestedDisease', body, context,token: true);
    controller.updateAddOtherDiseaseList=data['responseValue'];
    print('////////'+data.toString());
  }

  onTapDisease(int index){
    if(controller.diseaseSufferedId.contains(controller.getAddOtherDiseaseList[index].id)){
      controller.diseaseSufferedId.remove(controller.getAddOtherDiseaseList[index].id);
      controller.update();
    }else{
      controller.diseaseSufferedId.add(controller.getAddOtherDiseaseList[index].id);
      controller.update();
      print("Disease List: "+controller.diseaseSufferedId.toString());
    }
  }

}