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

  DiseaseDetailsModal modal = DiseaseDetailsModal();
  DiseaseModal disease_Modal = DiseaseModal();

  var justifyText = TextAlign.justify;
  @override
  bool showBackToTopButton = false;

  @override
  void initState() {
    super.initState();
    get();
  }

  @override
  get() async {
    await modal.diseaseDetails(context, widget.index);
  }

  void _scrollToTop() {
    _scrollController1.scrollTo(
        index: 0, duration: const Duration(milliseconds: 500));
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
            child: Icon(
              Icons.keyboard_arrow_up,
              size: 40,
              color: AppColor().blue,
            ),
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
                    itemBuilder: (context, index3) {
                      DiseaseDetailsDataModal modaldata =
                          modal.controller.getMedicineDetailsList[index3];
                      DiseaseDataModal medicineData = disease_Modal
                          .controller.getDiseaseAlphabet[widget.index];
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
                                        border: Border.all(color: Colors.grey),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          index3 == 0
                                              ? Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                    4,
                                                    0,
                                                    0,
                                                    2,
                                                  ),
                                                  child: Text(
                                                    medicineData.problemName
                                                        .toString(),
                                                    style:
                                                        MyTextTheme().mediumBCB,
                                                  ),
                                                )
                                              : const SizedBox(),
                                          //index3 == 0?SizedBox(height: 2,):SizedBox(),
                                          index3 == 0
                                              ? Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          4, 0, 0, 8),
                                                  child: Text(
                                                    'Know your medicine for better treatment',
                                                    style:
                                                        MyTextTheme().mediumBCN,
                                                  ),
                                                )
                                              : const SizedBox(),
                                          Wrap(
                                            children: [
                                              Image.asset(
                                                "assets/" +
                                                    modaldata.heading
                                                        .toString() +
                                                    ".png",
                                                height: 20,
                                                width: 20,
                                                color: Colors.blue,
                                              ),
                                              const SizedBox(
                                                width: 8,
                                              ),
                                              Text(
                                                modaldata.heading.toString(),
                                                style: MyTextTheme()
                                                    .mediumBCB
                                                    .copyWith(
                                                        color: Colors.blue),
                                              ),

                                            ],
                                          ),

                                          const SizedBox(
                                            height: 10,
                                          ),
                                          _getWidgetAccordingToType(modaldata),
                                          const SizedBox(
                                            height: 5,
                                          ),

                                          // Row(
                                          //   crossAxisAlignment:
                                          //       CrossAxisAlignment.start,
                                          //   //mainAxisAlignment: MainAxisAlignment.start,
                                          //   children: [
                                          //     // Visibility(
                                          //     //     visible: (modaldata
                                          //     //         .reference??'')!='',
                                          //     //     child: Column(
                                          //     //       children: [
                                          //     //         const SizedBox(
                                          //     //           height: 8,
                                          //     //         ),
                                          //     //         Text(
                                          //     //           'Ref:',
                                          //     //           style: MyTextTheme()
                                          //     //               .mediumBCB,
                                          //     //         ),
                                          //     //       ],
                                          //     //     )),
                                          //     // Expanded(
                                          //     //     child: Html(
                                          //     //   data: modaldata.reference
                                          //     //       .toString(),
                                          //     // )),
                                          //   ],
                                          // ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 0, 8, 0),
                                  child: Visibility(
                                    visible: index3 == 0 ? true : false,
                                    child: Wrap(
                                      children: List.generate(
                                          modal
                                              .controller
                                              .getMedicineDetailsList
                                              .length, (index2) {
                                        return InkWell(
                                          onTap: () {
                                            _scrollController1.scrollTo(
                                                index: index2,
                                                duration: const Duration(
                                                    milliseconds: 500));
                                          },
                                          child: modal
                                                      .controller
                                                      .getMedicineDetailsList[
                                                          index2]
                                                      .heading
                                                      .toString() ==
                                                  "Overview"
                                              ? const Text("")
                                              : Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          3, 4, 4, 3),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: AppColor().blue,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                    child: RichText(
                                                        text:
                                                            TextSpan(children: [
                                                      WidgetSpan(
                                                          child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .fromLTRB(
                                                                          8,
                                                                          0,
                                                                          2,
                                                                          3),
                                                              child:
                                                                  Image.asset(
                                                                "assets/" +
                                                                    modal
                                                                        .controller
                                                                        .getMedicineDetailsList[
                                                                            index2]
                                                                        .heading
                                                                        .toString() +
                                                                    ".png",
                                                                height: 20,
                                                                width: 20,
                                                                color: Colors
                                                                    .white,
                                                              ))),
                                                      WidgetSpan(
                                                          child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                3, 5, 5, 7),
                                                        child: Text(
                                                          modal
                                                              .controller
                                                              .getMedicineDetailsList[
                                                                  index2]
                                                              .heading
                                                              .toString(),
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: MyTextTheme()
                                                              .smallWCB,
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
                    });
              }),
        ),
      ),
    );
  }

  Widget _getWidgetAccordingToType(DiseaseDetailsDataModal medicine) {
    var data = medicine.body;

    if (data is List) {
      switch (int.parse(medicine.headingId.toString())) {
        case 11:
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate((data as List).length, (index) {
              var newData = (data as List)[index];

              return Padding(
                  padding: const EdgeInsets.fromLTRB(15, 2, 10, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        newData['text'].toString(),
                        style: MyTextTheme().smallBCN,
                      ),
                      Text(newData['value'].toString(),
                          style: MyTextTheme().smallBCN),
                      const SizedBox(height: 5,),
                      Text('Sub Overview:',style: MyTextTheme().smallBCB,),

                      Column(
                        children: List.generate(medicine.subOverview!.length, (index2){
                          var overview=medicine.subOverview![index2];
                          return Column(
                            children: [
                              Column(
                                children: List.generate(overview.subOverview!.length, (index){
                                  var subOverview=overview.subOverview![index2];
                                  return Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          backgroundColor: AppColor().black,
                                          radius: 2,
                                        ),
                                    Expanded(child: Html(data:subOverview.subOverview.toString()))
                                      ],
                                    ),
                                  );
                                }),
                              )
                            ],
                          );
                        }),
                      )
                    ],
                  ),
                  );
            }),
          );

        case 13:
          List<ClinicalFeaturesDataModal> clinicalFeatures =
              List<ClinicalFeaturesDataModal>.from((data).map(
                  (element) => ClinicalFeaturesDataModal.fromJson(element)));
          return Column(
            children: List.generate(clinicalFeatures.length, (index) {
              var newData = clinicalFeatures[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    newData.inputType.toString(),
                    style: MyTextTheme().smallBCB,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 5, 0, 10),
                    child: Column(
                      children:
                          List.generate(newData.concern!.length, (index2) {
                        return Column(
                          children: List.generate(
                              newData.concern![index2].data!.length, (index3) {
                            var concern =
                                newData.concern![index2].data![index3];
                            return Row(
                              children: [
                                CircleAvatar(
                                  radius: 2,
                                  backgroundColor: AppColor().black,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                    child: Text(concern.problemName.toString(),style: MyTextTheme().smallBCN,)),
                              ],
                            );
                          }),
                        );
                      }),
                    ),
                  ),
                ],
              );
            }),
          );

        case 14:
          List<DiagnosticsDataModal> diagnostics =
          List<DiagnosticsDataModal>.from((data).map(
                  (element) => DiagnosticsDataModal.fromJson(element)));
          return Column(
            children: List.generate(diagnostics.length, (index) {
              var newData = diagnostics[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    newData.type.toString(),
                    style: MyTextTheme().smallBCB,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                    child: Column(
                      children:
                      List.generate(newData.investigation!.length, (index2) {
                        return
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Test",style: MyTextTheme().smallBCN,),
                                  Text("Subtest",style: MyTextTheme().smallBCN),
                                  Text("Property",style: MyTextTheme().smallBCN),
                                  Text("Result",style: MyTextTheme().smallBCN)
                                ],
                              ),
                              Divider(
                                color: AppColor().greyLight,
                                thickness: 0.5,
                              ),
                              Column(
                              children: List.generate(
                                  newData.investigation![index2].data!.length, (index3) {
                                var daigonasticData = newData.investigation![index2].data![index3];
                                return Column(
                                  children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(0,10,0,2),
                                  child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(child: Text(daigonasticData.testName.toString(),style: MyTextTheme().smallBCN)),
                                  Expanded(child: Text(daigonasticData.subTestName.toString(),style: MyTextTheme().smallBCN)),
                                  Expanded(child: Text(daigonasticData.propertyValue.toString(),style: MyTextTheme().smallBCN)),
                                  Expanded(child: Text(daigonasticData.remarkValue.toString(),style: MyTextTheme().smallBCN)),
                                  ],
                                  ),
                                )
                                  ],
                                );

                              }),

                        ),
                            ],
                          );
                      }),
                    ),
                  ),
                ],
              );
            }),
          );

        case 15:
          List<TreatmentDataModal> treatment =
          List<TreatmentDataModal>.from((data).map(
                  (element) => TreatmentDataModal.fromJson(element)));
          return Column(
            children: List.generate(treatment.length, (index) {
              var newData = treatment[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    newData.subHeading.toString(),
                    style: MyTextTheme().smallBCB,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 5, 0, 8),
                    child: Column(
                      children:
                      List.generate(newData.data!.length, (index2) {
                        return
                          Column(
                            children: List.generate(
                                newData.data![index2].treatmentType!.length, (index3) {
                              var treatmentData = newData.data![index2].treatmentType![index3];
                              return Column(
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(0,4,5,0),
                                        child: CircleAvatar(
                                          radius: 2,
                                          backgroundColor: AppColor().black,
                                        ),
                                      ),
                                      Expanded(child: Text(treatmentData.treatmentType.toString(),style: MyTextTheme().smallBCN,))
                                    ],
                                  )

                                ],
                              );

                            }),

                          );
                      }),
                    ),
                  ),
                ],
              );
            }),
          );

        case 18:
          List<ConcernsDataModal> concerns =
          List<ConcernsDataModal>.from((data).map(
                  (element) => ConcernsDataModal.fromJson(element)));
          return Column(
            children: List.generate(concerns.length, (index) {
              var newData = concerns[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    newData.subHeading.toString(),
                    style: MyTextTheme().smallBCB,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 5, 0, 8),
                    child: Column(
                      children:
                      List.generate(newData.data!.length, (index2) {
                        return
                          Column(
                            children: List.generate(
                                (newData.data![index2].precautionType?? []).length, (index3) {
                              var concernsData = newData.data![index2].precautionType![index3];
                              return Column(
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(0,4,5,0),
                                        child: CircleAvatar(
                                          radius: 2,
                                          backgroundColor: AppColor().black,
                                        ),
                                      ),
                                      Expanded(child: Text(concernsData.concernType.toString(),style: MyTextTheme().smallBCN,))
                                    ],
                                  )

                                ],
                              );

                            }),

                          );
                      }),
                    ),
                  ),
                ],
              );
            }),
          );

        case 20:
          List<DietDataModal> diet =
          List<DietDataModal>.from((data).map(
                  (element) => DietDataModal.fromJson(element)));
          return Column(
            children: List.generate(diet.length, (index) {
              var newData = diet[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    newData.departmentName.toString(),
                    style: MyTextTheme().smallBCB,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 5, 0, 8),
                    child: Column(
                      children:
                      List.generate(newData.provisionalDiet!.length, (index2) {
                        var provisionalDiet=newData.provisionalDiet![index2];
                        return Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(0,4,5,0),
                                  child: CircleAvatar(
                                    radius: 2,
                                    backgroundColor: AppColor().black,
                                  ),
                                ),
                                Expanded(child: Text(provisionalDiet.provisionalDiet.toString(),style: MyTextTheme().smallBCN,))
                              ],
                            )
                          ],
                        );
                      }),
                    ),
                  ),
                ],
              );
            }),
          );
        case 21:
          List<RelatedDiseaseDataModal> relatedDisease =
          List<RelatedDiseaseDataModal>.from((data).map(
                  (element) => RelatedDiseaseDataModal.fromJson(element)));
          return Column(
            children: List.generate(relatedDisease.length, (index) {
              var newData = relatedDisease[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    newData.departmentName.toString(),
                    style: MyTextTheme().smallBCB,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 5, 0, 8),
                    child: Column(
                      children:
                      List.generate(newData.differentialDiagnosis!.length, (index2) {
                        var relatedDieaseData=newData.differentialDiagnosis![index2];
                        return Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(0,4,5,0),
                                  child: CircleAvatar(
                                    radius: 2,
                                    backgroundColor: AppColor().black,
                                  ),
                                ),
                                Expanded(child: Text(relatedDieaseData.differentialDiagnosis.toString(),style: MyTextTheme().smallBCN,))
                              ],
                            )
                          ],
                        );
                      }),
                    ),
                  ),
                ],
              );
            }),
          );
        case 28:
          List<PathophysiologyDataModal> pathophysiology =
          List<PathophysiologyDataModal>.from((data).map(
                  (element) => PathophysiologyDataModal.fromJson(element)));
          return Column(
            children: List.generate(pathophysiology.length, (index) {
              var newData = pathophysiology[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    newData.departmentName.toString(),
                    style: MyTextTheme().smallBCB,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 5, 0, 8),
                    child: Column(
                      children:
                      List.generate(newData.pathophysiology!.length, (index2) {
                        var pathophysiologyData=newData.pathophysiology![index2];
                        return Column(
                          children: [
                            Text(pathophysiologyData.pathophysiology.toString(),style: MyTextTheme().smallBCN,)
                          ],
                        );
                      }),
                    ),
                  ),
                ],
              );
            }),
          );
        // case 30:
        //   List<EpidemiologyDataModal> epidemiology =
        //   List<EpidemiologyDataModal>.from((data).map(
        //           (element) => EpidemiologyDataModal.fromJson(element)));
        //   return Column(
        //     children: List.generate(epidemiology.length, (index) {
        //       var newData = epidemiology[index];
        //       return Column(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: [
        //           Text(
        //             newData.subHeading.toString(),
        //             style: MyTextTheme().smallBCB,
        //           ),
        //           Padding(
        //             padding: const EdgeInsets.fromLTRB(10, 5, 0, 8),
        //             child: Column(
        //               children:
        //               List.generate(newData.data!.length, (index2) {
        //                 return
        //                   Column(
        //                     children: List.generate(
        //                         (newData.data![index2].precautionType?? []).length, (index3) {
        //                       var concernsData = newData.data![index2].precautionType![index3];
        //                       return Column(
        //                         children: [
        //                           Row(
        //                             crossAxisAlignment: CrossAxisAlignment.start,
        //                             children: [
        //                               Padding(
        //                                 padding: const EdgeInsets.fromLTRB(0,4,5,0),
        //                                 child: CircleAvatar(
        //                                   radius: 2,
        //                                   backgroundColor: AppColor().black,
        //                                 ),
        //                               ),
        //                               Expanded(child: Text(concernsData.concernType.toString(),style: MyTextTheme().smallBCN,))
        //                             ],
        //                           )
        //
        //                         ],
        //                       );
        //
        //                     }),
        //
        //                   );
        //               }),
        //             ),
        //           ),
        //         ],
        //       );
        //     }),
        //   );
        default:
          return Container();
      }
    } else if (data is String) {
      return Html(data: data.toString());
    } else {
      return Container();
    }
  }
}
