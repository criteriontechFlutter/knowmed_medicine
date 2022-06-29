import 'dart:developer';

import 'package:get/get.dart';
import '../../../../../AppManager/raw_api.dart';
import '../../../../../AppManager/UserRepository/user_data.dart';
import '../medicines_Controller.dart';
import 'medicine_Details_Controller.dart';

class MedicineDetailsModal{

  MedicineDetailsController controller=Get.put(MedicineDetailsController());
  MedicineController controller2 =Get.put(MedicineController());

  UserData userData=UserData();
  RawData rawData=RawData();

  medicineDetails(context, int index)async{
    controller.updateShowNoData=false;

    var body={
      "medicineId":controller2.getMedicineAlphabet[index].id.toString(),
      "userId":"120"
    };

    var data=await rawData.api('Knowmed/medicineReport', body, context);
    controller.updateShowNoData=true;
    log('qqqqqqqqqqqqqqqqqqqqqqqqqq'+data.toString());
    controller.updateMedicineDetailsList=data['responseValue'];
  }
}