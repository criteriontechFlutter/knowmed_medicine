import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'interactionchecker_datamodel.dart';

class InteractionCheckerController extends GetxController{

  List interactionChecker = [].obs;

  Rx<TextEditingController> medicineC = new TextEditingController().obs;


  List addedMedicine = [].obs;
  //List addedDescription = [].obs;
  List addedMedicineId =[].obs;
  String medicineName = '';
  RxString medicineIDS = ''.obs;


  List<InteractionCheckerDataModel> get getInteractionCheckerData=>List<InteractionCheckerDataModel>.from(
      (
          (searchC.value.text==''?interactionChecker:interactionChecker.where((element) =>
              (
                  element['medicineName'].toString().toLowerCase()
              ).trim().contains(searchC.value.text.toLowerCase().trim())
          ))
              .map((element) => InteractionCheckerDataModel.fromJson(element))
      ));


  set updateMedicineData(List val){
    interactionChecker=val;
    update();
  }

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

  Rx<TextEditingController> searchC = TextEditingController().obs;


}