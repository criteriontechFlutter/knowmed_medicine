import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:knowmed/AppManager/Button.dart';
import 'package:knowmed/AppManager/MtTextTheme.dart';
import 'package:knowmed/AppManager/NewTextField.dart';
import 'package:knowmed/AppManager/appColors.dart';
import 'package:knowmed/AppManager/my_text_field_2.dart';
import 'package:knowmed/Pages/Dashboard/DashboardOption/ClinicalCalculator/CalculatorDetails/detailsModal.dart';

import '../../../../../AppManager/coloured_safe_area.dart';

class CalculatorDetails extends StatefulWidget {
  const CalculatorDetails({Key? key}) : super(key: key);

  @override
  State<CalculatorDetails> createState() => _CalculatorDetailsState();
}

class _CalculatorDetailsState extends State<CalculatorDetails> {

  DetailsModal modal=DetailsModal();

  @override
  get() async{
    await modal.onCalculate(context);
  }

  @override
  void initState(){
    get();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ColoredSafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
              child: Icon(Icons.arrow_back,color: AppColor().grey,)),
          title: Text('Clinical Calculator',
              style: MyTextTheme()
                  .largeWCB.copyWith(color: Colors.indigo.shade900)),
          backgroundColor: AppColor().grey_header,
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Faheem',style: MyTextTheme().largeWCB.copyWith(color: Colors.indigo.shade900),),
              SizedBox(height: 3,),
              Text('Calculate your details',style: MyTextTheme().smallBCN.copyWith(color: AppColor().greyDark),),
          SizedBox(height: 10,),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: AppColor().greyLight),
                borderRadius: BorderRadius.circular(5),
              ),
              child: ListView.builder(
                itemCount: 5,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context,int index){
                return Padding(
                  padding: const EdgeInsets.fromLTRB(15,8,8,8,),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: Text('p Atm  ',style: MyTextTheme().smallBCN,)),
                      Container(
                        width: 150,
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColor().greyLight),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: MyTextField2(
                          hintText: 'p Atm',
                        ),
                      ),
                      const Expanded(child: SizedBox())
                    ],
                  ),
                );
              })
            ),
          ),
              SizedBox(height: 10,),
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
                  borderRadius: const BorderRadius.only(
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
                    onPress: ()async{
                      //await modal.onSubmitFeedback(context);
                    },

                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
