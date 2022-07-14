

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SymptomCheckerController extends GetxController{

  Rx<TextEditingController> ageC=TextEditingController().obs;
  Rx<TextEditingController> heightC=TextEditingController().obs;
  Rx<TextEditingController> fitC=TextEditingController().obs;
  Rx<TextEditingController> inchC=TextEditingController().obs;
  Rx<TextEditingController> kgC=TextEditingController().obs;
  Rx<TextEditingController> lbsC=TextEditingController().obs;


  RxInt module=0.obs;
  int get getModule => module.value;
  set updateModule(int value){
    module.value=value;
    update();
  }
  double bmi=0.0;
  metricFormula(context)async{

     bmi=(int.parse(kgC.value.text)/(int.parse(heightC.value.text)/100.0*int.parse(heightC.value.text)/100.0));
     print(bmi.toStringAsFixed(2));
     update();
  }

//  double imperial=0.0;
  imperialFormula(context)async{
    
    var heightFeet=int.parse(fitC.value.text).toDouble();
    var heightInch=int.parse(inchC.value.text).toDouble();
    var weightlbs=int.parse(lbsC.value.text).toDouble();

    var inches=(heightFeet*12.toInt())+heightInch.toInt();

    bmi=((weightlbs/(inches*inches))*703).toDouble();
    print(bmi.toDouble());
    update();


  }




  List abc=[
    {
      'id':1,
      "name":'Year'
    },
    {
      'id':2,
      "name":'Month'
    },
    {
      'id':3,
      "name":'Day'
    },
    {
      'id':4,
      "name":'Week'
    },
  ];


  RxString selectedId =''.obs;
  String get getSelectedId=>selectedId.value;
  set updateSelectedId(String val){
    selectedId.value=val;
    update();
  }

  List bodyOrganRegion=[].obs;
  List get getBodyOrganRegionList =>bodyOrganRegion;
  set updateBodyOrganRegionList(List val){
    bodyOrganRegion=val;
    update();
  }


  List allSymptomsList=[].obs;
  List get getAllSymptomsList =>allSymptomsList;
  set updateAllSymptomsList(List val){
    allSymptomsList=val;
    update();
  }


  RxString selectSymptomId =''.obs;
  String get getSelectSymptomId=>selectSymptomId.value;
  set updateSelectSymptomId(String val){
    selectSymptomId.value=val;
    update();
  }


  String alpha ='A';
  set updateAlphabet(String val){
    alpha=val;
    update();
  }

  List onTapSymptomsId = [];


}