import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:knowmed/Pages/Dashboard/DashboardOption/DeficiencyChecker/deficiencychecker_datamodel.dart';
import 'package:knowmed/Pages/Dashboard/DashboardOption/DeficiencyChecker/dificiency_checker_result_Data_Modal.dart';


class DificiencyCheckerController extends GetxController{

  List symptomChecker = [].obs;

  //Rx<TextEditingController> medicineC = new TextEditingController().obs;


  List addedSymptom = [].obs;
  //List addedDescription = [].obs;
  List addedSymptomId =[].obs;
  String symptomName = '';
  RxString symptomIDS = ''.obs;


  List<AllSymptomsrDataModel> get getSymptomCheckerData=>List<AllSymptomsrDataModel>.from(
      (
          (searchC.value.text==''?symptomChecker:symptomChecker.where((element) =>
              (
                  element['problemName'].toString().toLowerCase()
              ).trim().contains(searchC.value.text.toLowerCase().trim())
          ))
              .map((element) => AllSymptomsrDataModel.fromJson(element))
      ));


  set updateSymptomData(List val){
    symptomChecker=val;
    update();
  }

  Rx<TextEditingController> searchC = TextEditingController().obs;

  //Use for Dificiency checker

  Map effectedDeficiencyDetailsList={}.obs;

  DificiencyCheckerDataModal get getDeficiencyDetailsList => DificiencyCheckerDataModal.fromJson(effectedDeficiencyDetailsList);

  set updateEffectedDificiencyDetailsList(Map val){
    effectedDeficiencyDetailsList =val;
    update();
  }


}