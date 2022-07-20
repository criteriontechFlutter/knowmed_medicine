import 'dart:developer';

import 'package:get/get.dart';
import 'package:knowmed/Pages/Dashboard/DashboardOption/DiseaseAndCondition/disease_and_condition_Controller.dart';
import 'package:knowmed/Pages/Dashboard/DashboardOption/DiseaseAndCondition/disease_details/disease_Details_Controller.dart';
import '../../../../../AppManager/raw_api.dart';
import '../../../../../AppManager/UserRepository/user_data.dart';


class DiseaseDetailsModal{

  DiseaseDetailsController controller=Get.put(DiseaseDetailsController());
  DiseaseController controller2 =Get.put(DiseaseController());

  UserData userData=UserData();
  RawData rawData=RawData();

  diseaseDetails(context, int index)async{

    var body={
      "userId":UserData().getUserData.id.toString(),
    // "departmentId":controller2.getDiseaseAlphabet[index].id.toString(),
     "problemId":controller2.getDiseaseAlphabet[index].id.toString()
     //  "departmentId":"9",
     //  "problemId":"222",
     //  "userId":"120",

    };

    var data=await rawData.api('Knowmed/diseaseReport', body, context);
    log('qqqqqqqqqqqqqqqqqqqqqqqqqq'+data.toString());
    controller.updateDiseaseDetailsList=data['responseValue'];
  }
}