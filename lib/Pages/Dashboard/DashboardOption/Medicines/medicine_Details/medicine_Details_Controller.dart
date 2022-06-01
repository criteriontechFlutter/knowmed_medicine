import 'package:get/get.dart';

import 'medicine_Details_DataModal.dart';

class MedicineDetailsController extends GetxController{

  List medicineDetailsList=[].obs;

  List <MedicineDetailsDataModal> get getMedicineDetailsList => List <MedicineDetailsDataModal>.from(
      medicineDetailsList.map((element) => MedicineDetailsDataModal.fromJson(element)));

  set updateMedicineDetailsList(List val){
    medicineDetailsList =val;
    update();
  }


}