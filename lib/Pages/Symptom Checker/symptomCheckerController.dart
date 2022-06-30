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
  func(context)async{
     bmi=(double.parse(kgC.value.text)/(double.parse(heightC.value.text)*double.parse(heightC.value.text)))/10000;
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
}