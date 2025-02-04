import 'package:apnagodam_driver/Presentation/Utils/color_constants.dart';
import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:toastification/toastification.dart';

roundedProfileImage(
        {required String imageUrl, double width = 100, double height = 100}) =>
    ClipOval(
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        width: width,
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            border:
                Border.all(color: ColorConstants.primaryColorDriver, width: 5),
            shape: BoxShape.circle,
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
        height: height,
        errorWidget: (context, url, stack) =>
            SvgPicture.asset('assets/placeholder.svg'),
        progressIndicatorBuilder: (context, _, l) => SizedBox(
          child: Center(
            child: CircularProgressIndicator.adaptive(),
          ),
          height: 25,
          width: 25,
        ),
      ),
    );

defaultPadding(Widget child) => Padding(
      padding: Pad(all: 10),
      child: child,
    );

showLoader(BuildContext context) => showDialog(
    context: context,
    builder: (context) => SizedBox(
          height: MediaQuery.of(context).size.height,
          child: const Center(
            child: CupertinoActivityIndicator(),
          ),
        ));

hideLoader(BuildContext context) =>
    Navigator.of(context, rootNavigator: true).pop();
var largeTitleTextStyle = TextStyle(
  fontSize: Adaptive.sp(21),
  fontWeight: FontWeight.w700,
);

var mediumTitleTextStyle = TextStyle(
  fontSize: Adaptive.sp(18),
  fontWeight: FontWeight.w700,
);

var smallTitleTextStyle = TextStyle(
  fontSize: Adaptive.sp(16),
  fontWeight: FontWeight.w700,
);

var defaultButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: ColorConstants.primaryColorDriver,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)));

errorToast(BuildContext context, String text) => toastification.show(
      context: context,
      // optional if you use ToastificationWrapper
      title: Text(text),
      backgroundColor: Colors.red,
      primaryColor: Colors.red,
      style: ToastificationStyle.fillColored,
      autoCloseDuration: const Duration(seconds: 5),
    );

successToast(BuildContext context, String text) => toastification.show(
      context: context,
      // optional if you use ToastificationWrapper
      title: Text(text),
      backgroundColor: Colors.green,
      primaryColor: Colors.green,
      style: ToastificationStyle.fillColored,
      autoCloseDuration: const Duration(seconds: 5),
    );
