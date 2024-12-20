import 'dart:convert';
import 'dart:io';

import 'package:apnagodam_driver/Domain/Authentication/AuthenticationService.dart';
import 'package:apnagodam_driver/Presentation/Routes/routes.dart';
import 'package:apnagodam_driver/Presentation/Routes/routes_strings.dart';
import 'package:apnagodam_driver/Presentation/Utils/Widgets/Widgets.dart';
import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../Data/Model/DistrictsResponseModel.dart';
import '../../../Data/Model/StatesResponseModel.dart';
import '../../Utils/color_constants.dart';
import '../../Utils/style_constants.dart';

class Registrationscreen extends ConsumerStatefulWidget {
  const Registrationscreen({super.key});

  @override
  ConsumerState<Registrationscreen> createState() => _RegistrationscreenState();
}

final formKey = GlobalKey<FormState>();

class _RegistrationscreenState extends ConsumerState<Registrationscreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  TextEditingController bankBranchController = TextEditingController();
  TextEditingController mobileNumberController3 = TextEditingController();

  var statesProvider = StateProvider<Datum?>((ref) => null);

  var districtProvider = StateProvider<StateDatum?>((ref) => null);
  ImagePicker imagePicker = ImagePicker();

  TextEditingController driverNameController = TextEditingController();
  TextEditingController driverPhoneController = TextEditingController();
  TextEditingController driverEmailController = TextEditingController();
  TextEditingController driverLicenseController = TextEditingController();
  TextEditingController driverCityController = TextEditingController();
  TextEditingController driverStateController = TextEditingController();
  TextEditingController driverPincodeController = TextEditingController();
  TextEditingController driverBankNameController = TextEditingController();
  TextEditingController driverBankAccountNoController = TextEditingController();
  TextEditingController driverBankIFSCController = TextEditingController();
  TextEditingController driverPanCardNoController = TextEditingController();
  TextEditingController driverAadharNoController = TextEditingController();
  TextEditingController driverAddressController = TextEditingController();

  var stateProvider = StateProvider<String?>((ref) => null);

  var licenseImage = StateProvider<File?>((ref) => null);
  var panImage = StateProvider<File?>((ref) => null);
  var aadharImage = StateProvider<File?>((ref) => null);
  var aadharBackImage = StateProvider<File?>((ref) => null);

  var chequeImage = StateProvider<File?>((ref) => null);
  var profileImage = StateProvider<File?>((ref) => null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: defaultPadding(Form(
              key: formKey,
              child: SingleChildScrollView(
                child: driverFormLayout(context, ref),
              )))),
    );
  }

  driverFormLayout(BuildContext context, WidgetRef ref) => Column(children: [
        Image.asset(
          'assets/logo.png',
          height: Adaptive.sh(25),
          width: Adaptive.sw(35),
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            'driverRegistration'.tr(),
            style: largeTitleTextStyle,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        TextFormField(
          controller: driverNameController,
          textInputAction: TextInputAction.next,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "validName".tr();
            }
            return null;
          },
          decoration: InputDecoration(
              label: Text("driverName").tr(),
              hintText: "driverName".tr(),
              border: OutlineInputBorder()),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: driverPhoneController,
          textInputAction: TextInputAction.next,
          maxLength: 10,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'validPhone'.tr();
            }
            if (value.length != 10) {
              return "tenDigitNo".tr();
            }
            return null;
          },
          decoration: InputDecoration(
              label: Text("driverPhone").tr(),
              hintText: "driverPhone".tr(),
              border: OutlineInputBorder()),
        ),
        const SizedBox(
          height: 10,
        ),
        // TextFormField(
        //   controller: driverEmailController,
        //   validator: (value) {
        //     if (value == null || value.isEmpty) {
        //       return 'Please input valid email';
        //     }
        //
        //     return null;
        //   },
        //   textInputAction: TextInputAction.next,
        //   decoration: const InputDecoration(
        //       label: Text("Driver Email"),
        //       hintText: "Driver Email",
        //       border: OutlineInputBorder()),
        // ),
        // const SizedBox(
        //   height: 10,
        // ),
        // TextFormField(
        //   controller: driverLicenseController,
        //   textInputAction: TextInputAction.next,
        //   validator: (value) {
        //     if (value == null || value.isEmpty) {
        //       return 'Please input valid license';
        //     }
        //
        //     return null;
        //   },
        //   decoration: const InputDecoration(
        //       label: Text("Driver License number"),
        //       hintText: "Driver License number",
        //       border: OutlineInputBorder()),
        // ),
        // const SizedBox(
        //   height: 10,
        // ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: InkWell(
            onTap: () async {
              await imagePicker
                  .pickImage(source: ImageSource.gallery, imageQuality: 30)
                  .then((value) async {
                if (value != null) {
                  ref.watch(licenseImage.notifier).state = File(value.path);
                }
              });
            },
            child: DottedBorder(
                borderType: BorderType.RRect,
                dashPattern: const [5, 5, 5, 5],
                color: ColorConstants.primaryColorDriver,
                child: Padding(
                  padding: const Pad(all: 20),
                  child: Center(
                    child: ref.watch(licenseImage) != null
                        ? Stack(
                            children: [
                              Image.file(
                                  ref.watch(licenseImage) ?? File('path')),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.6),
                                    shape: BoxShape.circle),
                                child: IconButton(
                                    onPressed: () {
                                      ref.invalidate(licenseImage);
                                    },
                                    icon: const Icon(
                                      Icons.close,
                                      color: Colors.white,
                                    )),
                              )
                            ],
                          )
                        : ColumnSuper(children: [
                            Icon(
                              LucideIcons.cloud_upload,
                              color: ColorConstants.primaryColorDriver,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "selectLicenseImage".tr(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: ColorConstants.primaryColorDriver,
                                  fontWeight: FontWeight.bold,
                                  fontSize: Adaptive.sp(16)),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "uploadDocumentImage".tr(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: ColorConstants.primaryColorDriver,
                                  fontWeight: FontWeight.w700,
                                  fontSize: Adaptive.sp(13)),
                            )
                          ]),
                  ),
                )),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        // ref.watch(stateListProvider).when(
        //     data: (states) => DropdownSearch<Datum?>(
        //           popupProps: PopupProps.menu(
        //               searchFieldProps: const TextFieldProps(
        //                   autofocus: true,
        //                   cursorColor: ColorConstants.primaryColorDriver,
        //                   padding: Pad(left: 10, right: 10),
        //                   decoration: InputDecoration(
        //                     contentPadding: Pad(left: 10, right: 10),
        //                     focusedErrorBorder: OutlineInputBorder(
        //                         borderSide: BorderSide(
        //                             style: BorderStyle.solid,
        //                             color: ColorConstants.primaryColorDriver)),
        //                     disabledBorder: OutlineInputBorder(
        //                         borderSide: BorderSide(
        //                             style: BorderStyle.solid,
        //                             color: ColorConstants.primaryColorDriver)),
        //                     errorBorder: OutlineInputBorder(
        //                         borderSide: BorderSide(
        //                             style: BorderStyle.solid,
        //                             color: ColorConstants.primaryColorDriver)),
        //                     focusedBorder: OutlineInputBorder(
        //                         borderSide: BorderSide(
        //                             style: BorderStyle.solid,
        //                             color: ColorConstants.primaryColorDriver)),
        //                     border: OutlineInputBorder(
        //                         borderSide: BorderSide(
        //                             style: BorderStyle.solid,
        //                             color: ColorConstants.primaryColorDriver)),
        //                     enabledBorder: OutlineInputBorder(
        //                         borderSide: BorderSide(
        //                             style: BorderStyle.solid,
        //                             color: ColorConstants.primaryColorDriver)),
        //                   )),
        //               menuProps: MenuProps(
        //                   shape: RoundedRectangleBorder(
        //                       side: const BorderSide(
        //                           color: ColorConstants.primaryColorDriver),
        //                       borderRadius: BorderRadius.circular(8))),
        //               itemBuilder: (context, terminal, isVisible) =>
        //                   ColumnSuper(
        //                       alignment: Alignment.centerLeft,
        //                       children: [
        //                         Padding(
        //                           padding: const Pad(all: 10),
        //                           child: Text(
        //                             "${terminal?.name}",
        //                             style: TextStyle(
        //                                 fontWeight: FontWeight.bold,
        //                                 fontSize: Adaptive.sp(16)),
        //                           ),
        //                         ),
        //                         Container(
        //                           height: 1,
        //                           color: Colors.grey.withOpacity(0.3),
        //                         ),
        //                       ]),
        //               isFilterOnline: true,
        //               title: Padding(
        //                 padding: const Pad(all: 10),
        //                 child: Text(
        //                   'Select State',
        //                   textAlign: TextAlign.center,
        //                   style: TextStyle(
        //                       fontSize: Adaptive.sp(16),
        //                       fontWeight: FontWeight.bold),
        //                 ),
        //               ),
        //               showSearchBox: true,
        //               searchDelay: const Duration(microseconds: 500)),
        //           filterFn: (user, filter) =>
        //               user?.stateFilterByName(filter) ?? false,
        //           // asyncItems: (String filter) => getData(filter),
        //
        //           items: states.data ?? [],
        //           itemAsString: (Datum? u) => u?.name ?? "",
        //           onChanged: (Datum? data) =>
        //               ref.watch(statesProvider.notifier).state = data,
        //           dropdownDecoratorProps: const DropDownDecoratorProps(
        //             dropdownSearchDecoration: InputDecoration(
        //                 contentPadding: Pad(left: 10, bottom: 5, top: 5),
        //                 hintText: "Select State",
        //                 border: OutlineInputBorder(
        //                     borderRadius: BorderRadius.all(Radius.circular(8)),
        //                     borderSide: BorderSide(
        //                         color: ColorConstants.primaryColorDriver))),
        //           ),
        //         ),
        //     error: (e, s) => Container(),
        //     loading: () => const CupertinoActivityIndicator()),
        // const SizedBox(
        //   height: 10,
        // ),
        // ref.watch(statesProvider) == null
        //     ? const SizedBox()
        //     : ref
        //         .watch(districtListProvider(
        //             code: "${ref.watch(statesProvider)?.code}"))
        //         .when(
        //             data: (states) => DropdownSearch<StateDatum?>(
        //                   popupProps: PopupProps.menu(
        //                       searchFieldProps: const TextFieldProps(
        //                           autofocus: true,
        //                           cursorColor:
        //                               ColorConstants.primaryColorDriver,
        //                           padding: Pad(left: 10, right: 10),
        //                           decoration: InputDecoration(
        //                             contentPadding: Pad(left: 10, right: 10),
        //                             focusedErrorBorder: OutlineInputBorder(
        //                                 borderSide: BorderSide(
        //                                     style: BorderStyle.solid,
        //                                     color: ColorConstants
        //                                         .primaryColorDriver)),
        //                             disabledBorder: OutlineInputBorder(
        //                                 borderSide: BorderSide(
        //                                     style: BorderStyle.solid,
        //                                     color: ColorConstants
        //                                         .primaryColorDriver)),
        //                             errorBorder: OutlineInputBorder(
        //                                 borderSide: BorderSide(
        //                                     style: BorderStyle.solid,
        //                                     color: ColorConstants
        //                                         .primaryColorDriver)),
        //                             focusedBorder: OutlineInputBorder(
        //                                 borderSide: BorderSide(
        //                                     style: BorderStyle.solid,
        //                                     color: ColorConstants
        //                                         .primaryColorDriver)),
        //                             border: OutlineInputBorder(
        //                                 borderSide: BorderSide(
        //                                     style: BorderStyle.solid,
        //                                     color: ColorConstants
        //                                         .primaryColorDriver)),
        //                             enabledBorder: OutlineInputBorder(
        //                                 borderSide: BorderSide(
        //                                     style: BorderStyle.solid,
        //                                     color: ColorConstants
        //                                         .primaryColorDriver)),
        //                           )),
        //                       menuProps: MenuProps(
        //                           shape: RoundedRectangleBorder(
        //                               side: const BorderSide(
        //                                   color: ColorConstants
        //                                       .primaryColorDriver),
        //                               borderRadius: BorderRadius.circular(8))),
        //                       itemBuilder: (context, terminal, isVisible) =>
        //                           ColumnSuper(
        //                               alignment: Alignment.centerLeft,
        //                               children: [
        //                                 Padding(
        //                                   padding: const Pad(all: 10),
        //                                   child: Text(
        //                                     "${terminal?.name}",
        //                                     style: TextStyle(
        //                                         fontWeight: FontWeight.bold,
        //                                         fontSize: Adaptive.sp(16)),
        //                                   ),
        //                                 ),
        //                                 Container(
        //                                   height: 1,
        //                                   color: Colors.grey.withOpacity(0.3),
        //                                 ),
        //                               ]),
        //                       isFilterOnline: true,
        //                       title: Padding(
        //                         padding: const Pad(all: 10),
        //                         child: Text(
        //                           'Select District',
        //                           textAlign: TextAlign.center,
        //                           style: TextStyle(
        //                               fontSize: Adaptive.sp(16),
        //                               fontWeight: FontWeight.bold),
        //                         ),
        //                       ),
        //                       showSearchBox: true,
        //                       searchDelay: const Duration(microseconds: 500)),
        //                   filterFn: (user, filter) =>
        //                       user?.districtFilterByName(filter) ?? false,
        //                   // asyncItems: (String filter) => getData(filter),
        //
        //                   items: states.data ?? [],
        //                   itemAsString: (StateDatum? u) => u?.name ?? "",
        //                   onChanged: (StateDatum? data) =>
        //                       ref.watch(districtProvider.notifier).state = data,
        //                   dropdownDecoratorProps: const DropDownDecoratorProps(
        //                     dropdownSearchDecoration: InputDecoration(
        //                         contentPadding:
        //                             Pad(left: 10, bottom: 5, top: 5),
        //                         hintText: "Select District",
        //                         border: OutlineInputBorder(
        //                             borderRadius:
        //                                 BorderRadius.all(Radius.circular(8)),
        //                             borderSide: BorderSide(
        //                                 color: ColorConstants
        //                                     .primaryColorDriver))),
        //                   ),
        //                 ),
        //             error: (e, s) => Container(),
        //             loading: () => const CupertinoActivityIndicator()),
        const SizedBox(
          height: 10,
        ),
        // TextFormField(
        //   controller: driverAddressController,
        //   textInputAction: TextInputAction.next,
        //   validator: (value) {
        //     if (value == null || value.isEmpty) {
        //       return 'Please input valid address';
        //     }
        //
        //     return null;
        //   },
        //   keyboardType: TextInputType.text,
        //   decoration: const InputDecoration(
        //       label: Text("Enter Address"),
        //       hintText: "Enter Address",
        //       border: OutlineInputBorder()),
        // ),
        // const SizedBox(
        //   height: 10,
        // ),
        // TextFormField(
        //   controller: driverPincodeController,
        //   textInputAction: TextInputAction.next,
        //   validator: (value) {
        //     if (value == null || value.isEmpty) {
        //       return 'Please input valid pincode';
        //     }
        //     if (value.length != 6) {
        //       return 'Pincode should be of 6 digits';
        //     }
        //     return null;
        //   },
        //   maxLength: 6,
        //   keyboardType: TextInputType.number,
        //   decoration: const InputDecoration(
        //       label: Text("Enter Pincode"),
        //       hintText: "Enter Pincode",
        //       border: OutlineInputBorder()),
        // ),
        // const SizedBox(
        //   height: 10,
        // ),
        // TextFormField(
        //   controller: driverBankNameController,
        //   textInputAction: TextInputAction.next,
        //   validator: (value) {
        //     if (value == null || value.isEmpty) {
        //       return 'Please select bank';
        //     }
        //
        //     return null;
        //   },
        //   decoration: const InputDecoration(
        //       label: Text("Bank Name"),
        //       hintText: "Bank Name",
        //       border: OutlineInputBorder()),
        // ),
        // const SizedBox(
        //   height: 10,
        // ),
        // TextFormField(
        //   controller: driverBankAccountNoController,
        //   textInputAction: TextInputAction.next,
        //   keyboardType: TextInputType.number,
        //   validator: (value) {
        //     if (value == null || value.isEmpty) {
        //       return 'Please input bank account number';
        //     }
        //
        //     return null;
        //   },
        //   decoration: const InputDecoration(
        //       label: Text("Bank Account Number"),
        //       hintText: "Bank Account Number",
        //       border: OutlineInputBorder()),
        // ),
        // const SizedBox(
        //   height: 10,
        // ),
        // TextFormField(
        //   controller: driverBankIFSCController,
        //   textInputAction: TextInputAction.next,
        //   validator: (value) {
        //     if (value == null || value.isEmpty) {
        //       return 'Please input bank IFSC code';
        //     }
        //
        //     return null;
        //   },
        //   decoration: const InputDecoration(
        //       label: Text("Bank IFSC code"),
        //       hintText: "Bank IFSC code",
        //       border: OutlineInputBorder()),
        // ),
        // const SizedBox(
        //   height: 10,
        // ),
        TextFormField(
          controller: driverPanCardNoController,
          textInputAction: TextInputAction.next,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'validPan'.tr();
            }

            return null;
          },
          decoration: InputDecoration(
              label: Text("panCardNo").tr(),
              hintText: "panCardNo".tr(),
              border: OutlineInputBorder()),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: InkWell(
            onTap: () async {
              await imagePicker
                  .pickImage(source: ImageSource.gallery, imageQuality: 30)
                  .then((value) async {
                if (value != null) {
                  ref.watch(panImage.notifier).state = File(value.path);
                }
              });
            },
            child: DottedBorder(
                borderType: BorderType.RRect,
                dashPattern: const [5, 5, 5, 5],
                color: ColorConstants.primaryColorDriver,
                child: Padding(
                  padding: const Pad(all: 20),
                  child: Center(
                    child: ref.watch(panImage) != null
                        ? Stack(
                            children: [
                              Image.file(ref.watch(panImage) ?? File('path')),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.6),
                                    shape: BoxShape.circle),
                                child: IconButton(
                                    onPressed: () {
                                      ref.invalidate(panImage);
                                    },
                                    icon: const Icon(
                                      Icons.close,
                                      color: Colors.white,
                                    )),
                              )
                            ],
                          )
                        : ColumnSuper(children: [
                            Icon(
                              LucideIcons.cloud_upload,
                              color: ColorConstants.primaryColorDriver,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "selectPanImage".tr(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: ColorConstants.primaryColorDriver,
                                  fontWeight: FontWeight.bold,
                                  fontSize: Adaptive.sp(16)),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "uploadDocumentImage".tr(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: ColorConstants.primaryColorDriver,
                                  fontWeight: FontWeight.w700,
                                  fontSize: Adaptive.sp(13)),
                            )
                          ]),
                  ),
                )),
          ),
        ),
        const SizedBox(
          height: 10,
        ),

        // TextFormField(
        //   controller: driverAadharNoController,
        //   keyboardType: TextInputType.number,
        //   textInputAction: TextInputAction.next,
        //   validator: (value) {
        //     if (value == null || value.isEmpty) {
        //       return 'Please input aadhar card no.';
        //     }
        //
        //     return null;
        //   },
        //   decoration: const InputDecoration(
        //       label: Text("Aadhar card no."),
        //       hintText: "Aadhar card no.",
        //       border: OutlineInputBorder()),
        // ),
        // const SizedBox(
        //   height: 10,
        // ),

        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: InkWell(
            onTap: () async {
              await imagePicker
                  .pickImage(source: ImageSource.gallery, imageQuality: 30)
                  .then((value) async {
                if (value != null) {
                  ref.watch(aadharImage.notifier).state = File(value.path);
                }
              });
            },
            child: DottedBorder(
                borderType: BorderType.RRect,
                dashPattern: const [5, 5, 5, 5],
                color: ColorConstants.primaryColorDriver,
                child: Padding(
                  padding: const Pad(all: 20),
                  child: Center(
                    child: ref.watch(aadharImage) != null
                        ? Stack(
                            children: [
                              Image.file(
                                  ref.watch(aadharImage) ?? File('path')),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.6),
                                    shape: BoxShape.circle),
                                child: IconButton(
                                    onPressed: () {
                                      ref.invalidate(aadharImage);
                                    },
                                    icon: const Icon(
                                      Icons.close,
                                      color: Colors.white,
                                    )),
                              )
                            ],
                          )
                        : ColumnSuper(children: [
                            Icon(
                              LucideIcons.cloud_upload,
                              color: ColorConstants.primaryColorDriver,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "selectAadharImage".tr(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: ColorConstants.primaryColorDriver,
                                  fontWeight: FontWeight.bold,
                                  fontSize: Adaptive.sp(16)),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "uploadDocumentImage".tr(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: ColorConstants.primaryColorDriver,
                                  fontWeight: FontWeight.w700,
                                  fontSize: Adaptive.sp(13)),
                            )
                          ]),
                  ),
                )),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: InkWell(
            onTap: () async {
              await imagePicker
                  .pickImage(source: ImageSource.gallery, imageQuality: 30)
                  .then((value) async {
                if (value != null) {
                  ref.watch(aadharBackImage.notifier).state = File(value.path);
                }
              });
            },
            child: DottedBorder(
                borderType: BorderType.RRect,
                dashPattern: const [5, 5, 5, 5],
                color: ColorConstants.primaryColorDriver,
                child: Padding(
                  padding: const Pad(all: 20),
                  child: Center(
                    child: ref.watch(aadharBackImage) != null
                        ? Stack(
                            children: [
                              Image.file(
                                  ref.watch(aadharBackImage) ?? File('path')),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.6),
                                    shape: BoxShape.circle),
                                child: IconButton(
                                    onPressed: () {
                                      ref.invalidate(aadharBackImage);
                                    },
                                    icon: const Icon(
                                      Icons.close,
                                      color: Colors.white,
                                    )),
                              )
                            ],
                          )
                        : ColumnSuper(children: [
                            Icon(
                              LucideIcons.cloud_upload,
                              color: ColorConstants.primaryColorDriver,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "selectAadharImage".tr(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: ColorConstants.primaryColorDriver,
                                  fontWeight: FontWeight.bold,
                                  fontSize: Adaptive.sp(16)),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "uploadDocumentImage".tr(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: ColorConstants.primaryColorDriver,
                                  fontWeight: FontWeight.w700,
                                  fontSize: Adaptive.sp(13)),
                            )
                          ]),
                  ),
                )),
          ),
        ),
        const SizedBox(
          height: 10,
        ),

        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: InkWell(
            onTap: () async {
              await imagePicker
                  .pickImage(source: ImageSource.gallery, imageQuality: 30)
                  .then((value) async {
                if (value != null) {
                  ref.watch(chequeImage.notifier).state = File(value.path);
                }
              });
            },
            child: DottedBorder(
                borderType: BorderType.RRect,
                dashPattern: const [5, 5, 5, 5],
                color: ColorConstants.primaryColorDriver,
                child: Padding(
                  padding: const Pad(all: 20),
                  child: Center(
                    child: ref.watch(chequeImage) != null
                        ? Stack(
                            children: [
                              Image.file(
                                  ref.watch(chequeImage) ?? File('path')),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.6),
                                    shape: BoxShape.circle),
                                child: IconButton(
                                    onPressed: () {
                                      ref.invalidate(chequeImage);
                                    },
                                    icon: const Icon(
                                      Icons.close,
                                      color: Colors.white,
                                    )),
                              )
                            ],
                          )
                        : ColumnSuper(children: [
                            Icon(
                              LucideIcons.cloud_upload,
                              color: ColorConstants.primaryColorDriver,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "selectPassbookImage".tr(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: ColorConstants.primaryColorDriver,
                                  fontWeight: FontWeight.bold,
                                  fontSize: Adaptive.sp(16)),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "uploadDocumentImage".tr(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: ColorConstants.primaryColorDriver,
                                  fontWeight: FontWeight.w700,
                                  fontSize: Adaptive.sp(13)),
                            )
                          ]),
                  ),
                )),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: InkWell(
            onTap: () async {
              await imagePicker
                  .pickImage(source: ImageSource.gallery, imageQuality: 30)
                  .then((value) async {
                if (value != null) {
                  ref.watch(profileImage.notifier).state = File(value.path);
                }
              });
            },
            child: DottedBorder(
                borderType: BorderType.RRect,
                dashPattern: const [5, 5, 5, 5],
                color: ColorConstants.primaryColorDriver,
                child: Padding(
                  padding: const Pad(all: 20),
                  child: Center(
                    child: ref.watch(profileImage) != null
                        ? Stack(
                            children: [
                              Image.file(
                                  ref.watch(profileImage) ?? File('path')),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.6),
                                    shape: BoxShape.circle),
                                child: IconButton(
                                    onPressed: () {
                                      ref.invalidate(profileImage);
                                    },
                                    icon: const Icon(
                                      Icons.close,
                                      color: Colors.white,
                                    )),
                              )
                            ],
                          )
                        : ColumnSuper(children: [
                            Icon(
                              LucideIcons.cloud_upload,
                              color: ColorConstants.primaryColorDriver,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "selectProfileImage".tr(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: ColorConstants.primaryColorDriver,
                                  fontWeight: FontWeight.bold,
                                  fontSize: Adaptive.sp(16)),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "uploadDocumentImage".tr(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: ColorConstants.primaryColorDriver,
                                  fontWeight: FontWeight.w700,
                                  fontSize: Adaptive.sp(13)),
                            )
                          ]),
                  ),
                )),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: ElevatedButton(
              style: StyleConstants.buttonBordersStyle(
                  borderColor: Colors.white,
                  backgroundColor: ColorConstants.primaryColorDriver),
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  if (ref.watch(licenseImage) == null) {
                    errorToast(context, "selectLicenseImage".tr());
                  } else if (ref.watch(panImage) == null) {
                    errorToast(context, "selectPanImage".tr());
                  } else if (ref.watch(aadharImage) == null) {
                    errorToast(context, "selectAadharImage".tr());
                  } else if (ref.watch(aadharBackImage) == null) {
                    errorToast(
                        context, "selectAadharImage".tr());
                  } else if (ref.watch(chequeImage) == null) {
                    errorToast(context, "selectPassbookImage".tr());
                  } else if (ref.watch(profileImage) == null) {
                    errorToast(context, "selectProfileImage".tr());
                  } else {
                    showLoader(context);
                    var _panCardImage =
                        base64Encode(await ref.watch(panImage)!.readAsBytes());
                    var _licenseCardImage = base64Encode(
                        await ref.watch(licenseImage)!.readAsBytes());
                    var _aadharImage = base64Encode(
                        await ref.watch(aadharImage)!.readAsBytes());
                    var _aadharBackImage = base64Encode(
                        await ref.watch(aadharBackImage)!.readAsBytes());
                    var _passBook = base64Encode(
                        await ref.watch(chequeImage)!.readAsBytes());

                    var _profileImage = base64Encode(
                        await ref.watch(profileImage)!.readAsBytes());
                    hideLoader(context);
                    ref
                        .watch(registerDriverProvider({
                      'phone': driverPhoneController.text.toString(),
                      'name': driverNameController.text.toString(),
                      'state': ref.watch(statesProvider)?.name.toString(),
                      'city': ref.watch(districtProvider)?.name.toString(),
                      'address': driverAddressController.text.toString(),
                      'pincode': driverPincodeController.text.toString(),
                      'pancard_no': driverPanCardNoController.text.toString(),
                      'aadhar_no': driverAadharNoController.text.toString(),
                      'license': driverLicenseController.text.toString(),
                      'pancard_image': _panCardImage,
                      'license_image': _licenseCardImage,
                      'aadhar_image': _aadharImage,
                      'aadhar_back_image': _aadharBackImage,
                      'cheque_passbook': _passBook,
                      'profile_image': _profileImage
                      // if($request->account_no)
                      // 'bank_name' : 8,
                      // 'bank_branch' : 'BB',
                      // 'bank_acc_no' : '909090909090123',
                      // 'bank_ifsc_code' : 'bank1234',
                      // 'cheque_passbook' : 'base 296'
                    }).future)
                        .then((value) {
                      if (value['status'].toString() == "1") {
                        successToast(context,
                            "${value['message'] ?? value['Message']}");
                        ref.watch(goRouterProvider).go(RoutesStrings.login);
                      }
                    });
                  }
                }
              },
              child: Text(
                "submit".tr(),
                style: StyleConstants.buttonTextStyle(),
              )),
        )
      ]);
}
