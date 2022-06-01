import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ResetController extends GetxController{

   Rx<TextEditingController> otpC = new TextEditingController().obs;
   Rx<TextEditingController> newPassC = new TextEditingController().obs;
   Rx<TextEditingController> confirmPassC = new TextEditingController().obs;
   String mobileNum = '';

}