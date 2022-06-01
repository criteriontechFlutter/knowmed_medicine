import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:knowmed/Pages/Dashboard/DashboardOption/NutrientAndCompounds/nutrient_and_compound_Data_Modal.dart';


class NutrientController extends GetxController{

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
      "id": 0, "nutrientCategory": "Select Filter"
    });
    update();
  }


  List nutrientAlphabet = [].obs;


  set  updateNutrientAlphabet(List val){
    nutrientAlphabet=val;
    update();
  }

  List<NutrientDataModal> get getNutrientAlphabet=>searchC.value.text==''?List<NutrientDataModal>.from(
      nutrientAlphabet.map((element) => NutrientDataModal.fromJson(element))
  ):List<NutrientDataModal>.from(
      nutrientAlphabet.map((element) => NutrientDataModal.fromJson(element))
  ).where((element) => (element.nutrientName!.toLowerCase().contains(searchC.value.text.toLowerCase()))).toList();



int nutrientId=0;
  int get getNutrientCategoryId =>nutrientId;
  set updateNutrientId(int val){
  nutrientId=val;
  alpha="A-Z";
  update();
}




}