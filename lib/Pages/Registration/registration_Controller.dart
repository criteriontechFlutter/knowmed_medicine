import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RegistrationController extends GetxController{

  final formKey = GlobalKey<FormState>().obs;

  Rx<TextEditingController> nameC =  TextEditingController().obs;
  Rx<TextEditingController> emailC =  TextEditingController().obs;
  Rx<TextEditingController> mobileC =  TextEditingController().obs;

  Rx<TextEditingController> otpController = TextEditingController().obs;

  RxBool timer=false.obs;
  bool get getTime=>timer.value;
  set updateTime(bool val){
    timer.value=val;
    update();
  }

}
