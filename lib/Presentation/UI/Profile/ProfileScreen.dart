import 'package:apnagodam_driver/Domain/Dio/DioProvider.dart';
import 'package:apnagodam_driver/Presentation/Utils/Preferences/SharedPrefs/SharedUtility.dart';
import 'package:apnagodam_driver/Presentation/Utils/color_constants.dart';
import 'package:apnagodam_driver/Presentation/Utils/height_w.dart';
import 'package:apnagodam_driver/Presentation/Utils/style_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Profilescreen extends ConsumerStatefulWidget {
  const Profilescreen({super.key});

  @override
  ConsumerState<Profilescreen> createState() => _ProfilescreenState();
}

class _ProfilescreenState extends ConsumerState<Profilescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'ड्राइवर प्रोफ़ाइल',
            style: TextStyle(
                color: ColorConstants.primaryColor,
                fontWeight: FontWeight.w600),
          ),
          foregroundColor: ColorConstants.primaryColor,
          backgroundColor: ColorConstants.secondaryColorWSP,
        ),
        // appBar: AppBar(
        //   title: const Text("Profile"),
        // ),
        body: SingleChildScrollView(
            child: Column(children: [
          Stack(children: [
            Image.asset(
              'assets/ProfileBackground.png',
              fit: BoxFit.fill,
              color: ColorConstants.secondaryColorWSP,
              width: MediaQuery.of(context).size.height,
              height: MediaQuery.of(context).size.height / 1.5,
            ),
            Stack(
              children: [
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    margin: EdgeInsets.only(left: 10, right: 10, top: 70),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: ColorConstants.primaryColor),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Height60,
                          Text(
                            'प्रथम नाम और अंतिम नाम*',
                            style: StyleConstants.googlestyle(),
                          ),
                          Height10,
                          TextFormField(
                            readOnly: true,
                            decoration: InputDecoration(
                                hintText:
                                    '${ref.watch(sharedUtilityProvider).getUser()?.name ?? ""}',
                                hintStyle:
                                    StyleConstants.googlestyletextfeild(),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                          Height10,
                          Text('मोबाइल नंबर*',
                              style: StyleConstants.googlestyle()),
                          Height10,
                          TextFormField(
                            readOnly: true,
                            decoration: InputDecoration(
                                hintText:
                                    ' ${ref.watch(sharedUtilityProvider).getUser()?.phone ?? ""}',
                                hintStyle:
                                    StyleConstants.googlestyletextfeild(),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                          Height10,
                          Text(
                            'पैन कार्ड नंबर*',
                            style: StyleConstants.googlestyle(),
                          ),
                          Height10,
                          TextFormField(
                            readOnly: true,
                            decoration: InputDecoration(
                                hintText:
                                    ' ${ref.watch(sharedUtilityProvider).getUser()?.pancardNo ?? ""}',
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                          Height10,
                          Text(
                            'आधार कार्ड नंबर.*',
                            style: StyleConstants.googlestyle(),
                          ),
                          Height10,
                          TextFormField(
                            readOnly: true,
                            decoration: InputDecoration(
                                hintText:
                                    ' ${ref.watch(sharedUtilityProvider).getUser()?.aadharNo ?? ""}',
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                          Height10,
                          Text(
                            'पता*',
                            style: StyleConstants.googlestyle(),
                          ),
                          Height10,
                          TextFormField(
                            maxLines: 5,
                            readOnly: true,
                            decoration: InputDecoration(
                                hintText:
                                    ' ${ref.watch(sharedUtilityProvider).getUser()?.address ?? ""}',
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                          Height10,
                          Row(
                            children: [
                              Expanded(
                                  child: Text(
                                'राज्य का नाम*',
                                style: StyleConstants.googlestyle(),
                              )),
                              Expanded(
                                  child: Text(
                                '   शहर का नाम*',
                                style: StyleConstants.googlestyle(),
                              )),
                            ],
                          ),
                          Height10,
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  readOnly: true,
                                  decoration: InputDecoration(
                                      hintText:
                                          ' ${ref.watch(sharedUtilityProvider).getUser()?.state ?? ""}',
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      disabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                ),
                              ),
                              width20,
                              Expanded(
                                child: TextFormField(
                                  readOnly: true,
                                  decoration: InputDecoration(
                                      hintText:
                                          ' ${ref.watch(sharedUtilityProvider).getUser()?.city ?? ""}',
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      disabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                ),
                              ),
                            ],
                          ),
                          Height10,
                          Text(
                            'बैंक का नाम*',
                            style: StyleConstants.googlestyle(),
                          ),
                          Height10,
                          TextFormField(
                            readOnly: true,
                            decoration: InputDecoration(
                                hintText:
                                    ' ${ref.watch(sharedUtilityProvider).getUser()?.bankName ?? ""}',
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                          Height10,
                          Text(
                            'बैंक शाखा का पता*',
                            style: StyleConstants.googlestyle(),
                          ),
                          Height10,
                          TextFormField(
                            readOnly: true,
                            decoration: InputDecoration(
                                hintText:
                                    ' ${ref.watch(sharedUtilityProvider).getUser()?.bankBranch ?? ""}',
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                          Height10,
                          Text(
                            'बैंक खाता संख्या*',
                            style: StyleConstants.googlestyle(),
                          ),
                          Height10,
                          TextFormField(
                            readOnly: true,
                            decoration: InputDecoration(
                                hintText:
                                    ' ${ref.watch(sharedUtilityProvider).getUser()?.accountNo ?? ""}',
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                          Height10,
                          Text(
                            'बैंक IFSC कोड*',
                            style: StyleConstants.googlestyle(),
                          ),
                          Height10,
                          TextFormField(
                            readOnly: true,
                            decoration: InputDecoration(
                                hintText:
                                    '${ref.watch(sharedUtilityProvider).getUser()?.ifscCode ?? ""}',
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                        ])),
                Positioned(
                  right: 0,
                  left: 0,
                  top: 0,
                  child: Container(
                    height: 130,
                    width: 130,
                    child: Image.network(
                      "${ImageClient.assetsImageUrl}/${ref.watch(sharedUtilityProvider).getUser()?.aadharImage}",
                      errorBuilder: (context, error, stackTrace) {
                        return CircleAvatar(
                          backgroundColor: ColorConstants.primaryColor,
                          child: Center(
                              child: Icon(
                            Icons.person,
                            size: 50,
                          )),
                        );
                      },
                    ),
                    // child: CircleAvatar(
                    //   radius: Adaptive.sh(10),
                    //   backgroundImage: NetworkImage(
                    //     "${ImageClient.assetsImageUrl}/${ref.watch(sharedUtilityProvider).getUser()?.aadharImage}",
                    //     scale: 0.5,
                    //   ),
                    //   child: Builder(
                    //     builder: (context) {
                    //       return Image.network(
                    //         "${ImageClient.assetsImageUrl}/${ref.watch(sharedUtilityProvider).getUser()?.aadharImage}",
                    //         fit: BoxFit.cover,
                    //         loadingBuilder: (context, child, loadingProgress) {
                    //           if (loadingProgress == null) {
                    //             return child;
                    //           } else {
                    //             return CircularProgressIndicator();
                    //           }
                    //         },
                    //         errorBuilder: (context, error, stackTrace) {
                    // return Center(
                    //     child: Icon(
                    //   Icons.person,
                    //   size: 50,
                    // ));
                    //         },
                    //       );
                    //     },
                    //   ),
                    // ),
                    // child: Center(
                    //   child: ref
                    //               .watch(sharedUtilityProvider)
                    //               .getUser()
                    //               ?.aadharImage !=
                    //           null
                    //       ? CircleAvatar(
                    //           foregroundImage: NetworkImage(
                    //               "${ImageClient.assetsImageUrl}/${ref.watch(sharedUtilityProvider).getUser()?.aadharImage}",
                    //               scale: 0.5),
                    //           radius: Adaptive.sh(10),
                    //         )
                    //       : Image.asset('assets/logo.png'),
                    // ),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: ColorConstants.secondaryColorWSP, width: 7),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            )
          ])
        ])));
  }
}
