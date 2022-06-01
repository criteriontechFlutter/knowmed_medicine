import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:knowmed/AppManager/Button.dart';
import 'package:knowmed/AppManager/MtTextTheme.dart';
import 'package:knowmed/AppManager/NewTextField.dart';
import 'package:knowmed/AppManager/appColors.dart';
import 'package:knowmed/AppManager/appUtils.dart';
import 'package:knowmed/AppManager/coloured_safe_area.dart';
import 'package:knowmed/Pages/Login/login_Modal.dart';

import '../Forgot Password/forgetView.dart';
import '../Registration/RegistrationPageView.dart';
import 'login_Controller.dart';

class LoginPageView extends StatefulWidget {
  const LoginPageView({Key? key}) : super(key: key);

  @override
  _LoginPageViewState createState() => _LoginPageViewState();
}

class _LoginPageViewState extends State<LoginPageView>{
  // TextEditingController _idC = new TextEditingController();
  // TextEditingController _passwordC = new TextEditingController();

  // onPressedLogin() async{
  //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
  //     return DashboardView();
  //   }));
  //
  // }
  onPressedRegistration() async{
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return const RegisterPageView();
    }));

  }
  LoginModal modal=LoginModal();

  @override
  Widget build(BuildContext context) {
    return ColoredSafeArea(
    child: Scaffold(
      backgroundColor: AppColor().white,
    body: GlowingOverscrollIndicator(
    color: AppColor().primaryColor,
    axisDirection: AxisDirection.down,
    child: ListView(
        children: [
          SizedBox(height: 30,),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Image(image: AssetImage('assets/logo.png'),
                    height: 100,
                    width: 300,
                    //fit: BoxFit.fill,
                  ),
                ]
            ),
          ),
          const SizedBox(height: 20,),
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Text('Good Morning !',
                  style: MyTextTheme().largeSCB.copyWith(
                    color: AppColor().orange
                  )
                ),
                Text('This day will be great.',
                  style: MyTextTheme().largeBCB.copyWith(
                      color: AppColor().grey
                  ),),
                const SizedBox(height: 10,),
                loginPart(),
              ],
            ),
          ),
        const SizedBox(height: 10,),
        Column(
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
            const SizedBox(height: 10,),
          ],
        ),

        ]
    )
     )
    )
    );
  }

  loginPart() {
    return GetBuilder(
      init:LoginController(),
      builder: (_) {
        return Form(
          key: modal.controller.formKey.value,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Container(
              // height: 270,
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
                borderRadius: const BorderRadius.only(
                  topLeft:Radius.circular(25),
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),

          ),
                    Container(
                      width: 80,
                      height: 30,
                      color: Colors.white,
                      margin: const EdgeInsets.only(left: 40,top: 20),
                      child: Column(
                        children: [
                          Text('Get Login',
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
                    children: [
                      NewTextField(
                        controller: modal.controller.idC.value,
                        prefixIcon: const Icon(Icons.person,
                          size: 20,
                          color: Colors.grey,),
                        hintText: 'Enter your User ID.',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'UserId cannot be empty';
                          }
                        },

                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: NewTextField(
                                prefixIcon:Icon(Icons.lock_open,
                                  size: 20,
                                  color: AppColor().grey,),                                            controller: modal.controller.passwordC.value,
                                isPasswordField: true,
                                hintText: 'Enter your password.',
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Password cannot be empty';
                                  }
                                },
                              ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Row(
                          children: [
                            Expanded(child: Container()),
                            InkWell(
                              onTap: () {
                                ForgetView(context);
                              },
                              child: Text('forgot password?',
                                style: MyTextTheme().mediumWCB.copyWith(
                                    color: AppColor().blue
                                ),),
                            ),
                          ],
                        ),
                      ),
                      Container(
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
                                              AppColor().orange,
                                              AppColor().orange
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
                                              title: 'Login',
                                              onPress: ()async{
                                               await modal.onPressedLogin(context);
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
                                              title: 'Register',
                                              onPress: onPressedRegistration,
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
    );
  }
}