import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:knowmed/AppManager/MtTextTheme.dart';
import 'package:knowmed/AppManager/NewTextField.dart';
import 'package:knowmed/AppManager/appColors.dart';
import 'package:knowmed/Pages/Profile/profileModal.dart';

import '../../AppManager/Button.dart';
import '../../AppManager/coloured_safe_area.dart';

class ProfilePageViewNew extends StatefulWidget {
  const ProfilePageViewNew({Key? key}) : super(key: key);

  @override
  _ProfilePageViewState createState() => _ProfilePageViewState();
}

class _ProfilePageViewState extends State<ProfilePageViewNew>{

  ProfileModal modal=ProfileModal();

  @override
  void initState(){
    super.initState();
    get();
  }

  get() async{
    await modal.profileData(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor().grey_dark,
        child: ColoredSafeArea(
        child: Scaffold(
          backgroundColor: AppColor().white,
            appBar: AppBar(
              title: Text('Profile',
                  style: MyTextTheme().largeSCB.copyWith(
                      color: AppColor().text_blue
                  )
              ),
              backgroundColor: AppColor().grey_header,
            ),
        body: GlowingOverscrollIndicator(
        color: AppColor().primaryColor,
        axisDirection: AxisDirection.down,
        child: ListView(
            children: [
              const Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 50,left: 0,right: 0),
                  child: Image(image: AssetImage('assets/profile.png'),
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
      //key: modal.controller.formKey.value,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Stack(
          children: [
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
                            controller:modal.controller.nameC.value,
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
                                                              title: 'Update',
                                                              onPress: ()async {
                                                                print('pressed');
                                                                await modal.onUpdateProfile(context);
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
                width: 70,
                height: 30,
                color: Colors.white,
                margin: const EdgeInsets.only(left: 40,top: 20),
                child: Column(
                  children: [
                    Text('Profile',
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
    );
  }
}