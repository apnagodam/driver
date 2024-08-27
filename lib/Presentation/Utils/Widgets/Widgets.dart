import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


defaultPadding(Widget child) => Padding(
      padding: Pad(all: 10),
      child: child,
    );

showLoader(BuildContext context) => SizedBox(
      height: MediaQuery.of(context).size.height,
      child: const Center(
        child: CupertinoActivityIndicator(),
      ),
    );

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
    backgroundColor: Colors.primaries.first,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)));
