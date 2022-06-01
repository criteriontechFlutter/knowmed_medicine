


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:knowmed/AppManager/Button.dart';
import 'package:knowmed/AppManager/MtTextTheme.dart';
import 'package:knowmed/AppManager/appColors.dart';
import 'package:knowmed/AppManager/appUtils.dart';
import 'package:knowmed/Pages/Registration/registration_Controller.dart';

import '../../AppManager/NewTextField.dart';
import 'forgetModal.dart';


ForgetView(BuildContext context) {

  ForgetModal modal=ForgetModal();


  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
          builder: (context, snapshot) {
            return AlertDialog(
              // contentPadding: EdgeInsets.zero,
              // actionsPadding: EdgeInsets.zero,
              // buttonPadding: EdgeInsets.zero,
              // insetPadding: EdgeInsets.zero,
              titlePadding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
              ),

              backgroundColor: AppColor().white,
              title:GetBuilder(
                  init: RegistrationController(),
                  builder: (_) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Genrate Otp',style: MyTextTheme().mediumBCB,),
                              InkWell(
                                onTap: (){
                                  Navigator.pop(context);
                                },
                                  child: Icon((Icons.close),color: AppColor().black,size: 25,)),
                            ],
                          ),
                        ),
                        const Divider(
                          color: Colors.grey,
                          thickness: 1,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                           // height: 200,
                            width: 250,
                            decoration: BoxDecoration(
                                border: Border.all(width: 1, color: Colors.grey),
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.white
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child:NewTextField(
                                    controller: modal.controller.mobileC.value,
                                    hintText: 'Mobile No.',
                                    prefixIcon:  const Icon(Icons.phone_android,
                                      size: 20,
                                      color: Colors.grey,),
                                    maxLength: 10,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                                    ],
                                    keyboardType: TextInputType.phone,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please Enter Your number';
                                      } else if (value.length < 10) {
                                        return 'Number cannot be less than 10 digits';
                                      }
                                    },
                                    onChanged: (val) {

                                    },
                                  ),
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(8,8,1,8),
                                        child: Container(
                                          height: 40,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(colors: [
                                              AppColor().grey,
                                              AppColor().grey
                                            ],
                                                begin: Alignment.bottomLeft,
                                                end: Alignment.centerRight
                                            ),
                                            borderRadius: const BorderRadius.only(
                                              topLeft:Radius.circular(5),
                                              bottomLeft: Radius.circular(10),
                                              bottomRight: Radius.circular(0),
                                              topRight: Radius.circular(0),
                                            ),
                                          ),
                                          child: Center(
                                            child: MyButton(
                                              color: AppColor().white,
                                              title: 'Cancel',
                                              onPress: (){
                                                Navigator.pop(context);
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(1,8,8,8,),
                                        child: Container(
                                          height: 40,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(colors: [
                                              AppColor().blue,
                                              AppColor().blue
                                            ],
                                                begin: Alignment.bottomLeft,
                                                end: Alignment.centerRight
                                            ),
                                            borderRadius: const BorderRadius.only(
                                              topLeft:Radius.circular(0),
                                              bottomLeft: Radius.circular(0),
                                              bottomRight: Radius.circular(10),
                                              topRight: Radius.circular(5),
                                            ),
                                          ),
                                          child: Center(
                                            child: MyButton(
                                              color: AppColor().white,
                                              title: 'Get Otp',
                                             onPress: ()async{
                                              await modal.onForget(context);
                                                print('pressed');

                                             },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),

                      ],

                    );
                  }
              ),
              // content: Text("This is my message."),

            );
          }
      );
    },
  );
}

