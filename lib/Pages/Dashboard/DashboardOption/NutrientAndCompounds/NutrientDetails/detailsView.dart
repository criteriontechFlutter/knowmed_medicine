
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:knowmed/AppManager/MtTextTheme.dart';
import 'package:knowmed/AppManager/my_custom_sd.dart';
import 'package:knowmed/Pages/Dashboard/DashboardOption/NutrientAndCompounds/NutrientDetails/DataModal/detailsDataModal.dart';
import 'package:knowmed/Pages/Dashboard/DashboardOption/NutrientAndCompounds/NutrientDetails/DataModal/dropDownDetailsDataModal.dart';
import 'package:knowmed/Pages/Dashboard/DashboardOption/NutrientAndCompounds/NutrientDetails/detailsModal.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../../../AppManager/appColors.dart';
import 'detailsController.dart';

class NutrientDetailsView extends StatefulWidget {
  const NutrientDetailsView({Key? key}) : super(key: key);

  @override
  State<NutrientDetailsView> createState() => _NutrientDetailsViewState();
}

class _NutrientDetailsViewState extends State<NutrientDetailsView> {

  ItemScrollController _scrollController1 = ItemScrollController();

  NutrientDetailsModal modal=NutrientDetailsModal();

  @override
  get() async{
    await modal.onPressDetails(context);
    await modal.onNutrientSelectFilter(context);

  }

  @override
  void initState(){
    get();
    super.initState();

  }

  String cache='Overview';
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColor().white,
        appBar: AppBar(
          leading: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
              child:  Icon(Icons.arrow_back,color: AppColor().greyDark,)),
          backgroundColor: AppColor().grey_header,
          elevation: 0,
          title: Text('Nutrient Details',style: MyTextTheme().mediumSCB
              .copyWith(color: AppColor().text_blue),),
        ),
        body: GetBuilder(
          init: NutrientDetailsController(),
          builder: (_) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: (){
                            setState(() {
                              cache="Overview";
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                              decoration: BoxDecoration(
                                color: cache == "Overview"?Colors.blue:Colors.white,
                                  borderRadius:  BorderRadius.only(topLeft:Radius.circular(5),bottomLeft: Radius.circular(5)),
                                border: Border.all(color:cache=="Overview"?AppColor().blue:Colors.black)
                              ),
                              child: Text('Overview',style: cache=="Overview"?MyTextTheme().mediumWCN:MyTextTheme().mediumBCN,textAlign: TextAlign.center)),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: (){
                            setState(() {
                              cache="Nutrient Fact";
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            decoration: BoxDecoration(
                                color:  cache == "Nutrient Fact"?Colors.blue:Colors.white,
                                border: Border.all(color: cache=="Nutrient Fact"?AppColor().blue:AppColor().black),
                                borderRadius: const BorderRadius.only(topRight:Radius.circular(5),bottomRight: Radius.circular(5)),
                            ),
                            child: Text('Nutrient Fact',style: cache=="Nutrient Fact"?MyTextTheme().mediumWCN:MyTextTheme().mediumBCN,textAlign: TextAlign.center),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

            cache == "Overview"?Container(
             child: Expanded(
               child: ListView.builder(
                   shrinkWrap: true,
                   itemCount: modal.controller.getNutrientDetailsList.length,
                   itemBuilder: (BuildContext context, int index){
                     NutrientDetailsDataModal nutrientData= modal.controller.getNutrientDetailsList[index];
                     return Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Container(
                         decoration: BoxDecoration(
                           border: Border.all(color: AppColor().grey),
                           borderRadius: BorderRadius.circular(5),
                         ),
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Padding(
                               padding: const EdgeInsets.only(left: 10.0,top: 5),
                               child: Row(
                                 children: [
                                   Image.asset("assets/"+nutrientData.heading.toString()+".png",height: 20,width: 20,color: Colors.blue,),
                                   const SizedBox(width: 5,),
                                   Text(nutrientData.heading.toString(),style: MyTextTheme().mediumBCB.copyWith(color: Colors.blue)),
                                 ],
                               ),
                             ),
                             _getWidgetNutrientDetails(nutrientData),
                             const SizedBox(height: 10,)
                           ],
                         ),
                       ),
                     );
                   }),
             ),
            ):Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MyCustomSD(
                      menuMode: false,
                      height: 200,
                        listToSearch: modal.controller.getNutrientSelectFilterList,
                        valFrom: 'groupname',
                        hideSearch: true,

                        onChanged: (val)async{

                          await modal.onSelectFoodCategory(context);

                          // if(val!=null){
                          //   modal.controller.updateRIndex=val['rIndex'];
                          // }


                        }),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 8.0,right: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        Text('Food List',style: MyTextTheme().smallBCN,),
                        Text('per 100 g',style: MyTextTheme().smallBCN),
                      ],
                    ),
                  ),

                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: modal.controller.nutrientFactList.length,
                        itemBuilder: (BuildContext context,int index){
                          DropDownNutrientFactDetailsDataModal nutrientFactData=modal.controller.getNutrientFactList[index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(color:AppColor().grey),
                                borderRadius: BorderRadius.circular(5)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children:  [
                                    Expanded(child: Text(nutrientFactData.foodName.toString(),style: MyTextTheme().smallPCN.copyWith(color: AppColor().blue))),
                                    Row(
                                      children: [
                                        Text(nutrientFactData.nutrientValue.toString(),style: MyTextTheme().smallPCN.copyWith(color: AppColor().orange),),
                                        Text(' '+nutrientFactData.unit.toString(),style: MyTextTheme().smallPCN.copyWith(color: AppColor().orange),)
                                      ],
                                    )
                                  ],
                                )
                              ),
                            ),
                          );
                        }),
                  )
                ],
              ),
            )
              ],
            );
          }
        ),
      ),
    );
  }


