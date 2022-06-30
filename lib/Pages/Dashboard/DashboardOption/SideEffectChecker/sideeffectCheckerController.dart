import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:knowmed/Pages/Dashboard/DashboardOption/SideEffectChecker/sideeffect_Data_Modal.dart';

class SideEffectCheckerController extends GetxController{

  Rx<TextEditingController> medicineC = new TextEditingController().obs;
  Rx<TextEditingController> symptomC = new TextEditingController().obs;
  Rx<TextEditingController> ageC = new TextEditingController().obs;
  Rx<TextEditingController> weightC = new TextEditingController().obs;


  int ageUnitId=0;
  int medicineId=0;
  int problemId=0;


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

  Map effectedmedicineDetailsList={}.obs;

  SideEffectDataModal get getMedicineDetailsList => SideEffectDataModal.fromJson(effectedmedicineDetailsList);

  set updateEffectedMedicineDetailsList(Map val){
    effectedmedicineDetailsList =val;
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


}