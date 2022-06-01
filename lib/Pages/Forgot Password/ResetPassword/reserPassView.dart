import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:knowmed/AppManager/MtTextTheme.dart';
import 'package:knowmed/AppManager/NewTextField.dart';
import 'package:knowmed/AppManager/appColors.dart';
import 'package:knowmed/Pages/Forgot%20Password/ResetPassword/resetController.dart';
import 'package:knowmed/Pages/Forgot%20Password/ResetPassword/resetModal.dart';
import 'package:get/get.dart';

import '../../../AppManager/coloured_safe_area.dart';

class ResetPassword extends StatefulWidget {
  final String mobileNumber;
  const ResetPassword({Key? key, required this.mobileNumber}) : super(key: key);

  @override
  _ResetPasswordViewState createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPassword>{

  ResetModal modal=ResetModal();
@override
  void initState() {
    modal.controller.mobileNum = widget.mobileNumber.toString();
    print("**********"+modal.controller.mobileNum.toString());
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<ResetController>();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor().grey_dark,
        child: ColoredSafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text('Reset Password',
                  style: MyTextTheme().largeSCB.copyWith(
                      color: AppColor().text_blue
                  )
              ),
              backgroundColor: AppColor().grey_header,
            ),
          backgroundColor: AppColor().white,
        body: GlowingOverscrollIndicator(
        color: AppColor().primaryColor,
        axisDirection: AxisDirection.down,
        child: ListView(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 50,left: 20,right: 20),
                  child: Image(image: AssetImage('assets/logo.png'),
                    height: 100,
                    width: 300,
                    //fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(height: 50,),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    registerPart(),
                  ],
                ),
              ),
            SizedBox(height: 100,),
            Container(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('We Provide',
                        style: MyTextTheme().largeBCB.copyWith(
                            color: AppColor().orange
                        ),),
                      Text('Health & Medical',
                        style: MyTextTheme().largeBCB.copyWith(
                            color: AppColor().text_blue
                        ),),
                      Text('Services for you',
                        style: MyTextTheme().largeBCB.copyWith(
                            color: AppColor().orange
                        ),),
                    ],
                  ),
                ),
            )
            ]
        )
         )
        )
        )
    );
  }

  registerPart() {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Container(
          //height: 270,
          width: MediaQuery.of(context).size.width,
          child: Stack(
              children: [
          Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.only(top: 30),
          height: 270,
          decoration: BoxDecoration(
            color: AppColor().white,
            border:
            Border.all(
                color: AppColor().greyLight
            ),
            borderRadius: BorderRadius.only(
              topLeft:Radius.circular(25),
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),

          ),
                Container(
                  width: 150,
                  height: 30,
                  color: Colors.white,
                  margin: const EdgeInsets.only(left: 40,top: 20),
                  child: Column(
                    children: [
                      Text('Reset Password',
                        style: MyTextTheme().mediumWCB.copyWith(
                            color: AppColor().primaryColor
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                    margin: const EdgeInsets.only(top: 60,left: 10,right: 10),
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Container(
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      AppColor().grey_box,
                      AppColor().grey_box
                    ],
                        begin: Alignment.bottomLeft,
                        end: Alignment.centerRight
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft:Radius.circular(10),
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                      topRight: Radius.circular(10),
                    ),
                  ),
                    child:NewTextField(
                      //controller: _idC,
                      hintText: 'Please enter OTP',
                      prefixIcon: const Icon(Icons.phone_android,
                        size: 20,
                        color: Colors.grey,),
                      controller: modal.controller.otpC.value,
                    )

                ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: NewTextField(
                      prefixIcon:Icon(Icons.lock_open,
                        size: 20,
                        color: AppColor().grey,),
                      controller: modal.controller.newPassC.value,
                      isPasswordField: true,
                      hintText: 'Please Enter New password.',
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Password cannot be empty';
                        }
                      },
                    ),
                  ),
                  StreamBuilder<Object>(
                    stream: null,
                    builder: (context, snapshot) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: NewTextField(
                          prefixIcon:Icon(Icons.lock_open,
                            size: 20,
                            color: AppColor().grey,),
                          controller: modal.controller.confirmPassC.value,
                          isPasswordField: true,
                          hintText: 'Please Enter Confirm password.',
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Password cannot be empty';
                            }
                          },
                        ),
                      );
                    }
                  ),

                  Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: Column(
                          children: [
                            Row(
                                children: [
                                  Container(
                                    width: 145,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(colors: [
                                        AppColor().greyLight,
                                        AppColor().greyLight
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
                                      child: Container(
                                         child: Text(
                                            'Cancel',
                                            textAlign: TextAlign.center,
                                            style: MyTextTheme().mediumWCB.copyWith(
                                               color: AppColor().white
                                           ),
                                          )
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 5,),
                                  InkWell(
                                    onTap: ()async{
                                     await modal.onUpdatePassWord(context);
                                    },
                                    child: Container(
                                      width: 145,
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
                                        child: Text(
                                          'Update',
                                          textAlign: TextAlign.center,
                                          style: MyTextTheme().mediumWCB.copyWith(
                                              color: AppColor().white
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ]
                      )
                  ]
                      )
                  )
                ]
                )
                ),
        ]
      ),
      ),
    );
  }
}