

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:knowmed/AppManager/AlertDialogue.dart';
import 'package:knowmed/AppManager/UserRepository/user_data.dart';

import '../Pages/Login/login_page_view.dart';


// String baseUrl='http://182.156.200.179:711/API/';
 String baseU='http://182.156.200.179:711/';
String baseUrl='http://182.156.200.179:332/api/v1.0/';


// String baseUrl='http://192.168.7.13:168/API/';

String secretMapKey='AIzaSyB0AW2vBqSKJPqegh75EhUUxPljXPhaxqU';


UserData user=UserData();

var cancelResponse={'status': 0, 'message': 'Try Again...'};

class App
{
  api(url,body,context,{
  token,
    bool useOnlyBase=false
  })
  async {
    try{
      print(baseUrl+url);
      print(body.toString());
   if(token=true){
     print( user.getUserData.token.toString());
   }

      var response = (token?? false)?    await http.post(
          Uri.parse((useOnlyBase? baseU:baseUrl)+url),
          headers: {
            'accessToken':  user.getUserData.token.toString()
          },
          body: body
      ):await http.post(
          Uri.parse(baseUrl+url),
          body: body
      );

   print(response.body);
      var data = json.decode(response.body);

      if(data is String){
        if(data=='You are logged out, please login again !!'){
          Navigator.popUntil(context, ModalRoute.withName('/DashboardView'));
          await user.removeUserData();
         // await user.removeUserToken();
          replaceNavigate(context, LoginPageView());
          AlertDialogue().show(context, 'Alert', data);

        }
        else{
          var newData={
            'status': 0,
            'message': data,
          };
          print(newData.toString());
          return newData;
        }

       // return newData;
      }
      else{
        print(data.toString());
        if(data['status']==0 && data['message']=='Invalid Token'){
            Navigator.popUntil(context, ModalRoute.withName('/DashboardView'));
            await user.removeUserData();
         //   await user.removeUserToken();
            replaceNavigate(context, LoginPageView());
            alertToast(context, data['message']);
        }
        else{
          return data;
        }



      }

      // if(data is List){
      //   return data[0];
      // }
      // else{
      //   return data;
      // }

    }
    on SocketException {
      print('No Internet connection');
      var retry=await apiDialogue(context, 'Alert  !!!', 'Internet connection issue, try to reconnect.',
      );
      if(retry){
        var data= await api(url,body,context,
            token: token);
        return data;
      }
      else{
        return cancelResponse;
      }

    }
    on TimeoutException catch (e) {
      print('Time Out '+e.toString());
      var retry=await apiDialogue(context, 'Alert  !!!', 'Time Out, plz check your connection.',
      );
      if(retry){
        var data= await api(url,body,context,
            token: token,);
        return data;
      }
      else{
        return cancelResponse;
      }
    }
    catch (e) {
      print('Error in Api: $e');
      var retry=await apiDialogue(context, 'Alert  !!!', 'Some Error Occur, plz check your connection.',
      );
      if(retry){
        var data= await api(url,body,context,
            token: token);
        return data;
      }
      else{
        return cancelResponse;
      }
    }
  }



  navigate(context,route) async{
    var data=await Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)
    {
      return route;
    }));
    return data;
  }

  replaceNavigate(context,route,{
    String? routeName
  }) async{
    var data=await Navigator.pushReplacement(context, MaterialPageRoute(
        settings: routeName!=null? RouteSettings(name: routeName): null,
        builder: (BuildContext context)
    {
      return route;
    }));
    return data;
  }








// tabletOrAndroidView(widget)
// {
//   return Row(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: [
//       isTablet?
//       SizedBox(
//         width: 600,
//         child:   widget,)
//           :
//       Expanded(
//         child:   widget,
//       ),
//     ],
//   );
// }
//
//
// tabletOrAndroidViewHeight(h)
// {
//   return isTablet? (h+(h/3)).toDouble():h.toDouble();
// }
//
// tabletOrAndroidViewTextSize(s)
// {
//   return  isTablet? (s*2).toDouble():s.toDouble();
// }




}


