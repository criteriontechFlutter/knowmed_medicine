import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:knowmed/Pages/Dashboard/DashboardOption/SideEffectChecker/sideeffect_Data_Modal.dart';
import 'package:knowmed/Pages/Dashboard/DashboardOption/SideEffectChecker/medicine_datamodel.dart';
import 'package:knowmed/Pages/Dashboard/DashboardOption/SideEffectChecker/symptoms_datamodel.dart';


class SideeffectCheckerController extends GetxController{

  List medicineChecker = [].obs;
  List symptomChecker = [].obs;

 // Rx<TextEditingController> medicineC = new TextEditingController().obs;

  Rx<TextEditingController> medicineC = TextEditingController().obs;
  Rx<TextEditingController> symptomC = TextEditingController().obs;


  List addedMedicine = [].obs;
  //List addedDescription = [].obs;
  List addedMedicineId =[].obs;
  String medicineName = '';
  RxString medicineIDS = ''.obs;


  List<medicineCheckerDataModel> get getMedicineCheckerData=>List<medicineCheckerDataModel>.from(
      (
          (medicineC.value.text==''?medicineChecker:medicineChecker.where((element) =>
              (
                  element['medicineName'].toString().toLowerCase()
              ).trim().contains(medicineC.value.text.toLowerCase().trim())
          ))
              .map((element) => medicineCheckerDataModel.fromJson(element))
      ));


  set updateMedicineData(List val){
    medicineChecker=val;
    update();
  }

  //Use for symptoms

  List addedSymptoms = [].obs;
  //List addedDescription = [].obs;
  List addedSymptomId =[].obs;
  String SymptomName = '';
  RxString SymptomIDS = ''.obs;

  List<symptomDataModel> get getSymptomCheckerData=>List<symptomDataModel>.from(
      (
          (symptomC.value.text==''?symptomChecker:symptomChecker.where((element) =>
              (
                  element['problemName'].toString().toLowerCase()
              ).trim().contains(symptomC.value.text.toLowerCase().trim())
          ))
              .map((element) => symptomDataModel.fromJson(element))
      ));


  set updateSymptomData(List val){
    symptomChecker=val;
    update();
  }

  //Use for side effect checker

  Map effectedmedicineDetailsList={}.obs;

  SideEffectDataModal get getMedicineDetailsList => SideEffectDataModal.fromJson(effectedmedicineDetailsList);

  set updateEffectedMedicineDetailsList(Map val){
    effectedmedicineDetailsList =val;
    update();
  }




}