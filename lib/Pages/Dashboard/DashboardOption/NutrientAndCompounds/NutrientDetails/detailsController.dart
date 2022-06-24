import 'package:get/get.dart';
import 'package:knowmed/Pages/Dashboard/DashboardOption/NutrientAndCompounds/NutrientDetails/DataModal/detailsDataModal.dart';
import 'package:knowmed/Pages/Dashboard/DashboardOption/NutrientAndCompounds/NutrientDetails/DataModal/dropDownDetailsDataModal.dart';


class NutrientDetailsController extends GetxController{

  List nutrientDetailsList=[].obs;

  List <NutrientDetailsDataModal> get getNutrientDetailsList => List <NutrientDetailsDataModal>.from(
      nutrientDetailsList.map((element) => NutrientDetailsDataModal.fromJson(element)));

  set updateNutrientDetailsList(List val){
    nutrientDetailsList =val;
    update();
  }

  List nutrientSelectFilterList=[].obs;

  List get getNutrientSelectFilterList=>nutrientSelectFilterList;
  set updateNutrientSelectFilterList(List val){
    nutrientSelectFilterList=val;
    nutrientSelectFilterList.insert(
        0,
        {
          "id": 0, "groupname": "Select Filter"
        });
    update();
  }





  List nutrientFactList=[].obs;

  List <DropDownNutrientFactDetailsDataModal> get getNutrientFactList => List <DropDownNutrientFactDetailsDataModal>.from(
      nutrientFactList.map((element) => DropDownNutrientFactDetailsDataModal.fromJson(element)));

  set updateNutrientFactList(List val){
    nutrientFactList =val;
    update();
  }


  RxString rIndex=''.obs;
  String? get getRIndex => rIndex.value;
  set updateRIndex(String value){
    rIndex.value = value;
    update();
  }

}