apiDialogue(context,alert,msg){
  var canPressOk=true;
  var retry=false;
  return showGeneralDialog(
      barrierColor: Colors.black.withOpacity(0.5),
      transitionBuilder: (context, a1, a2, widget) {
        return StatefulBuilder(
            builder: (context,setState)
            {
              return Transform.scale(
                scale: a1.value,
                child: Opacity(
                  opacity: a1.value,
                  child: WillPopScope(
                    onWillPop: (){
                      return Future.value(false);
                    },
                    child: Scaffold(
                      backgroundColor: Colors.transparent,
                      body: Container(
                        height: double.infinity,
                        width: double.infinity,
                        alignment: Alignment.bottomCenter,
                        child: ListView(
                          shrinkWrap: true,
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(Radius.circular(0)),
                                    border: Border.all(
                                        color: Colors.red,
                                        width: 2
                                    )
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(msg.toString(),
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold
                                                ),),
                                            ),
                                            TextButton(
                                              style: TextButton.styleFrom(
                                                primary: Colors.black,
                                                padding: EdgeInsets.all(8),
                                              ),
                                              onPressed: () {
                                                if(canPressOk)
                                                {
                                                  canPressOk=false;
                                                  Navigator.pop(context);
                                                  retry=false;
                                                }
                                              },
                                              child: Text(
                                                'Cancel',
                                                style: TextStyle(color: Colors.red,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                            ),

                                            TextButton(
                                              style: TextButton.styleFrom(
                                                primary: Colors.black,
                                                padding: EdgeInsets.all(8),
                                              ),
                                              onPressed: () {
                                                if(canPressOk)
                                                {
                                                  canPressOk=false;
                                                  Navigator.pop(context);
                                                  retry=true;
                                                }
                                              },
                                              child: Text(
                                                'Retry',
                                                style: TextStyle(color: Colors.red,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            });
      },
      transitionDuration: Duration(milliseconds: 200),
      barrierDismissible: true,
      barrierLabel: '',
      context: context,
      pageBuilder: (context, animation1, animation2) {
        return Container();
      }).then((val){
    canPressOk=false;
    return retry;
  });
}


















class DioData {


  multipart(String filePath) async{
    print(filePath);
    return  await MultipartFile.fromFile(filePath);
  }


  Dio dio= new  Dio();


  api(url,body,context) async{
    var formData = FormData.fromMap(body);
    try {
      var response = await dio.post((baseU+url),
          data: formData,
      );
      print('yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'+response.toString());
    } catch (e) {
      print(e);
    }

  }
}





class MultiPart {

  multipart(String filePath) async{
    print(filePath);
    return  await MultipartFile.fromFile(filePath);
  }


  api(url,Map<String, String> body,context,{
    imagePath
  })
  async {
    // dio.options.contentType= Headers.formUrlEncodedContentType;
    try{
      print(baseU+url);
      print(body.toString());
      print( user.getUserData.token.toString());
      print(imagePath.toString());
      // var formData = FormData.fromMap(body);
      // var response = await Dio().post(baseUrl+url,
      //   data: formData,
      //   options: (token?? false)? Options(
      //       headers: {
      //         'accessToken': user.getUserToken,
      //       }):null,
      // );


      // var headers = {
      //   'accessToken': user.getUserToken
      // };

      var request = http.MultipartRequest('POST', Uri.parse(baseU+url));
      request.fields.addAll(body);
      request.files.add(await http.MultipartFile.fromPath('fileName', imagePath));

     // request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      print(response.statusCode.toString());

      // if (response.statusCode == 200) {
      //   print(await response.stream.bytesToString());
      // }
      // else {
      //   print(response.reasonPhrase);
      // }
      var data=jsonDecode(await response.stream.bytesToString());

      print(data.toString());
      return  data;


    }
    on SocketException {
      print('No Internet connection');
      var retry=await apiDialogue(context, 'Alert  !!!', 'Internet connection issue, try to reconnect.',
      );
      if(retry){
        var data= await api(url,body,context,
          imagePath: imagePath,
        );
        return data;
      }
      else{
        return cancelResponse;
      }
      // return res;
    }
    on TimeoutException catch (e) {
      print('Time Out '+e.toString());
      var retry=await apiDialogue(context, 'Alert  !!!', 'Time Out, plz check your connection.',
      );
      if(retry){
        var data= await api(url,body,context,
          imagePath: imagePath,);
        return data;
      }
      else{
        return cancelResponse;
      }
    }
    catch (e) {
      print('Error in Api: $e');
      var retry=await apiDialogue(context, 'Alert  !!!', 'Some Error Occur, plz check your connection.',
      );
      if(retry){
        var data= await api(url,body,context,
          imagePath: imagePath,);
        return data;
      }
      else{
        return cancelResponse;
      }
    }

  }


}