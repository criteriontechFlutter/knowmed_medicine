import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{
  Rx<TextEditingController> idC =  TextEditingController().obs;
  Rx<TextEditingController> passwordC =  TextEditingController().obs;


  final formKey = GlobalKey<FormState>().obs;
}