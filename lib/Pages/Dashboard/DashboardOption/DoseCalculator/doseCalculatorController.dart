import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class DoseCalculatorController extends GetxController{

  Rx<TextEditingController> medicineC = new TextEditingController().obs;
  Rx<TextEditingController> symptomC = new TextEditingController().obs;
  Rx<TextEditingController> ageC = new TextEditingController().obs;
  Rx<TextEditingController> weightC = new TextEditingController().obs;


  int ageUnitId=0;
  int medicineId=0;
  int problemId=0;

  List unitDoseList=[].obs;
  List get getUnitDoseList =>unitDoseList;
  set updateUnitDoseList(List val){
    unitDoseList=val;
    update();
  }


  List allMedicineList=[].obs;
  List get getAllMedicineList =>allMedicineList;
  set updateAllMedicineList(List val){
    allMedicineList=val;
    update();
  }


  List allSymptomList=[].obs;
  List get getAllSymptomList =>allSymptomList;
  set updateAllSymptomList(List val){
    allSymptomList=val;
    update();
  }


 void onTapTest(Map val){
    getAllMedicineList.clear();
    medicineC.value.text=val['medicineName'].toString();
    update();
  }

  void onTapSymptom(Map val){
    getAllSymptomList.clear();
    symptomC.value.text=val['problemName'].toString();
    update();
  }

  void onTapDropDown(val){
    ageC.value.text=val['id'].toString();
    update();
  }
}