
import 'package:get/get.dart';
import 'package:knowmed/Pages/Dashboard/DashboardOption/FoodAndHerbs/Details/foodandherb_Data_Modal.dart';




class FoodAndHerbDetailController extends GetxController{


  List medicineDetailsList=[].obs;

  List <FoodAndHerbDetailsDataModal> get getMedicineDetailsList => List <FoodAndHerbDetailsDataModal>.from(
      medicineDetailsList.map((element) => FoodAndHerbDetailsDataModal.fromJson(element)));

  set updateMedicineDetailsList(List val){
    medicineDetailsList =val;
    update();
  }







}