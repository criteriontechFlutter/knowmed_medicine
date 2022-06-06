import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:knowmed/AppManager/MtTextTheme.dart';
import 'package:knowmed/AppManager/NewTextField.dart';
import 'package:knowmed/AppManager/appColors.dart';

class ChangePasswordPageView extends StatefulWidget {
  const ChangePasswordPageView({Key? key}) : super(key: key);

  @override
  _ChangePasswordPageViewState createState() => _ChangePasswordPageViewState();
}

class _ChangePasswordPageViewState extends State<ChangePasswordPageView>{
  TextEditingController _idC = new TextEditingController();
  TextEditingController _passwordC = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor().grey_dark,
        child: SafeArea(
        child: Container(
        child: Scaffold(
            appBar: AppBar(
              title: Text('Change Password',
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
                child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 50,left: 20,right: 20),
                        child: Image(image: AssetImage('assets/logo.png'),
                          height: 100,
                          width: 300,
                          //fit: BoxFit.fill,
                        ),
                      ),
                    ]
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
        )
    );
  }

  registerPart() {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Container(
          height: 270,
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
                      Text('Change Password',
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
                    borderRadius: BorderRadius.only(
                      topLeft:Radius.circular(10),
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                      topRight: Radius.circular(10),
                    ),
                  ),
                    child:NewTextField(
                      controller: _idC,
                      hintText: 'Old Password',
                      prefixIcon: Icon(Icons.lock,
                        size: 20,
                        color: Colors.grey,),
                    )

                ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: NewTextField(
                      hintText: 'New Password',
                      prefixIcon: Icon(Icons.lock,
                        size: 20,
                        color: Colors.grey,),

                    ),
                  ),
                  StreamBuilder<Object>(
                    stream: null,
                    builder: (context, snapshot) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: NewTextField(
                          hintText: 'Confirm Password',
                          prefixIcon: Icon(Icons.lock_outline_sharp,
                            size: 20,
                            color: Colors.grey,),
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
                                      borderRadius: BorderRadius.only(
                                        topLeft:Radius.circular(10),
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
                                  Container(
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
                                      borderRadius: BorderRadius.only(
                                        topLeft:Radius.circular(0),
                                        bottomLeft: Radius.circular(0),
                                        bottomRight: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                      ),
                                    ),
                                    child: Center(
                                      child: Container(
                                          child: Text(
                                            'Update',
                                            textAlign: TextAlign.center,
                                            style: MyTextTheme().mediumWCB.copyWith(
                                                color: AppColor().white
                                            ),
                                          )
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