
import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';


import 'appUtils.dart';


class RawData{




  api(url,Map<String, String> body,context,{
    bool? token,
  })
  async {
    // print('**********************');
    //   print(data);
    //  print("*********************i");
    try{
      //Map<String, String> headerC;
      // var formData = FormData.fromMap(body);
      print('token:  '+user.getUserData.token.toString());

      var response = !(token??   false)?  await Dio().post(baseUrl+url,
        data: body,
        options: Options(
            headers: {
              HttpHeaders.contentTypeHeader: "application/json",
            }
        ),
      ):


      await Dio().post(baseUrl+url,
        data: body,
        options: Options(
            headers: {
              'x-access-token':  user.getUserData.token.toString(),
              'userID':  user.getUserData.id.toString()
            }
        ),
      );
      log(response.toString());
      var data = await jsonDecode(response.toString());
      print(body);
      if(data is List){
        return data[0];
      }
      else{
        return data;
      }

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
            token: token);
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
          token: token,);
        return data;
      }
      else{
        return cancelResponse;
      }
    }
  }


}
