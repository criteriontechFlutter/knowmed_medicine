
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:knowmed/AppManager/Button.dart';
import 'package:knowmed/AppManager/MtTextTheme.dart';
import 'package:knowmed/AppManager/appColors.dart';
import 'package:knowmed/AppManager/appUtils.dart';
import 'package:knowmed/Pages/Dashboard/DashboardOption/DiseaseAndCondition/disease_and_condition_page_view.dart';
import 'package:knowmed/Pages/Dashboard/DashboardOption/DoseCalculator/dose_calculator_page_view.dart';
import 'package:knowmed/Pages/Dashboard/DashboardOption/FoodAndHerbs/food_and_herb_page_view.dart';
import 'package:knowmed/Pages/Dashboard/DashboardOption/InteractionChecker/interaction_checker_page_view.dart';
import 'package:knowmed/Pages/Dashboard/DashboardOption/MedicalTerminology/medical_term_page_view.dart';
import 'package:knowmed/Pages/Dashboard/DashboardOption/NutrientAndCompounds/nutrient_and_compound_page_view.dart';
import 'package:knowmed/Pages/DiseaseAndCondition/disease_and_condition_page_view.dart';
import 'package:knowmed/Widgets/NavigationDrawerWidget.dart';
import 'package:lottie/lottie.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../AppManager/coloured_safe_area.dart';
import 'DashboardOption/ClinicalCalculator/clinicalCalculatorView.dart';
import 'DashboardOption/Feedback/feedbackView.dart';
import 'DashboardOption/Medicines/medicines_page_view.dart';





