


import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:knowmed/AppManager/MtTextTheme.dart';
import 'package:knowmed/AppManager/appColors.dart';
import 'package:knowmed/Pages/Registration/registration_Controller.dart';
import 'package:knowmed/Pages/Registration/registration_Modal.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:slide_countdown/slide_countdown.dart';

showOTPModule(BuildContext context) {

  RegistrationModal modal=RegistrationModal();

  // show the dialog
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
          builder: (context, snapshot) {
            return AlertDialog(
              titlePadding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
              ),

              backgroundColor: AppColor().blue,
              title:GetBuilder(
                  init: RegistrationController(),
                  builder: (_) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                  onTap: (){
                                    modal.controller.otpController.value.clear();
                                    Navigator.pop(context);
                                  },
                                  child: Icon((Icons.close),color: AppColor().white,size: 25,)),
                            ),
                          ],
                        ),
                        Text('Otp Varification',style: MyTextTheme().mediumWCB,),
                        SizedBox(height: 20,),
                        Text('Please enter OTP sent to your mobile number:',style: MyTextTheme().smallWCN,),
                        SizedBox(height: 30,),

                        Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 30),
                            child: PinCodeTextField(
                              appContext: context,
                              controller: modal.controller.otpController.value,
                              pastedTextStyle:MyTextTheme().smallBCB,
                              length: 4,
                              autoDisposeControllers: false,
                              obscureText: true,
                              obscuringCharacter: '*',
                              blinkWhenObscuring: true,
                              animationType: AnimationType.fade,
                              validator: (v) {
                                if (v!.length < 4) {
                                  return "OTP must be filled completely.";
                                }
                                else {
                                  return null;
                                }
                              },
                              pinTheme: PinTheme(
                                activeColor: AppColor().primaryColor,
                                activeFillColor:AppColor().blue_light,
                                shape: PinCodeFieldShape.box,
                                inactiveFillColor: AppColor().blue_light,
                                inactiveColor:  AppColor().blue_light,
                                borderRadius: BorderRadius.circular(5),
                                fieldHeight: 40,
                                fieldWidth: 40,
                              ),
                              cursorColor: Colors.black,
                              animationDuration: const Duration(milliseconds: 300),
                              enableActiveFill: true,

                              keyboardType: TextInputType.number,
                              // boxShadows: const [
                              //   BoxShadow(
                              //     offset: Offset(0, 1),
                              //     // color: Colors.black12,
                              //     blurRadius: 10,
                              //   )
                              // ],
                              onCompleted: (v) {
                                print("Completed");
                              },
                              // onTap: () {
                              //   print("Pressed");
                              // },
                              onChanged: (value) {

                              },
                              beforeTextPaste: (text) {
                                print("Allowing to paste $text");
                                //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                                //but you can show anything you want here, like your pop up saying wrong paste format or etc
                                return true;
                              },
                            )),
                        modal.controller.getTime?
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                                "Didn't get the OTP? ",
                                style: MyTextTheme().smallBCB
                            ),
                            TextButton(
                              onPressed: (){
                                modal.controller.updateTime=false
                                ;
                                modal.userRegistration(context,1);
                              },
                              child: Text(
                                "RESEND OTP",
                                style: MyTextTheme().smallBCB,

                              ),
                            )
                          ],
                        ):countDown(modal),
                        const SizedBox(height: 15,),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            InkWell(
                              onTap: ()async {
                                print('Pressed');
                                await modal.userVarification(context);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: AppColor().white,
                                  borderRadius: const BorderRadius.only(
                                    topLeft:Radius.circular(0),
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                    topRight: Radius.circular(0),
                                  ),
                                ),

                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(18.0),
                                      child: Text('Verify OTP',style: MyTextTheme().mediumWCN.copyWith(color: Colors.green),),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
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


countDown(modal){
  return  GetBuilder(
      init: RegistrationController(),
      builder: (_) {
        return SlideCountdown(


            onDone: () => {
              modal.controller.updateTime=true
            },
            duration:  const Duration(seconds: 60,),
            fade: false,
            decoration: BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.circular(5)
            ),
            textStyle: MyTextTheme().mediumBCN.copyWith(
                color: Colors.grey[600]
            )
        );
      }
  );
}
