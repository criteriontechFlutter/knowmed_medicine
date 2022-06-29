import 'package:get/get.dart';

import 'medicine_Details_DataModal.dart';

class MedicineDetailsController extends GetxController{

  RxBool showNoData=false.obs;
  bool get getShowNoData=>(showNoData.value);
  set updateShowNoData(bool val){
    showNoData.value=val;
    update();
  }

  List medicineDetailsList=[].obs;

  List <MedicineDetailsDataModal> get getMedicineDetailsList => List <MedicineDetailsDataModal>.from(
      medicineDetailsList.map((element) => MedicineDetailsDataModal.fromJson(element)));

  set updateMedicineDetailsList(List val){
    medicineDetailsList =val;
    update();
  }


}