class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  _DashboardViewState createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView>{




  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get();
  }


  get() async{
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      showModalBottomSheet(
          enableDrag: false,
          isDismissible: false,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              )
          ),
          context: context,
          builder: (context)=>buildSheet(context)
      );
    });
  }

  @override
  Widget build(BuildContext context) => ColoredSafeArea(
    child: Scaffold(
      drawer: NavigationDrawerWidget(),
      //drawer: ComplexDrawerPage(),
      appBar: AppBar(
        title: Text('KnowMed',
            style: MyTextTheme().largeSCB.copyWith(
                color: AppColor().text_blue
            )
        ),
        backgroundColor: AppColor().grey_header,
      ),
      body:

      SlidingUpPanel(
        maxHeight: 250,
        minHeight: 80,
        parallaxEnabled: true,
        parallaxOffset: .5,
        body:     Container(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Column(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                              height: 300,
                              child: Lottie.asset('assets/animated_gif.json'))
                        ],
                      ),
                      const SizedBox(height: 20,),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Use our',
                              style: MyTextTheme().smallBCN.copyWith(
                                  color: AppColor().black
                              ),),
                            const SizedBox(width: 2,),
                            Text('Symptom Checker Tools',
                              style: MyTextTheme().smallBCB.copyWith(
                                  color: AppColor().black
                              ),),
                            const SizedBox(width: 2,),
                            Text('&',
                              style: MyTextTheme().smallBCN.copyWith(
                                  color: AppColor().black
                              ),),
                          ]
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('see, what could be causing your symptoms.',
                              style: MyTextTheme().smallBCN.copyWith(
                                  color: AppColor().black
                              ),),
                          ]
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Then Know about',
                              style: MyTextTheme().smallBCN.copyWith(
                                  color: AppColor().black
                              ),),
                            const SizedBox(width: 2,),
                            Text('possible next steps',
                              style: MyTextTheme().smallBCB.copyWith(
                                  color: AppColor().black
                              ),),
                          ]
                      ),
                      const SizedBox(height: 20,),
                      Center(
                        child: Container(
                          width: 100,
                          height: 40,
                          decoration: BoxDecoration(
                              color: AppColor().red,
                              borderRadius: const BorderRadius.only(
                                topLeft:Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                              boxShadow: [
                                BoxShadow(
                                    offset: const Offset(5, 10),
                                    blurRadius: 20,
                                    color: Colors.grey.withOpacity(0.2)
                                )
                              ]
                          ),
                          child: Center(
                            child: MyButton(
                              color: AppColor().white,
                              title: 'Start',
                            ),
                          ),
                        ),
                      )
                    ]
                ),
              ),
            )
        ),
        panelBuilder: (sc) => buildSheet(context),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(18.0),
            topRight: Radius.circular(18.0)),
        onPanelSlide: (double pos) => setState(() {
          // _fabHeight = pos * (_panelHeightOpen - _panelHeightClosed) +
          //     _initFabHeight;
        }),
      ),


    ),
  );
}



  Widget buildSheet(BuildContext context)=> Container(

  decoration: BoxDecoration(
  color: Colors.white,
    border: Border(top: BorderSide(width: 3.0, color: AppColor().primaryColor)),
  ),
  padding: const EdgeInsets.all(8.0),
    child: Column(
      //mainAxisSize: MainAxisSize.min,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context)=> const DiseaseListPageView()));
                },
                child:  Container(
                  height: 60,
                  width: 70,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const ClipOval(
                            child: Image(image: AssetImage('assets/disease_details.png'),
                              fit:BoxFit.cover,
                              width: 30,
                              height: 30,
                            )
                        ),
                        Text('Disease &',
                          style: MyTextTheme().smallBCN.copyWith(
                              color: AppColor().black
                          ),),
                        Text('Condition',
                          style: MyTextTheme().smallBCN.copyWith(
                              color: AppColor().black
                          ),),
                      ],
                    ),
                  ),
                ),
              ),

              //Expanded(child: Container()),
              Container(height: 60, child: const VerticalDivider(color: Colors.grey)),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context)=> const MedicinesPageView()));
                },
                child: Container(
                  height: 60,
                  width: 70,
                  child: Center(
                    child: Column(
                      children: [
                        const ClipOval(
                            child: Image(image: AssetImage('assets/medicine.png'),
                              fit:BoxFit.cover,
                              width: 30,
                              height: 30,
                            )
                        ),
                        Text('Medicines',
                          style: MyTextTheme().smallBCN.copyWith(
                              color: AppColor().black
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              //Expanded(child: Container()),
              Container(height: 60, child: const VerticalDivider(color: Colors.grey)),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context)=> const FoodAndHerbPageView()));
                },
                child: Container(
                  height: 60,
                  width: 70,
                  child: Center(
                    child: SizedBox(
                      height: 60,
                      width: 70,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const ClipOval(
                                child: Image(image: AssetImage('assets/food_and_nutrition.png'),
                                  fit:BoxFit.cover,
                                  width: 30,
                                  height: 30,
                                )
                            ),
                            Text('Food &',
                              style: MyTextTheme().smallBCN.copyWith(
                                  color: AppColor().black
                              ),
                            ),
                            Text('Herbs',
                              style: MyTextTheme().smallBCN.copyWith(
                                  color: AppColor().black
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              //Expanded(child: Container()),
              Container(height: 60, child: const VerticalDivider(color: Colors.grey)),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context)=> const NutrientAndCompoundPageView()));
                },
                child: Container(
                  height: 60,
                  width: 70,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const ClipOval(
                            child: Image(image: AssetImage('assets/nutrient_details.png'),
                              fit:BoxFit.cover,
                              width: 30,
                              height: 30,
                            )
                        ),
                        Text('Nutrient &',
                          style: MyTextTheme().smallBCN.copyWith(
                              color: AppColor().black
                          ),
                        ),
                        Text('Compounds',
                          style: MyTextTheme().smallBCN.copyWith(
                              color: AppColor().black
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              //Expanded(child: Container()),
            ],
          ),
          const SizedBox(height: 2),
          const Divider(color: Colors.grey),
          const SizedBox(height: 2),
          Row(
            children: [
              Container(
                height: 60,
                width: 70,
                child: Center(
                  child: InkWell(
                    onTap: (){
                      Navigator.pop(context);
                      App().navigate(context, const InteractionCheckerPageView());
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const ClipOval(
                            child: Image(image: AssetImage('assets/interaction_checker.png'),
                              fit:BoxFit.cover,
                              width: 30,
                              height: 30,
                            )
                        ),
                        Text('Interaction',
                          style: MyTextTheme().smallBCN.copyWith(
                              color: AppColor().black
                          ),),
                        Text('Checker',
                          style: MyTextTheme().smallBCN.copyWith(
                              color: AppColor().black
                          ),),
                      ],
                    ),
                  ),

                ),
              ),
              //Expanded(child: Container()),
              Container(height: 60, child: const VerticalDivider(color: Colors.grey)),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context)=> const DoseCalculatorPageView()));
                },
                child: Container(
                  height: 60,
                  width: 70,
                  child: Center(
                    child: Column(
                      children: [
                        const ClipOval(
                            child: Image(image: AssetImage('assets/dose_calculator.png'),
                              fit:BoxFit.cover,
                              width: 30,
                              height: 30,
                            )
                        ),
                        Text('Dose',
                          style: MyTextTheme().smallBCN.copyWith(
                              color: AppColor().black
                          ),
                        ),
                        Text('Calculator',
                          style: MyTextTheme().smallBCN.copyWith(
                              color: AppColor().black
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              //Expanded(child: Container()),
              Container(height: 60, child: const VerticalDivider(color: Colors.grey)),
              Center(
                child: SizedBox(
                  height: 60,
                  width: 70,
                  child: Center(
                    child: InkWell(
                      onTap: (){
                        Navigator.pop(context);
                        App().navigate(context, const InteractionCheckerPageView());
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const ClipOval(
                              child: Image(image: AssetImage('assets/deficiency_checker.png'),
                                fit:BoxFit.cover,
                                width: 30,
                                height: 30,
                              )
                          ),
                          Text('Deficiency',
                            style: MyTextTheme().smallBCN.copyWith(
                                color: AppColor().black
                            ),
                          ),
                          Text('Checker',
                            style: MyTextTheme().smallBCN.copyWith(
                                color: AppColor().black
                            ),
                          )
                        ],
                      ),
                    ),

                  ),
                ),
              ),
              //Expanded(child: Container()),
              Container(height: 60, child: const VerticalDivider(color: Colors.grey)),
              Container(
                height: 60,
                width: 70,
                child: Center(
                  child: InkWell(
                    onTap: (){
                      Navigator.pop(context);
                      App().navigate(context, const ClinicalCalculator());
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const ClipOval(
                            child: Image(image: AssetImage('assets/clinical_calculat.png'),
                              fit:BoxFit.cover,
                              width: 30,
                              height: 30,
                            )
                        ),
                        Text('Clinical',
                          style: MyTextTheme().smallBCN.copyWith(
                              color: AppColor().black
                          ),
                        ),
                        Text('Calculator',
                          style: MyTextTheme().smallBCN.copyWith(
                              color: AppColor().black
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              //Expanded(child: Container()),
            ],
          ),
          const SizedBox(height: 2),
          const Divider(color: Colors.grey),
          const SizedBox(height: 2),
          Row(
            children: [
              Container(
                height: 60,
                width: 70,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const ClipOval(
                          child: Image(image: AssetImage('assets/diet_management.png'),
                            fit:BoxFit.cover,
                            width: 30,
                            height: 30,
                          )
                      ),
                      Text('Diet',
                        style: MyTextTheme().smallBCN.copyWith(
                            color: AppColor().black
                        ),),
                      Text('Management',
                        style: MyTextTheme().smallBCN.copyWith(
                            color: AppColor().black
                        ),),
                    ],
                  ),
                ),
              ),
              //Expanded(child: Container()),
              Container(height: 60, child: const VerticalDivider(color: Colors.grey)),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context)=> const MedicalTermPageView()));
                },
                child:  Container(
                  height: 60,
                  width: 70,
                  child: Center(
                    child: Column(
                      children: [
                        const ClipOval(
                            child: Image(image: AssetImage('assets/medical_terminology.png'),
                              fit:BoxFit.cover,
                              width: 30,
                              height: 30,
                            )
                        ),
                        Text('Medical',
                          style: MyTextTheme().smallBCN.copyWith(
                              color: AppColor().black
                          ),
                        ),
                        Text('Terminology',
                          style: MyTextTheme().smallBCN.copyWith(
                              color: AppColor().black
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              //Expanded(child: Container()),
              Container(height: 60, child: const VerticalDivider(color: Colors.grey)),
              Center(
                child: SizedBox(
                  height: 60,
                  width: 70,
                  child: Center(
                    child: InkWell(
                      onTap: (){
                      App().replaceNavigate(context, const FeedbackView());
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const ClipOval(
                              child: Image(image: AssetImage('assets/media_and_research.png'),
                                fit:BoxFit.cover,
                                width: 30,
                                height: 30,
                              )
                          ),
                          Text('Feedback &',
                            style: MyTextTheme().smallBCN.copyWith(
                                color: AppColor().black
                            ),
                          ),
                          Text('Suggestions',
                            style: MyTextTheme().smallBCN.copyWith(
                                color: AppColor().black
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              //Expanded(child: Container()),
              Container(height: 60, child: const VerticalDivider(color: Colors.grey)),
              Container(
                height: 60,
                width: 70,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const ClipOval(
                          child: Image(image: AssetImage('assets/side_effect_checker.png'),
                            fit:BoxFit.cover,
                            width: 30,
                            height: 30,
                          )
                      ),
                      Text('Side Effect',
                        style: MyTextTheme().smallBCN.copyWith(
                            color: AppColor().black
                        ),
                      ),
                      Text('Checker',
                        style: MyTextTheme().smallBCN.copyWith(
                            color: AppColor().black
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //Expanded(child: Container()),
            ],
          )
        ]
    ),

);




