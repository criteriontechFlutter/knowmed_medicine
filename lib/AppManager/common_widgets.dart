
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:knowmed/AppManager/UserRepository/user_data.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';

import 'MtTextTheme.dart';
import 'appColors.dart';


class CommonWidgets {
  backButton(context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
      onPressed: () => Navigator.of(context).pop(),
    );
  }

  shimmerEffect({
    required Widget child,
    required bool shimmer,
  }) {
    return (shimmer)
        ? Shimmer.fromColors(
            baseColor: Colors.grey.shade400,
            highlightColor: Colors.white,
            child: child)
        : child;
  }

  imageDialog({img, context}) {
    return Dialog(
      child: SizedBox(
        width: 300,
        height: 300,
        child: CachedNetworkImage(
            fit: BoxFit.fill,
            placeholder: (context, url) => const Center(
                  child: SizedBox(
                    height: 36,
                    child: CircularProgressIndicator(),
                  ),
                ),
            imageUrl: img.toString(),
            errorWidget: (context, url, error) =>
                const Image(image: AssetImage('assets/noProfileImage.png'))),
      ),
    );
  }

  showNoData({
    required bool show,
    bool? showLoader,
    Widget? child,
    Widget? noDataWidget,
    String? title,
    String? loaderTitle,
    Color? color,
  }) {
    return show
        ? Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 60),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      height: 150,
                      child: SvgPicture.asset('assets/noDoctor.svg')),
                  Text(
                    title ?? 'NO Data Found',
                    style: MyTextTheme()
                        .mediumPCB
                        .copyWith(color: color ?? AppColor().primaryColor),
                  ),
                  noDataWidget == null
                      ? Container()
                      : Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: noDataWidget,
                        )
                ],
              ),
            ),
          )
        : (((showLoader ?? false))
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      height: 150,
                      child: SvgPicture.asset('assets/noDoctor.svg')),
                  shimmerEffect(
                    shimmer: true,
                    child: Text(
                      loaderTitle ?? 'Loading Data',
                      style: MyTextTheme()
                          .mediumPCB
                          .copyWith(color: color ?? AppColor().primaryColor),
                    ),
                  ),
                ],
              )
            : child);
  }

  ButtonStyle myButtonStyle = TextButton.styleFrom(
      padding: const EdgeInsets.all(0),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      minimumSize: const Size(0, 0),
      primary: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ));
}

class LocationName extends StatelessWidget {
  final bool? backgroundBlue;

  const LocationName({Key? key, this.backgroundBlue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Icon(
              Icons.location_on,
              size: 18,
              color: (backgroundBlue ?? false)
                  ? AppColor().white
                  : AppColor().primaryColor,
            ),
            Text(
              UserData().getUserLocation.toString().split(',')[0],
              style: (backgroundBlue ?? false)
                  ? MyTextTheme().smallWCN
                  : MyTextTheme().smallPCN,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              UserData().getUserLocation.toString().split(',')[1],
              style: (backgroundBlue ?? false)
                  ? MyTextTheme().smallWCN
                  : MyTextTheme().smallPCN,
            ),
            // Icon(Icons.keyboard_arrow_down,color: (backgroundBlue ?? false)?AppColor.white:AppColor.primaryColor,)
          ],
        )
      ],
    );
  }
}
