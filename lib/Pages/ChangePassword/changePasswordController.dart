import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class changePassController extends GetxController{


   Rx<TextEditingController> oldPassC = new TextEditingController().obs;
   Rx<TextEditingController> newPassC = new TextEditingController().obs;

}