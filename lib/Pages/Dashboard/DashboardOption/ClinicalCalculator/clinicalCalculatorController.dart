import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'clinicalCalculatorDataModal.dart';

class ClinicalCalculatorController extends GetxController{

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
          "id": 0, "specialityName": "Select Filter"
        });
    update();
  }



  List clinicalCalculatorList=[].obs;

  List<ClinicalCalculatorDataModal> get getClinicalCalculatorList=>searchC.value.text==''?List<ClinicalCalculatorDataModal>.from(
      clinicalCalculatorList.map((element) => ClinicalCalculatorDataModal.fromJson(element))
  ):List<ClinicalCalculatorDataModal>.from(
      clinicalCalculatorList.map((element) => ClinicalCalculatorDataModal.fromJson(element))
  ).where((element) => (element.calculatorTitle!.toLowerCase().contains(searchC.value.text.toLowerCase()))).toList();

  set  updateClinicalCalculatorList(List val){
    clinicalCalculatorList=val;
    update();
  }


  int medicineGroupId=0;
  int get getMedicineGroupId =>medicineGroupId;
  set updateMedicineGroupId(int val){
    medicineGroupId=val;
    alpha="A-Z";
    update();
  }


}