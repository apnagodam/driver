import 'package:apnagodam_driver/Domain/Dio/DioProvider.dart';
import 'package:apnagodam_driver/Presentation/Utils/Preferences/SharedPrefs/SharedUtility.dart';
import 'package:apnagodam_driver/Presentation/Utils/color_constants.dart';
import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Routes/routes_strings.dart';
import '../../Utils/Widgets/Widgets.dart';

class Profilescreen extends ConsumerStatefulWidget {
  const Profilescreen({super.key});

  @override
  ConsumerState<Profilescreen> createState() => _ProfilescreenState();
}

class _ProfilescreenState extends ConsumerState<Profilescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF9F9F9),
      appBar: AppBar(
        title:  Text(
          "profile".tr(),
          style: const TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: const Color(0xffF9F9F9),
      ),
      body: Padding(
        padding: const Pad(all: 10),
        child: ListView(
          children: [
            const SizedBox(
              height: 10,
            ),
            roundedProfileImage(
                imageUrl:
                    "${ImageClient.assetsImageUrl}${ref.watch(sharedUtilityProvider).getUser()?.aadharImage}"),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                ref.watch(sharedUtilityProvider).getUser()?.name ?? "",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Center(
              child: Text(
                "+91-${ref.watch(sharedUtilityProvider).getUser()?.phone ?? ""}",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                "otherDetails".tr(),
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: Adaptive.sp(18)),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            profileItem(
                ref.watch(sharedUtilityProvider).getUser()?.license ?? "","License"),
            const SizedBox(
              height: 10,
            ),
            profileItem(
                ref.watch(sharedUtilityProvider).getUser()?.address ?? "","Adress"),
            const SizedBox(
              height: 10,
            ),
            profileItem(ref.watch(sharedUtilityProvider).getUser()?.state ?? "","State"),
            const SizedBox(height: 10,),
            InkWell(
                onTap: () async {
                  ref.watch(sharedPreferencesProvider).clear();
                  context.go(RoutesStrings.login);
                },
                child: Center(child: Text(
                  'logout'.tr(),
                  style: TextStyle(
                      fontSize: Adaptive.sp(16),
                      color: Colors.red,
                      fontWeight: FontWeight.w700),
                ),))
          ],
        ),
      ),
    );
  }

  Widget profileItem(String value,String subValue) => Card(
        elevation: 3,
        color: Colors.white,
        shape: RoundedRectangleBorder(
            side: const BorderSide(
              color: ColorConstants.secondaryColorWSP,
            ),
            borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const Pad(all: 19),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                subValue,
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500, fontSize: Adaptive.sp(16)),
              ),
            Text(
              value,
              style: TextStyle(
                  fontWeight: FontWeight.w700, fontSize: Adaptive.sp(16)),
            ),

          ],),
        ),
      );
}
