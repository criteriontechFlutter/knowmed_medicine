// import 'package:flutter/material.dart';
//
// import '../../../../../AppManager/MtTextTheme.dart';
// import '../../../../../AppManager/appColors.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:knowmed/AppManager/hex_color_extention.dart';
import 'package:knowmed/Pages/Dashboard/DashboardOption/DiseaseAndCondition/disease_Data_Modal.dart';
import 'package:knowmed/Pages/Dashboard/DashboardOption/DiseaseAndCondition/disease_and_condition_Modal.dart';
import 'package:knowmed/Pages/Dashboard/DashboardOption/DiseaseAndCondition/disease_details/disease_Details_Controller.dart';
import 'package:knowmed/Pages/Dashboard/DashboardOption/DiseaseAndCondition/disease_details/disease_Details_DataModal.dart';
import 'package:knowmed/Pages/Dashboard/DashboardOption/DiseaseAndCondition/disease_details/disease_Details_Modal.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../../../AppManager/MtTextTheme.dart';
import '../../../../../AppManager/appColors.dart';
import '../../../../../AppManager/coloured_safe_area.dart';

class DiseaseDetails extends StatefulWidget {
  final int index;

  const DiseaseDetails({Key? key, required this.index}) : super(key: key);


  @override
  State<DiseaseDetails> createState() => _DiseaseDetailsState();
}

class _DiseaseDetailsState extends State<DiseaseDetails> {


  //ScrollController _controller = ScrollController();
     ItemScrollController _scrollController1 = ItemScrollController();


  DiseaseDetailsModal modal= DiseaseDetailsModal();
  DiseaseModal disease_Modal=DiseaseModal();

    var justifyText=TextAlign.justify;
    @override
    bool showBackToTopButton = false;

    @override
    void initState() {
      super.initState();
      get();


    }


    @override
  get() async {
    await modal.diseaseDetails(context,widget.index);
  }

  void _scrollToTop() {
    _scrollController1.scrollTo(index:0, duration: const Duration(milliseconds: 500));
  }

