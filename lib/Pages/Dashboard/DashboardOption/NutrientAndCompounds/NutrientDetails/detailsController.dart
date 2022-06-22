import 'package:get/get.dart';
import 'package:knowmed/Pages/Dashboard/DashboardOption/NutrientAndCompounds/NutrientDetails/DataModal/detailsDataModal.dart';


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

}