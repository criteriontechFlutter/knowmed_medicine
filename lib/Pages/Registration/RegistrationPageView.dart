import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:knowmed/AppManager/MtTextTheme.dart';
import 'package:knowmed/AppManager/NewTextField.dart';
import 'package:knowmed/AppManager/appColors.dart';
import 'package:knowmed/AppManager/appUtils.dart';
import 'package:knowmed/AppManager/web_view.dart';
import 'package:knowmed/Pages/Registration/registration_Controller.dart';
import 'package:knowmed/Pages/Registration/registration_Modal.dart';

import '../../AppManager/AlertDialogueNew.dart';
import '../../AppManager/Button.dart';
import '../../AppManager/coloured_safe_area.dart';

class RegisterPageView extends StatefulWidget {
  const RegisterPageView({Key? key}) : super(key: key);

  @override
  _RegisterPageViewState createState() => _RegisterPageViewState();
}

class _RegisterPageViewState extends State<RegisterPageView>{


  bool timer = false;
  RegistrationModal modal=RegistrationModal();

  @override
  get() async{

  }

  @override
  void initState(){
    get();
    super.initState();

  }

  @override
  void dispose() {
    Get.delete<RegistrationController>();
    super.dispose();

  }


  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor().grey_dark,
        child: ColoredSafeArea(
        child: GetBuilder(
          init: RegistrationController(),
          builder: (_) {
            return Scaffold(
              backgroundColor: AppColor().white,
            body: GlowingOverscrollIndicator(
            color: AppColor().primaryColor,
            axisDirection: AxisDirection.down,
            child: ListView(
                children: [
                  const SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Image(image: AssetImage('assets/logo.png'),
                          height: 100,
                          width: 300,
                          //fit: BoxFit.fill,
                        ),
                      ]
                  ),
                  SizedBox(height: 30,),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        registerPart(),
                      ],
                    ),
                  ),
                SizedBox(height: 30,),
                Container(
                  child: Column(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
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
                )
                ]
            )
             )
            );
          }
        )
        )
    );
  }

  registerPart() {
    return Form(
      key: modal.controller.formKey.value,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Container(
        // width: MediaQuery.of(context).size.width,
          child: Stack(
              children: [
          // Container(
          // width: MediaQuery.of(context).size.width,
          // margin: const EdgeInsets.only(top: 30),
          // //height: 270,
          // decoration: BoxDecoration(
          //   color: AppColor().white,
          //   border:
          //   Border.all(
          //       color: AppColor().greyLight
          //   ),
          //   borderRadius: const BorderRadius.only(
          //     topLeft:Radius.circular(25),
          //     bottomLeft: Radius.circular(25),
          //     bottomRight: Radius.circular(25),
          //     topRight: Radius.circular(25),
          //   ),
          // ),
          //
          // ),

                Container(
                    margin: const EdgeInsets.only(top: 60,left: 10,right: 10),
                    decoration: BoxDecoration(
                        color: AppColor().white,
                        border:
                        Border.all(
                            color: AppColor().greyLight
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft:Radius.circular(25),
                          bottomLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25),
                          topRight: Radius.circular(25),
                        ),
                      ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12,20,12,12),
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: NewTextField(
                        controller: modal.controller.nameC.value,
                        hintText: 'Full Name',
                        prefixIcon: const Icon(Icons.person,
                          size: 20,
                          color: Colors.grey,),
                        validator:(value) {
                      if (value!.isEmpty) {
                      return 'Name cannot be empty';
                      }
                      },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: NewTextField(
                        controller: modal.controller.emailC.value,
                        hintText: 'Email id',
                        prefixIcon: const Icon(Icons.alternate_email,
                          size: 20,
                          color: Colors.grey,),
                        validator: (value) {
                          if(value!.isEmpty){
                            return 'Email can not be empty';
                          }
                      if (value.isEmail) {
                      return null;
                      }
                      else{
                        return 'Please enter valid email';
                      }
                      },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: NewTextField(
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
                        GestureDetector(
                          onTap: ()   {

                            if(modal.controller.getIsReadTerms==true){
                              modal.controller
                                  .updateCheckBoxValue =
                                  modal.controller
                                      .getCheckBoxValue;
                            }
                            else
                            {
                              alertToast(context, 'Please First Read Terms and Conditions ');
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0,5,8,5,),
                            child: SizedBox(
                              child:
                              modal.controller.getCheckBoxValue?
                              Icon(Icons.check_box,color: AppColor().blue,)
                                  :Icon(Icons.check_box_outline_blank),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              'I have read and agree to the',
                              style: MyTextTheme().smallBCB,
                            ),
                            InkWell(
                              onTap: (){
                                modal.controller.updateIsReadTerms=true;
                                App().navigate(context,  const WebViewPage(title: 'Terms and Conditions',url: 'https://digidoctor.in/Home/TermsCondition#:~:text=The%20DigiDoctor%20App%20assumes%20no,on%20duty%20on%20OPD%20days.',));

                              },
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(3,5,5,5),
                                child: Text(
                                  'Term & Condition',
                                  style: MyTextTheme().smallPCB,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),

                    Column(
                        children: [
                          Row(
                              children: [

                                Expanded(
                                  child: Container(
                                      margin: const EdgeInsets.fromLTRB(18,20,18,0),
                                      child: Column(
                                          children: [
                                            Row(
                                                children: [
                                                  Expanded(
                                                    child: Container(
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
                                                        child: MyButton(
                                                          color: AppColor().white,
                                                          title: 'Cancel',
                                                          onPress: ()async{
                                                            Navigator.pop(context);
                                                            //await modal.onPressedLogin(context);
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 3,),
                                                  Expanded(
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
                                                          title: 'Submit',
                                                          onPress: ()async {
                                                            print('pressed');
                                                              if(modal.controller.nameC.value.text.toString() == '' ||
                                                                  modal.controller.emailC.value.text.toString()== '' ||
                                                                  modal.controller.mobileC.value.text.toString() == ''){
                                                                alertToast(context, "Please Enter Your Details");
                                                              }

                                                            else{

                                                              await modal.userRegistration(context,0);

                                                            }
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ),

                                                ]
                                            )
                                          ]
                                      )
                                  ),
                                )



                              ]
                    )
                    ]
                    )
                  ]
                  ),
                )
                ),
                Positioned(
                  top: 30,
                  child: Container(
                    width: 150,
                    height: 30,
                    color: Colors.white,
                    margin: const EdgeInsets.only(left: 40,top: 20),
                    child: Column(
                      children: [
                        Text('Registration Details',
                          style: MyTextTheme().mediumWCB.copyWith(
                              color: AppColor().primaryColor
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        ]
      ),
      ),
    );
  }





}