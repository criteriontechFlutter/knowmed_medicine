
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:knowmed/AppManager/UserRepository/user.dart';
// import 'package:his/Modal/assigned_head.dart';



class UserData extends GetxController {
  final userData = GetStorage('user');



  String get getUserLocation => (userData.read('location')) ?? 'Unknown,Location';
  User get getUserData => User.fromJson(userData.read('userData') ?? {});


  addUserData(Map val) async {
    await userData.write('userData', val);
    update();
  }



  addLocation(String val) async {
    await userData.write('location', val);
    update();
  }

  removeUserData() async{
    await userData.remove('userData');
  }



}




