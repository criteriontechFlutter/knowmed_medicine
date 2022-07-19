import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:knowmed/Pages/Dashboard/DashboardOption/FoodAndHerbs/food_and_herb_Data_Modal.dart';


class FoodAndHerbController extends GetxController{

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
      "id": 0, "categoryName": "Select Filter"
    });
    update();
  }


  List foodAlphabet = [].obs;

  // List<MedicineDataModal> get getMedicineAlphabet=>List <MedicineDataModal>.from(
  //     medicineAlphabet.map((element) => MedicineDataModal.fromJson(element))
  // );

  set  updateFoodAlphabet(List val){
    foodAlphabet=val;
    update();
  }

  List<FoodAndHerbDataModal> get getFoodAlphabet=>searchC.value.text==''?List<FoodAndHerbDataModal>.from(
      foodAlphabet.map((element) => FoodAndHerbDataModal.fromJson(element))
  ):List<FoodAndHerbDataModal>.from(
      foodAlphabet.map((element) => FoodAndHerbDataModal.fromJson(element))
  ).where((element) => (element.foodName!.toLowerCase().contains(searchC.value.text.toLowerCase()))).toList();



int foodCategoryId=0;
  int get getFoodCategoryId =>foodCategoryId;
  set updateFoodCategoryId(int val){
  foodCategoryId=val;
  alpha="A-Z";
  update();
}




}