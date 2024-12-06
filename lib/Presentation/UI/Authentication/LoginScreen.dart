import 'package:apnagodam_driver/Domain/Authentication/AuthenticationService.dart';
import 'package:apnagodam_driver/Presentation/Utils/Widgets/Widgets.dart';
import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Routes/routes_strings.dart';
import '../../Utils/color_constants.dart';

class Loginscreen extends ConsumerStatefulWidget {
  const Loginscreen({super.key});

  @override
  ConsumerState<Loginscreen> createState() => _LoginscreenState();
}

final loginForm = GlobalKey<FormState>();
TextEditingController mobileNumberController = TextEditingController();
var isLoading = StateProvider((ref) => false);

class _LoginscreenState extends ConsumerState<Loginscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: defaultPadding(Form(
              key: loginForm,
              child: Center(
                child: ColumnSuper(
                  alignment: Alignment.center,
                  children: [
                    Image.asset('assets/logo.png'),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'driverLogin',
                        style: largeTitleTextStyle,
                      ).tr(),
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    TextFormField(
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.length != 10) {
                          return "enterMobileNumber".tr();
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      controller: mobileNumberController,
                      maxLength: 10,
                      textCapitalization: TextCapitalization.characters,
                      decoration: InputDecoration(
                          hintText: "enterMobileNumber".tr(),
                          label:  Text("enterMobileNumber".tr()),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    //showLoader(context)
                    const SizedBox(
                      height: 10,
                    ),
                    ref.watch(isLoading)
                        ? showLoader(context)
                        : SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: ElevatedButton(
                              onPressed: () {
                                if (loginForm.currentState!.validate()) {
                                  showLoader(context);
                                  ref
                                      .watch(sendOtpProvider(
                                              number: mobileNumberController
                                                  .text
                                                  .toString())
                                          .future)
                                      .then((value) {
                                    hideLoader(context);
                                    if (value['status'].toString() == "1") {
                                      context.goNamed(RoutesStrings.verifyOtp,
                                          extra: {
                                            'mobile': mobileNumberController
                                                .text
                                                .toString()
                                          });
                                      successToast(
                                          context, value['message'].toString());
                                    } else {
                                      errorToast(
                                          context, value['message'].toString());
                                    }
                                  }).onError((e, s) {
                                    hideLoader(context);

                                    errorToast(context, e.toString());
                                  });
                                } else {}
                              },
                              child: Text(
                                "login",
                                style: TextStyle(
                                    color: Colors.white,
                                    shadows: [
                                      const Shadow(
                                          color: Colors.white, blurRadius: 0.3)
                                    ],
                                    fontWeight: FontWeight.w700,
                                    fontSize: Adaptive.sp(16)),
                              ).tr(),
                              style: defaultButtonStyle,
                            ),
                          ),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Text.rich(
                        TextSpan(
                            text: 'doNotHaveAnAccount'.tr(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                            children: [
                              TextSpan(
                                text: "register".tr(),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () =>
                                      context.goNamed(RoutesStrings.register),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: ColorConstants.primaryColorDriver,
                                    decoration: TextDecoration.underline),
                              ),
                            ]),
                      ),
                    )
                  ],
                ),
              )))),
    );
  }
}
