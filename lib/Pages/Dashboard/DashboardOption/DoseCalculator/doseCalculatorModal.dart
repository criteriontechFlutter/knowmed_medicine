import 'package:get/get.dart';
import 'package:knowmed/AppManager/AlertDialogue.dart';
import 'package:knowmed/AppManager/UserRepository/user_data.dart';
import 'package:knowmed/AppManager/appUtils.dart';
import 'package:knowmed/AppManager/raw_api.dart';
import 'package:knowmed/Pages/Dashboard/DashboardOption/DoseCalculator/doseCalculatorController.dart';

import 'DoseCalculatorDetails/detailsView.dart';

class DoseCalculatorModal{

  DoseCalculatorController controller=Get.put(DoseCalculatorController());

  UserData userData=UserData();
  RawData rawData=RawData();
  App app =App();

  doseUnitList(context)async{
    
    var body={

      "userId":UserData().getUserData.id.toString(),
    };
    
    var data=await rawData.api('Knowmed/ageUnitList', body, context);
    print('iiiiiiiiiii'+data.toString());
    //controller.updateUnitDoseList=data['responseValue'];
    if(data['responseCode']==1){
      controller.updateUnitDoseList=data['responseValue'];

    }else{
      alertToast(context, data['responseValue']);
    }
  }

  getAllMedicine(context)async{

    var body={
      "alphabet":controller.medicineC.value.text.toString(),
      "userId":UserData().getUserData.id.toString(),
    };

    var data=await rawData.api('Knowmed/getAllMedicineByAlphabet', body, context,token: true);
   if(data['responseCode']==1){

controller.updateAllMedicineList=data['responseValue'];   }

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

  doseCalculate(context)async{

    var body={
      "age": controller.ageC.value.text.toString(),
      "ageUnitId": controller.ageUnitId.toString(),
      "medicineId": controller.medicineId.toString(),
      "problemId": controller.problemId.toString(),
      "userId": UserData().getUserData.id.toString(),
      "weight": controller.weightC.value.text.toString()
    };

    print(body);
    var data=await rawData.api('Knowmed/doseCalculator', body, context,token: true);
    print(data);
    if(data['responseCode']==1){
      alertToast(context,'Success');
       app.replaceNavigate(context, DtailsView());
    }
    else{
      alertToast(context,'kbvhfsd');
    }
  }
}