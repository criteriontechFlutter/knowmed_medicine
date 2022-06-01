import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:knowmed/Pages/Dashboard/DashboardOption/MedicalTerminology/medical_term_Data_Modal.dart';


class MedicalTermController extends GetxController{

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


  List medicalTermAlphabet = [].obs;


  set  updateDiseaseAlphabet(List val){
    medicalTermAlphabet=val;
    update();
  }

  List<MedicalTerminologyDataModal> get getMedicalTermAlphabet=>searchC.value.text==''?List<MedicalTerminologyDataModal>.from(
      medicalTermAlphabet.map((element) => MedicalTerminologyDataModal.fromJson(element))
  ):List<MedicalTerminologyDataModal>.from(
      medicalTermAlphabet.map((element) => MedicalTerminologyDataModal.fromJson(element))
  ).where((element) => (element.term!.toLowerCase().contains(searchC.value.text.toLowerCase()))).toList();



int diseaseId=0;
  int get getDiseaseId =>diseaseId;
  set updateDiseaseId(int val){
  diseaseId=val;
  alpha="A-Z";
  update();
}




}