    @override
    void dispose() {
      super.dispose();
    }
  @override
  Widget build(BuildContext context) {

    return Container(
      color: AppColor().grey_dark,
      child: ColoredSafeArea(
        child: Scaffold(
          backgroundColor: AppColor().white,
          appBar: AppBar(
            // actions: [
            //   IconButton(
            //       onPressed: (){
            //         print('pressed');
            //       },
            //       icon: const Icon(Icons.search,color: Colors.indigo,size: 30,))
            // ],
            title: Text('Disease Details',
                style: MyTextTheme()
                    .mediumSCB
                    .copyWith(color: AppColor().text_blue)),
            backgroundColor: AppColor().grey_header,
          ),
          floatingActionButton: FloatingActionButton(
            elevation: 0,
            backgroundColor: Colors.grey.withOpacity(0.1),
            child: Icon(Icons.keyboard_arrow_up,size: 40,color:AppColor().blue,),
            onPressed: () {
              _scrollToTop();
            },
          ),

          body: GetBuilder(
            init: DiseaseDetailsController(),
            builder: (_) {
              return ScrollablePositionedList.builder(
               itemScrollController: _scrollController1,
                  //controller:  _controller,
                  itemCount: modal.controller.getMedicineDetailsList.length,
                  itemBuilder: (context,index3) {
                    DiseaseDetailsDataModal modaldata=modal.controller.getMedicineDetailsList[index3];
                    DiseaseDataModal medicineData= disease_Modal.controller.getDiseaseAlphabet[widget.index];
                    return Column(
                      children: [
                        SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      border:Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(10)
                                  ),

                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                       index3 == 0?Padding(
                                         padding: const EdgeInsets.fromLTRB(4,0,0,2,),
                                         child: Text( medicineData.problemName.toString(),style: MyTextTheme().mediumBCB,),
                                       ):const SizedBox(),
                                        //index3 == 0?SizedBox(height: 2,):SizedBox(),
                                       index3 == 0?Padding(
                                         padding: const EdgeInsets.fromLTRB(4,0,0,8),
                                         child: Text('Know your medicine for better treatment',style: MyTextTheme().mediumBCN,),
                                       ):const SizedBox(),
                                        Wrap(
                                          children: [
                                            Image.asset("assets/"+modaldata.heading.toString()+".png",height: 20,width: 20,color: Colors.blue,),
                                            SizedBox(width: 8,),
                                            Text(modaldata.heading.toString(),style: MyTextTheme().mediumBCB.copyWith(color: Colors.blue),),
                                          ],
                                        ),
                                        const SizedBox(height: 10,),
                                        _getWidgetAccordingToType( modaldata),
                                        const SizedBox(height: 5,),
                                       Row(
                                         crossAxisAlignment: CrossAxisAlignment.start,
                                         //mainAxisAlignment: MainAxisAlignment.start,
                                         children: [
                                           Visibility(
                                            visible:modaldata.reference!.isNotEmpty,
                                               child: Column(
                                                 children: [
                                                   SizedBox(height: 8,),
                                                   Text('Ref:',style: MyTextTheme().mediumBCB,),
                                                 ],
                                               )),
                                           Expanded(child: Html(data:modaldata.reference.toString(),)),
                                         ],
                                       )

                                      ],
                                    ),
                                  ),
                                ),
                              ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8,0,8,0),
                      child: Visibility(
                        visible:index3 == 0?true:false,
                        child: Wrap(
                          children: List.generate(
                              modal.controller.getMedicineDetailsList.length
                              , (index2) {
                            return
                              InkWell(
                                onTap: (){
                                  _scrollController1.scrollTo(index:index2, duration: const Duration(milliseconds: 500));

                                },
                                child:modal.controller.getMedicineDetailsList[index2].heading.toString() == "Overview"?const Text(""):
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(3,4,4,3),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: AppColor().blue,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: RichText(
                                        text: TextSpan(children: [
                                           WidgetSpan(
                                              child: Padding(
                                                padding: EdgeInsets.fromLTRB(8, 0, 2, 3),
                                                child: Image.asset("assets/"+modal.controller.getMedicineDetailsList[index2].heading.toString()+".png",height: 20,width: 20,color: Colors.white,)
                                              )),
                                          WidgetSpan(
                                              child: Padding(
                                                padding: const EdgeInsets.fromLTRB(3, 5, 5,7),
                                                child:
                                                Text(
                                                    modal.controller.getMedicineDetailsList[index2].heading.toString(),textAlign: TextAlign.center,
                                                  style: MyTextTheme().smallWCB,
                                                ),
                                              )),
                                        ])),

                                  ),
                                ),
                              );
                          }),
                        ),
                      ),
                    ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }
              );
            }
          ),
        ),
      ),
    );
  }


  Widget _getWidgetAccordingToType(DiseaseDetailsDataModal medicine){

    var data=medicine.body;

    if(data is List){

      switch(int.parse(medicine.headingId.toString()))
      {

        case 2:
          return  Column(
            children: List.generate((data as List).length, (index)
            {
              var newData=(data as List)[index];

              return Padding(
                padding: const EdgeInsets.fromLTRB(15,2,10,0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 2,
                      backgroundColor: AppColor().black,
                    ),
                    const SizedBox(width: 5,),
                    (newData['whenToUse'] == '')?const Text(""):
                    Expanded(child: Text(newData['whenToUse'].toString(),style: MyTextTheme().smallBCN)),
                  ],
                ),
              );
            }
            ),
          );
        case 3:
          List<AdultDoseBody> doseData=List <AdultDoseBody>.from(
              (data).map((element) => AdultDoseBody.fromJson(element)));
          List<PediatricDose> pediatricData=List <PediatricDose>.from(
              (data).map((element) => PediatricDose.fromJson(element)));
        return
          Column(
          children: List.generate(doseData.length, (index)
          {
            var newData=doseData[index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(newData.doseHeading.toString(),style: MyTextTheme().smallBCB,),
                const SizedBox(height: 8,),
                Text(newData.doseSubHeading.toString(),style: MyTextTheme().smallBCN),
                const SizedBox(height: 8,),
                Visibility(
                  visible: newData.adultDose!.isNotEmpty,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Adult Dose',style: MyTextTheme().mediumBCB,),

                      Column(

                        children:  List.generate(newData.adultDose!.length, (index) {
          return
              Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Padding(
                          padding: const EdgeInsets.fromLTRB(20,5,0,8),
                          child: (newData.adultDose!.isEmpty)?const Text(""):
                          Text(newData.adultDose![index].ailment.toString(),style: MyTextTheme().mediumBCN,),
                        ),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceAround,
                         children: [
                           Text('Route',style: MyTextTheme().smallBCN,),
                           Text('Form',style: MyTextTheme().smallBCN),
                           Text('Dose',style: MyTextTheme().smallBCN),
                           Text('Weight',style: MyTextTheme().smallBCN),
                           Text('age',style: MyTextTheme().smallBCN),
                         ],
                       ),
                        const SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20,0,20,0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(child: Text(newData.adultDose![index].route.toString(),style: MyTextTheme().smallBCN)),
                              Expanded(child: Text(newData.adultDose![index].formName.toString(),style: MyTextTheme().smallBCN)),
                              Expanded(child: Text(newData.adultDose![index].dose.toString(),style: MyTextTheme().smallBCN)),
                              Expanded(child: Text(newData.adultDose![index].weight.toString(),style: MyTextTheme().smallBCN)),
                              Expanded(child: Text(newData.adultDose![index].age.toString(),style: MyTextTheme().smallBCN)),
                            ],
                          ),
                        ),
                        const Divider(
                          color:Colors.black,
                        thickness: 1,),
                      ],
              );
                        } )
                      ),
                    ],
                  ),
                ),

                Visibility(
                  visible: newData.pediatricDose!.isNotEmpty,

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Pediatric Dose',style: MyTextTheme().mediumBCB,),

                      Column(

                          children:  List.generate(newData.pediatricDose!.length, (index) {
                            return
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(20,5,0,8),
                                    child: Text(newData.pediatricDose![index].ailment.toString(),style: MyTextTheme().mediumBCN,),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Text('Route',style: MyTextTheme().smallBCN,),
                                      Text('Form',style: MyTextTheme().smallBCN),
                                      Text('Dose',style: MyTextTheme().smallBCN),
                                      Text('Weight',style: MyTextTheme().smallBCN),
                                      Text('age',style: MyTextTheme().smallBCN),
                                    ],
                                  ),
                                  const SizedBox(height: 10,),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(20,0,20,0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Expanded(child: Text(newData.pediatricDose![index].route.toString())),
                                        Expanded(child: Text(newData.pediatricDose![index].formName.toString(),style: MyTextTheme().smallBCN)),
                                        Expanded(child: Text(newData.pediatricDose![index].dose.toString(),style: MyTextTheme().smallBCN)),
                                        Expanded(child: Text(newData.pediatricDose![index].weight.toString(),style: MyTextTheme().smallBCN)),
                                        Expanded(child: Text(newData.pediatricDose![index].age.toString(),style: MyTextTheme().smallBCN)),
                                      ],
                                    ),
                                  ),
                                  const Divider(
                                    color:Colors.black,
                                    thickness: 1,),
                                ],
                              );

                          } )
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
          ),
        );


        case 4:
          return  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate((data as List).length, (index)
            {
              var newData=(data as List)[index];

              return
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Wrap(
                    children: [
                      Wrap(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: CircleAvatar(
                            radius: 2,
                            backgroundColor: AppColor().black,
                          ),
                        ),

                        const SizedBox(width: 5,),
                        Text(newData['sideEffects'].toString(),style: MyTextTheme().smallBCN,),
                        SizedBox(width: 5,),
                        Visibility(
                          visible: newData['isWatchable'] == "No"?false:true,
                          child: Container(
                            decoration: BoxDecoration(
                                color: AppColor().orange,
                                borderRadius: BorderRadius.circular(5)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal:6,vertical: 1),
                              child: Text('Watchable',style: MyTextTheme().smallWCN,),
                            ),
                          ),
                        ),
                        SizedBox(width: 5,),
                        Container(
                            decoration: BoxDecoration(
                                color:newData['sideEffectColor'].toString().toColor(),
                                borderRadius: BorderRadius.circular(5)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(5,0,5,2),
                              child: Text(newData['sideEffectType'].toString(),style: MyTextTheme().smallWCN,),
                            ),),
                        const SizedBox(width: 5,),

                        Visibility(
                          visible: newData['isLifeThreatening']=='No'?false:true,
                          child: Container(
                            // height: 10,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(5)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5.0),
                              child: Text('Life Threatening',style: MyTextTheme().smallWCN),
                            ),
                          ),
                        ),


                      ],
              ),
                    ],
                  ),
                );
            }
            ),
          );


        case 5:
          List<IntractionDataModal> intractionData=List <IntractionDataModal>.from(
              (data).map((element) => IntractionDataModal.fromJson(element)));
          return  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Visibility(
                visible:intractionData[0].interactionWithMedicine!.isNotEmpty,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10,0,0,0),
                      child: Text('With Medicine',style: MyTextTheme().mediumBCB,),
                    ),
                  ],
                ),
              ),
          Column(
          children: List.generate(intractionData[0].interactionWithMedicine!.length, (index)
          {

            var newData=intractionData[0].interactionWithMedicine![index];

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(25,5,8,0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 2,
                        backgroundColor: AppColor().black,
                      ),
                      const SizedBox(width: 5,),
                      Expanded(child: Text(newData.interactionWithMedicine.toString(),style: MyTextTheme().smallBCN,)),
                    ],
                  ),
                )
              ],
            );
          }

          ),
    ),
              SizedBox(height: 10,),


              Visibility(
                visible:intractionData[0].interactionWithMedicineGroup!.isNotEmpty,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10,0,0,0),
                      child: Text('With Medicine Group',style: MyTextTheme().mediumBCB,),
                    ),
                    Column(
                      children: List.generate(intractionData[0].interactionWithMedicineGroup!.length, (index)
                      {

                        var newData=intractionData[0].interactionWithMedicineGroup![index];

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(25,5,8,0),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 2,
                                    backgroundColor: AppColor().black,
                                  ),
                                  const SizedBox(width: 5,),
                                  Expanded(child: Text(newData.interactionWithMedicineGroup.toString(),style: MyTextTheme().smallBCN,)),
                                ],
                              ),
                            )
                          ],
                        );
                      }
                      ),
                    ),
                  ],
                ),
              ),



             const SizedBox(height: 10,),
             Visibility(
               visible: intractionData[0].interactionWithNurient!.isNotEmpty,
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Padding(
                     padding: const EdgeInsets.fromLTRB(10,0,0,0),
                     child: Text('With Nurient',style: MyTextTheme().mediumBCB,),
                   ),
                   Column(
                     children: List.generate(intractionData[0].interactionWithNurient!.length, (index)
                     {

                       var newData=intractionData[0].interactionWithNurient![index];

                       return Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Padding(
                             padding: const EdgeInsets.fromLTRB(25,5,8,0),
                             child: Row(
                               children: [
                                 CircleAvatar(
                                   radius: 2,
                                   backgroundColor: AppColor().black,
                                 ),
                                 const SizedBox(width: 5,),
                                 Expanded(child: Text(newData.interactionWithNutrient.toString(),style: MyTextTheme().smallBCN,)),
                               ],
                             ),
                           )
                         ],
                       );
                     }
                     ),
                   ),
                 ],
               ),
             ),
            ],
          );



        case 6:
          return  Column(
            children: List.generate((data as List).length, (index)
            {
              var newData=(data as List)[index];

              return Padding(
                padding: const EdgeInsets.fromLTRB(18,5,0,0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 2,
                      backgroundColor: AppColor().black,
                    ),
                    const SizedBox(width: 5,),
                    Text(newData['text'].toString(),style: MyTextTheme().mediumBCB,),
                    const SizedBox(width: 10,),
                    Text(newData['value'].toString(),style: MyTextTheme().smallBCN,)
                  ],
                ),
              );
            }
            ),
          );


        case 8:
          return  Column(
            children: List.generate((data as List).length, (index)
            {
              var newData=(data as List)[index];

              return Padding(
                padding: const EdgeInsets.fromLTRB(10,4,0,2),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 2,
                      backgroundColor: AppColor().black,
                    ),
                    const SizedBox(width: 5,),
                    Expanded(child: Text(newData['precautions'].toString(),style: MyTextTheme().smallBCN,)),
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

