

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:knowmed/AppManager/AlertDialogueNew.dart';
import 'package:knowmed/AppManager/appColors.dart';
import 'package:knowmed/AppManager/appUtils.dart';
import 'package:knowmed/Pages/ChangePassword/changePasswordView.dart';
import 'package:knowmed/Pages/Login/login_Modal.dart';
import 'package:knowmed/Pages/Login/login_page_view.dart';
import '../Pages/Dashboard/DashboardView.dart';
import '../Pages/Forgot Password/ResetPassword/reserPassView.dart';
import '../Pages/Profile/profile_page_view.dart';
import '../change_password_view.dart';


class NavigationDrawerWidget extends StatelessWidget {
  final padding=EdgeInsets.symmetric(horizontal: 20);

  @override
  Widget build(BuildContext context) {
    final name='Neha Tiwari';
    final email='neha@gmail.com';
    final urlImage =
        'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80';

    return Drawer(
      child: Material(
        color: AppColor().white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children:<Widget> [

              const SizedBox(height: 10),
              buildMenuItem(
                text:'Dashboard',
                icon: Icons.home,
                onClicked :()=>selectedItem(context,0),
              ),
              const SizedBox(height: 5),
              Divider(color: AppColor().greyLight),
              const SizedBox(height: 5),
              buildMenuItem(
                text:'Profile',
                icon: Icons.person,
                onClicked :()=>selectedItem(context,1),
              ),
              const SizedBox(height: 5),
              Divider(color: AppColor().greyLight),
              const SizedBox(height: 5),
              buildMenuItem(
                text:'Help',
                icon: Icons.help,
                onClicked :()=>selectedItem(context,1),
              ),
              const SizedBox(height: 5),
              Divider(color: AppColor().greyLight),
              const SizedBox(height: 5),
              buildMenuItem(
                text:'Change Password',
                icon: Icons.lock_outline_sharp,
                onClicked :()=>selectedItem(context,3),
              ),
              const SizedBox(height: 5),
              Divider(color: AppColor().greyLight),
              const SizedBox(height: 5),

              buildMenuItem(
                text:'Logout',
                icon: Icons.logout,
                onClicked :()=>selectedItem(context,4),
              ),
              const SizedBox(height: 5),
              Divider(color: AppColor().greyLight),
              const SizedBox(height: 5),

            ],
          ),
        ),
      ),
    );
  }

 Widget buildMenuItem({
   required String text,
   required IconData icon,
   VoidCallback? onClicked,
  }) {

    final color = Colors.black;
    final hoverColor = AppColor().greyLight;
    return ListTile(
      leading: Icon(icon,color: color,),
      title: Text(text,style: TextStyle(
        color: color
      ),),
      hoverColor: hoverColor,
      onTap: onClicked,
    );

  }

  selectedItem(BuildContext context, int i) {

    Navigator.of(context).pop();

    switch(i){
      case 0 :
        Navigator.of(context).push(MaterialPageRoute(builder:
        (context)=>DashboardView(),
        ));
        break;
      case 1 :
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context)=>ProfilePageViewNew(),
        ));
        break;
      case 2 :
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context)=>const ProfilePageViewNew(),
        ));
        break;
      case 3 :
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context)=>ChangePassView(),
        ));
        break;
      case 4 :
         AlertDialogueNew().show(context, 'Alert  !!!', 'Do you want to Logout?',
              showCancelButton: true,
              firstButtonName: 'LogOut',
              showOkButton: false,
              
              firstButtonPressEvent:() async {
              LoginModal().userLogout(context);

              }


        );
    }
  }

  Widget buildHeader({
    required String urlImage,
    required String name,
    required String email,
    required VoidCallback onClicked,
  }) =>
      InkWell(
        onTap: onClicked,
        child: Container(
          padding: padding.add(EdgeInsets.symmetric(vertical: 40)),
          child: Row(
            children: [
              CircleAvatar(radius: 30, backgroundImage: NetworkImage(urlImage)),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    email,
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      );


    onPressedLogOut()async{
      await user.removeUserData();
  }
}

