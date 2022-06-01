import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:knowmed/AppManager/Button.dart';
import 'package:knowmed/AppManager/MtTextTheme.dart';
import 'package:knowmed/AppManager/MyTextFieldBox.dart';
import 'package:knowmed/AppManager/appColors.dart';

import '../../../../AppManager/coloured_safe_area.dart';

class DoseCalculatorPageView extends StatefulWidget {
  const DoseCalculatorPageView({Key? key}) : super(key: key);

  @override
  _DoseCalculatorPageViewState createState() => _DoseCalculatorPageViewState();
}

class _DoseCalculatorPageViewState extends State<DoseCalculatorPageView>{
  TextEditingController _idC = new TextEditingController();
  TextEditingController _passwordC = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor().grey_dark,
        child: ColoredSafeArea(
        child: Scaffold(
          backgroundColor: AppColor().white,
            appBar: AppBar(
              title: Text('Dose Calculator',
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
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    doseCalculatorPart(),
                  ],
                ),
              ),
            ]
        )
         )
        )
        )
    );
  }
}
doseCalculatorPart(){
  return Form(
    autovalidateMode: AutovalidateMode.onUserInteraction,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Medicine Name',
          style: MyTextTheme().mediumPCB,),
        SizedBox(height: 10,),
        MyTextFieldBox(
          //hintText: 'Enter Medicine Name',
          validator: (value){
            if(value!.length==0)
            {
              return 'Field must not be empty.';
            }
            else{
              return null;
            }
          },
        ),
        SizedBox(height: 15,),
        Text('Symptoms',
          style: MyTextTheme().mediumPCB,),
        SizedBox(height: 10,),
        MyTextFieldBox(
         // hintText: 'Enter Symptoms.',
          validator: (value){
            if(value!.length==0)
            {
              return 'Field must not be empty.';
            }
            else{
              return null;
            }
          },
        ),
        SizedBox(height: 15,),
        Text('Age',
          style: MyTextTheme().mediumPCB,),
        SizedBox(height: 10,),
        MyTextFieldBox(
         // hintText: 'Enter Age.',
          validator: (value){
            if(value!.length==0)
            {
              return 'Field must not be empty.';
            }
            else{
              return null;
            }
          },
        ),
        SizedBox(height: 15,),
        Text('Weight(kg)',
          style: MyTextTheme().mediumPCB,),
        SizedBox(height: 10,),
        MyTextFieldBox(
         // hintText: 'Enter Weight.',
          validator: (value){
            if(value!.length==0)
            {
              return 'Field must not be empty.';
            }
            else{
              return null;
            }
          },
        ),
        SizedBox(height: 60,),
        Container(
          height: 40,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              AppColor().orange,
              AppColor().orange
            ],
                begin: Alignment.bottomLeft,
                end: Alignment.centerRight
            ),
            borderRadius: BorderRadius.only(
              topLeft:Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          child: Center(
            child: MyButton(
              color: AppColor().white,
              title: 'Calculate',
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyButton(
              width: 200,
              color: AppColor().darkOrange,
              title: 'Calculate',
            ),
          ],
        ),
        SizedBox(height: 20,),
      ],
    ),
  );
}