import 'package:apnagodam_driver/Presentation/Utils/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:go_router/go_router.dart';

class OnBordingScreen extends StatelessWidget {
  const OnBordingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: OnBoardingSlider(
          finishButtonStyle: FinishButtonStyle(
            backgroundColor: ColorConstants.secondaryColorWSP,
          ),
          finishButtonText: 'लॉगिन',
          onFinish: () => context.go('/login'),
          skipTextButton: Text(
            'छोड़ना',
            style: TextStyle(
              fontSize: 16,
              color: ColorConstants.secondaryColorWSP,
              fontWeight: FontWeight.w600,
            ),
          ),
          trailing: Text(
            'रजिस्टर',
            style: TextStyle(
              fontSize: 16,
              color: ColorConstants.secondaryColorWSP,
              fontWeight: FontWeight.w600,
            ),
          ),
          trailingFunction: () {},
          controllerColor: ColorConstants.secondaryColorWSP,
          totalPage: 1,
          headerBackgroundColor: Colors.white,
          pageBackgroundColor: Colors.white,
          background: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 2,
              child: Image.asset(
                'assets/gif-unscreen.gif',
                alignment: Alignment.center,
                color: ColorConstants.primaryColorDriver,
              ),
            ),
            // SizedBox(
            //   height: MediaQuery.of(context).size.height / 2,
            //   child: Image.asset(
            //     'assets/wherhouse.jpg',
            //     alignment: Alignment.center,
            //   ),
            // ),
            // SizedBox(
            //   height: MediaQuery.of(context).size.height / 2,
            //   child: Align(
            //     child: SvgPicture.asset(
            //       'assets/logo.svg',
            //       alignment: Alignment.center,
            //     ),
            //   ),
            // ),
          ],
          speed: 1.2,
          pageBodies: [
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 2,
                  ),
                  Row(
                    children: [
                      Expanded(child: Divider()),
                      Text(
                        '  स्वागत है!  ',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: ColorConstants.primaryColorDriver,
                          fontSize: 24.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Expanded(child: Divider()),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'इस ऐप के माध्यम से आपका सफर अब और भी आसान और सुरक्षित होगा।',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            // Container(
            //   alignment: Alignment.center,
            //   width: MediaQuery.of(context).size.width,
            //   padding: EdgeInsets.symmetric(horizontal: 40),
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.start,
            //     crossAxisAlignment: CrossAxisAlignment.center,
            //     children: [
            //       SizedBox(
            //         height: MediaQuery.of(context).size.height / 2,
            //       ),
            //       Text(
            //         'ग्राहकों सेवा',
            //         textAlign: TextAlign.center,
            //         style: TextStyle(
            //           color: Colors.green,
            //           fontSize: 24.0,
            //           fontWeight: FontWeight.w600,
            //         ),
            //       ),
            //       SizedBox(
            //         height: 20,
            //       ),
            //       Text(
            //         'आपकी मेहनत के कारण ही हम अपने ग्राहकों को उत्कृष्ट सेवा दे पाते हैं।',
            //         textAlign: TextAlign.center,
            //         style: TextStyle(
            //           color: Colors.black,
            //           fontSize: 18.0,
            //           fontWeight: FontWeight.w600,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // Container(
            //   alignment: Alignment.center,
            //   width: MediaQuery.of(context).size.width,
            //   padding: EdgeInsets.symmetric(horizontal: 40),
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.start,
            //     crossAxisAlignment: CrossAxisAlignment.center,
            //     children: <Widget>[
            //       SizedBox(
            //         height: MediaQuery.of(context).size.height / 2,
            //       ),
            //       Text(
            //         'शुरू करें!',
            //         textAlign: TextAlign.center,
            //         style: TextStyle(
            //           color: Colors.green,
            //           fontSize: 24.0,
            //           fontWeight: FontWeight.w600,
            //         ),
            //       ),
            //       SizedBox(
            //         height: 20,
            //       ),
            //       Text(
            //         'आपकी मेहनत के साथ, हमारा ऐप आपको और भी बेहतर सेवा देने के लिए तैयार है।',
            //         textAlign: TextAlign.center,
            //         style: TextStyle(
            //           color: Colors.black,
            //           fontSize: 18.0,
            //           fontWeight: FontWeight.w600,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ));
  }
}
