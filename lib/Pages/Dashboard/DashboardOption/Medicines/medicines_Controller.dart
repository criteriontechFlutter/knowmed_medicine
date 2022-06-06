import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'medicines_Data_Modal.dart';

class MedicineController extends GetxController{

  Rx<TextEditingController> searchC = TextEditingController().obs;

  String alpha ='A';
  set updateAlphabet(String val){
    alpha=val;
    update();
  }

  RxBool showNoData=false.obs;
  bool get getShowNoData=>(showNoData.value);
  set updateShowNoData(bool val){
    showNoData.value=val;
    update();
  }


  List filterList=[].obs;

  List get getFilterList =>filterList;
  set updateFilterList(List val){
    filterList=val;
    filterList.insert(
        0,
        {
      "id": 0, "groupName": "Select Filter"
    });
    update();
  }


  List medicineAlphabet = [].obs;

  set  updateMedicineAlphabet(List val){
    medicineAlphabet=val;
    update();
  }

  List<MedicineDataModal> get getMedicineAlphabet=>searchC.value.text==''?List<MedicineDataModal>.from(
      medicineAlphabet.map((element) => MedicineDataModal.fromJson(element))
  ):List<MedicineDataModal>.from(
      medicineAlphabet.map((element) => MedicineDataModal.fromJson(element))
  ).where((element) => (element.medicineName!.toLowerCase().contains(searchC.value.text.toLowerCase()))).toList();



int medicineGroupId=0;
  int get getMedicineGroupId =>medicineGroupId;
  set updateMedicineGroupId(int val){
  medicineGroupId=val;
  alpha="A-Z";
  update();
}




}