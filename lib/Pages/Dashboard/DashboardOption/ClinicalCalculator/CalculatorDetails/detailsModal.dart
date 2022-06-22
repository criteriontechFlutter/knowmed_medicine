import 'package:get/get.dart';
import 'package:knowmed/AppManager/UserRepository/user_data.dart';
import 'package:knowmed/AppManager/appUtils.dart';
import 'package:knowmed/AppManager/raw_api.dart';
import 'package:knowmed/Pages/Dashboard/DashboardOption/ClinicalCalculator/CalculatorDetails/detailsController.dart';

import '../../../../../AppManager/AlertDialogue.dart';

class DetailsModal{

  DetailsController controller=Get.put(DetailsController());

  UserData userData=UserData();
  App app=App();
  RawData rawData=RawData();

  onCalculate(context)async{

    var body={
      "calculatorId":"254",
      "userId":"120"
    };

    var data=await rawData.api('Knowmed/calculatorControlsList', body, context,token: true);



  }
}