List abc=[
  {
    'name':'faheem',
  },
  {
    'name':'faheem',
  },
  {
    'name':'faheem',
  }
  ];





    _getWidgetNutrientDetails(NutrientDetailsDataModal nutrient){

    var data=nutrient.body;
    print('faheem'+nutrient.headingId.toString());
    if(data is List){
      switch(int.parse(nutrient.headingId.toString())){

        case 22:
          return  Column(
            children: List.generate(nutrient.body!.length, (index)
            {
              var newData=nutrient.body![index];

              return Padding(
                padding: const EdgeInsets.fromLTRB(15,2,10,0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Html(data:newData['value'].toString(),),
                  ],
                ),
              );
            }
            ),
          );

        case 23:
          return  Column(
            children: List.generate((data as List).length, (index)
            {
              var newData=(data as List)[index];

              return Padding(
                padding: const EdgeInsets.fromLTRB(25,3,10,0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 2,
                      backgroundColor: AppColor().black,
                    ),
                    const SizedBox(width: 5,),
                    (newData['whenToUse'] == '')?const Text(""):
                    Text(newData['whenToUse'].toString(),style: MyTextTheme().smallBCN),
                  ],
                ),
              );
            }
            ),
          );

        case 24:
          List<RdaDataModal> rdaData=List <RdaDataModal>.from(
              (data).map((element) => RdaDataModal.fromJson(element)));
          return
            Column(
              children: List.generate(rdaData.length, (index)
              {
                var newData=rdaData[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Html(data:newData.clinicalFeatures.toString(),),
                    const SizedBox(height: 8,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('RDA (Recommended Diet Allowance)',style: MyTextTheme().mediumBCB,),
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('Nutrient',style: MyTextTheme().smallBCN,),
                            Text('Age Group',style: MyTextTheme().smallBCN),
                            Text('Activity',style: MyTextTheme().smallBCN),
                          ],
                        ),

                        Column(
                            children:  List.generate(newData.rda!.length, (index) {
                              return
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 10,),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(45,0,20,0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Expanded(child: Text(newData.rda![index].nutrientName.toString(),style: MyTextTheme().smallBCN)),
                                          Expanded(child: Text(newData.rda![index].age.toString(),style: MyTextTheme().smallBCN)),
                                          Expanded(child: Text(newData.rda![index].activity.toString(),style: MyTextTheme().smallBCN)),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                            } )
                        ),
                      ],
                    ),
                  ],
                );
              }
              ),
            );

        case 25:
          List<InteractionsDataModal> intractionData=List <InteractionsDataModal>.from(
              (data).map((element) => InteractionsDataModal.fromJson(element)));
          return Column(
              children: List.generate(intractionData.length, (index)
                  {
                    var newData=intractionData[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [


                    Column(
                    children: List.generate(nutrient.body!.length, (index)
                    {
                      var newData=nutrient.body![index];
                      print('hhhhhhh'+newData.toString());
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(15,2,10,0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Html(data:nutrient.subHeading.toString(),),
                          ],
                        ),
                      );
                    }
                    ),
                    ),


                        Padding(
                          padding: const EdgeInsets.fromLTRB(10,0,0,0),
                          child: Text('With Food',style: MyTextTheme().smallBCB,),
                        ),
                        const SizedBox(height: 10,),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                          children:List.generate(newData.withFood!.length, (index){
                            return
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Row(
                                    children: [
                                      const SizedBox(width: 25,),
                                      CircleAvatar(
                                        radius: 2,backgroundColor:AppColor().black,
                                      ),

                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(10,8,0,0),
                                        child: Text(newData.withFood![index].name.toString(),style: MyTextTheme().smallBCN,),
                                      ),
                                      Visibility(
                                        visible:newData.withFood![index].interactionEffect!.isNotEmpty,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color:(newData.withFood![index].interactionEffect.toString()=='Enhancer')?AppColor().green:(newData.withFood![index].interactionEffect.toString()=='Inhibitor')?AppColor().red:AppColor().white,
                                              borderRadius: BorderRadius.circular(10)
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 2),
                                            child: Text(newData.withFood![index].interactionEffect.toString(),style: MyTextTheme().smallWCN,),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )

                              ],
                            );
                        }
                          )
                        ),
                        const SizedBox(height: 10,),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0,top: 10),
                              child: Text('With Medicine',style: MyTextTheme().smallBCB,),
                            ),
                            const SizedBox(height: 10,),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:List.generate(newData.withMedicine!.length, (index){
                                  return
                                    Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(10,5,0,0),
                                          child: Row(
                                            children: [
                                              const SizedBox(width: 20,),
                                              CircleAvatar(
                                                radius: 2,backgroundColor:AppColor().black,
                                              ),
                                              const SizedBox(width: 8,),
                                              Text(newData.withMedicine![index].name.toString(),style: MyTextTheme().smallBCN),
                                              const SizedBox(width: 8,),
                                              Visibility(
                                                visible:newData.withMedicine![index].interactionEffect!.isNotEmpty,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color:(newData.withMedicine![index].interactionEffect.toString()=='Enhancer')?AppColor().green:(newData.withMedicine![index].interactionEffect.toString()=='Inhibitor')?AppColor().red:AppColor().white,
                                                    borderRadius: BorderRadius.circular(10)
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets.symmetric(vertical: 2.0,horizontal: 8),
                                                    child: Text(newData.withMedicine![index].interactionEffect.toString(),style: MyTextTheme().smallWCN),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        )

                                      ],
                                    );
                                }
                                )
                            ),
                          ],
                        ),
                        const SizedBox(height: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0,top: 10),
                              child: Text('With Nutrient',style: MyTextTheme().smallBCB,),
                            ),
                            const SizedBox(height: 10,),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:List.generate(newData.withNutrient!.length, (index){
                                  return
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            const SizedBox(width: 25,),
                                            CircleAvatar(
                                              radius: 2,backgroundColor:AppColor().black,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.fromLTRB(10,8,0,0),
                                              child: Text(newData.withNutrient![index].name.toString(),style: MyTextTheme().smallBCN),
                                            ),
                                            Visibility(
                                              visible:newData.withNutrient![index].interactionEffect!.isNotEmpty,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color:(newData.withNutrient![index].interactionEffect.toString()=='Enhancer')?AppColor().green:(newData.withNutrient![index].interactionEffect.toString()=='Inhibitor')?AppColor().red:AppColor().white,
                                                  borderRadius: BorderRadius.circular(10)
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 2),
                                                  child: Text(newData.withNutrient![index].interactionEffect.toString(),style: MyTextTheme().smallWCN),
                                                ),
                                              ),
                                            )
                                          ],
                                        )

                                      ],
                                    );
                                }
                                )
                            ),
                          ],
                        ),
                      ],
                    );


                  }
          ),
          );



        case 26:
          return  Column(
            children: List.generate(nutrient.body!.length, (index)
            {
              var newData=nutrient.body![index];

              return Padding(
                padding: const EdgeInsets.fromLTRB(15,2,10,0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   Row(
                     children: [
                       CircleAvatar(
                         radius: 2,backgroundColor:AppColor().black,
                       ),
                       const SizedBox(width: 5,),
                       Text(newData['text'].toString(),style: MyTextTheme().mediumBCB,),
                       Expanded(child: Html(data:newData['value'].toString(),)),
                     ],
                   )
                  ],
                ),
              );
            }
            ),
          );




        default: return Container();
      }
    }
    else if(data is String){
      return Html(data: data.toString());
    }
    else{
      return Container();
    }


  }
}
