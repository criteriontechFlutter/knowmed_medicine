import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class InteractionCheckerController extends GetxController{

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


 void onTapTest(Map val){
    getAllMedicineList.clear();
    medicineC.value.text=val['medicineName'].toString();
    update();
  }




}