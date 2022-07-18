import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:knowmed/AppManager/appUtils.dart';
import 'package:knowmed/Pages/Dashboard/DashboardOption/InteractionChecker/new/interaction_checker_page_view.dart';
import 'package:lottie/lottie.dart';

import '../../../../../AppManager/MtTextTheme.dart';
import '../../../../../AppManager/appColors.dart';
import '../../../../../AppManager/coloured_safe_area.dart';

class ResultView extends StatefulWidget {
  const ResultView({Key? key}) : super(key: key);

  @override
  State<ResultView> createState() => _ResultViewState();
}

class _ResultViewState extends State<ResultView> {
  @override
  Widget build(BuildContext context) {
    return ColoredSafeArea(
      child: Scaffold(backgroundColor: AppColor().white,
        appBar: AppBar(
          leading: InkWell(
            onTap: (){
             App().replaceNavigate(context, InteractionCheckerPageView());
            },
              child: Icon(Icons.arrow_back,color: AppColor().grey,)),
          title: Text('Interaction Checker Results',
              style: MyTextTheme().largeSCB.copyWith(
                  color: AppColor().text_blue
              )
          ),
          backgroundColor: AppColor().grey_header,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
              child: Lottie.asset('assets/no_data_found.json'),
            ),
            Text('No data found!',style: MyTextTheme().mediumBCB,)
          ],
        ),
      ),
    );
  }
}
