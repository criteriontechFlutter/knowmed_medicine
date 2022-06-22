import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class FeedbackController extends GetxController{
  Rx<TextEditingController>remarksC=TextEditingController().obs;


  RxInt module=0.obs;
  int get getModule => module.value;
  set updateModule(int value){
    module.value=value;
    update();
  }

  RxString cache=''.obs;
  String? get getCache => cache.value;
  set updateCache(String value){
    cache.value = value;
    update();
  }

  List feedbackModuleList=[].obs;
      List get getFeedbackModuleList=>feedbackModuleList;
  set updateFeedbackModuleList(List val){
    feedbackModuleList=val;
    update();
  }




}