import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_state_manager/src/simple/simple_builder.dart';
import 'package:get_storage/get_storage.dart';
import 'package:knowmed/AppManager/MtTextTheme.dart';
import 'package:knowmed/AppManager/appColors.dart';
import 'package:knowmed/AppManager/appUtils.dart';

import 'package:knowmed/AppManager/UserRepository/user_data.dart';
import 'package:knowmed/FactsController.dart';

import 'package:lottie/lottie.dart';

import 'Pages/Dashboard/DashboardView.dart';
import 'Pages/Login/login_page_view.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await GetStorage.init("user");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return SimpleBuilder(
        builder: (_) {
          return GetMaterialApp(
            title: 'Knowmed',
            debugShowCheckedModeBanner: false,
            // darkTheme: ThemeData.dark(),
            themeMode:  ThemeMode.light,

            home: MyHomePage(),
          );
        }
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  App app=App();
  FactsCount factsC=Get.put(FactsCount());





  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();


    get();
  }


  get() async{
    print("*******************"+UserData().getUserData.id.toString());
    pageRoute();
  }


  var user;

  pageRoute() async{

    Timer(
        const Duration(seconds: 5),
            () =>
            toDashboard()
    );

  }

  toDashboard(){
    print("herereeee"+UserData().getUserData.id.toString());
    Widget route=UserData().getUserData.id!=null?const DashboardView():const LoginPageView();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
     // print("hhhhhh"+UserData().getUserId.toString());
      return  route ;
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor().grey_dark,
      child: SafeArea(
        child: Scaffold(
         // backgroundColor: AppColor().primaryColor,
          body: Container(
              padding: const EdgeInsets.only(top: 50,left: 20,right: 20),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                        children: const [
                          Image(image: AssetImage('assets/logo.png'),
                            height: 100,
                            width: 300,
                            //fit: BoxFit.fill,
                          ),
                        ]
                    ),
                    const SizedBox(height: 40,),
                    Container(
                        child: Container(
                            height: 350,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                    height: 350,
                                    child: Lottie.asset('assets/animated_gif.json'))
                              ],
                            )
                        )
                    ),
                    const SizedBox(height: 40,),
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

                      /* */
                    )

                  ]
              )
          ), // This trailing comma makes auto-formatting nicer for build methods.

        ),
      ),
    );
  }
}
