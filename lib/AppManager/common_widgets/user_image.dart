import 'package:flutter/material.dart';
import '../appColors.dart';

class UserImage extends StatelessWidget {
  const UserImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8),
      child:CircleAvatar(
      radius: 28,
      backgroundColor: AppColor().primaryColor,
    child: CircleAvatar(
    radius: 24,
    backgroundColor: AppColor().white,
    child: const CircleAvatar(
    radius: 21,
          backgroundImage: AssetImage('assets/logodigi1.png'),
        ),
      ),)
    );
  }
}