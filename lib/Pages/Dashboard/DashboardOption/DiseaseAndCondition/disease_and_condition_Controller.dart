import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:knowmed/Pages/Dashboard/DashboardOption/DiseaseAndCondition/disease_Data_Modal.dart';


class DiseaseController extends GetxController{

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


  // List filterList=[].obs;
  //
  // List get getFilterList =>filterList;
  // set updateFilterList(List val){
  //   filterList=val;
  //   filterList.insert(
  //       0,
  //       {
  //     "id": 0, "groupName": "Select Filter"
  //   });
  //   update();
  // }


  List diseaseAlphabet = [].obs;


  set  updateDiseaseAlphabet(List val){
    diseaseAlphabet=val;
    update();
  }

  List<DiseaseDataModal> get getDiseaseAlphabet=>searchC.value.text==''?List<DiseaseDataModal>.from(
      diseaseAlphabet.map((element) => DiseaseDataModal.fromJson(element))
  ):List<DiseaseDataModal>.from(
      diseaseAlphabet.map((element) => DiseaseDataModal.fromJson(element))
  ).where((element) => (element.problemName!.toLowerCase().contains(searchC.value.text.toLowerCase()))).toList();



int diseaseId=0;
  int get getDiseaseId =>diseaseId;
  set updateDiseaseId(int val){
  diseaseId=val;
  alpha="A-Z";
  update();
}




}