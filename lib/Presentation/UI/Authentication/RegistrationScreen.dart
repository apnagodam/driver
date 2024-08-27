import 'package:apnagodam_driver/Presentation/Utils/Widgets/Widgets.dart';
import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../Data/Model/DistrictsResponseModel.dart';
import '../../../Data/Model/StatesResponseModel.dart';
import '../../../Domain/StateService/StateService.dart';
import '../../Utils/style_constants.dart';

class Registrationscreen extends ConsumerStatefulWidget {
  const Registrationscreen({super.key});

  @override
  ConsumerState<Registrationscreen> createState() => _RegistrationscreenState();
}

class _RegistrationscreenState extends ConsumerState<Registrationscreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  TextEditingController bankBranchController = TextEditingController();
  TextEditingController mobileNumberController3 = TextEditingController();

  var statesProvider = StateProvider<Datum?>((ref) => null);

  var districtProvider = StateProvider<StateDatum?>((ref) => null);

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
  var imagePicker = ImagePicker();

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: defaultPadding(Form(
              key: formKey,
              child: ListView(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Register',
                      style: largeTitleTextStyle,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  TextFormField(
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          value.length != 10) {
                        return 'Please input valid number';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    controller: mobileNumberController,
                    maxLength: 10,
                    textCapitalization: TextCapitalization.characters,
                    decoration: InputDecoration(
                        hintText: "Enter mobile number",
                        label: const Text("Enter mobile number"),
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
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please input valid name';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.text,
                    controller: mobileNumberController,
                    decoration: InputDecoration(
                        hintText: "Enter name",
                        label: const Text("Enter name"),
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
                  TextFormField(
                    // validator: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     return 'Please input valid email';
                    //   }
                    //   return null;
                    // },
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    decoration: InputDecoration(
                        hintText: "Enter email",
                        label: const Text("Enter email"),
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
                  ref.watch(stateListProvider).when(
                      data: (states) => DropdownSearch<Datum?>(
                            popupProps: PopupProps.menu(
                                searchFieldProps: const TextFieldProps(
                                    autofocus: true,
                                    padding: Pad(left: 10, right: 10),
                                    decoration: InputDecoration(
                                      contentPadding: Pad(left: 10, right: 10),
                                      focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                        style: BorderStyle.solid,
                                      )),
                                      disabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                        style: BorderStyle.solid,
                                      )),
                                      errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                        style: BorderStyle.solid,
                                      )),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                        style: BorderStyle.solid,
                                      )),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                        style: BorderStyle.solid,
                                      )),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                        style: BorderStyle.solid,
                                      )),
                                    )),
                                menuProps: MenuProps(
                                    shape: RoundedRectangleBorder(
                                        side: const BorderSide(),
                                        borderRadius:
                                            BorderRadius.circular(8))),
                                itemBuilder: (context, terminal, isVisible) =>
                                    ColumnSuper(
                                        alignment: Alignment.centerLeft,
                                        children: [
                                          Padding(
                                            padding: const Pad(all: 10),
                                            child: Text(
                                              "${terminal?.name}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: Adaptive.sp(16)),
                                            ),
                                          ),
                                          Container(
                                            height: 1,
                                            color: Colors.grey.withOpacity(0.3),
                                          ),
                                        ]),
                                isFilterOnline: true,
                                title: Padding(
                                  padding: const Pad(all: 10),
                                  child: Text(
                                    'Select State',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: Adaptive.sp(16),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                showSearchBox: true,
                                searchDelay: const Duration(microseconds: 500)),
                            filterFn: (user, filter) =>
                                user?.stateFilterByName(filter) ?? false,
                            // asyncItems: (String filter) => getData(filter),

                            items: states.data ?? [],
                            itemAsString: (Datum? u) => u?.name ?? "",
                            onChanged: (Datum? data) =>
                                ref.watch(statesProvider.notifier).state = data,
                            dropdownDecoratorProps:
                                const DropDownDecoratorProps(
                              dropdownSearchDecoration: InputDecoration(
                                  contentPadding:
                                      Pad(left: 10, bottom: 5, top: 5),
                                  hintText: "Select State",
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8)),
                                      borderSide: BorderSide())),
                            ),
                          ),
                      error: (e, s) => Container(),
                      loading: () => const CupertinoActivityIndicator()),
                  const SizedBox(
                    height: 10,
                  ),
                  ref.watch(statesProvider) == null
                      ? const SizedBox()
                      : ref
                          .watch(districtListProvider(
                              code: ref.watch(statesProvider)?.code))
                          .when(
                              data: (states) => DropdownSearch<StateDatum?>(
                                    popupProps: PopupProps.menu(
                                        searchFieldProps: const TextFieldProps(
                                            autofocus: true,
                                            padding: Pad(left: 10, right: 10),
                                            decoration: InputDecoration(
                                              contentPadding:
                                                  Pad(left: 10, right: 10),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                style: BorderStyle.solid,
                                              )),
                                              disabledBorder:
                                                  OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                style: BorderStyle.solid,
                                              )),
                                              errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                style: BorderStyle.solid,
                                              )),
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                style: BorderStyle.solid,
                                              )),
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                style: BorderStyle.solid,
                                              )),
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                style: BorderStyle.solid,
                                              )),
                                            )),
                                        menuProps: MenuProps(
                                            shape: RoundedRectangleBorder(
                                                side: const BorderSide(),
                                                borderRadius:
                                                    BorderRadius.circular(8))),
                                        itemBuilder: (context, terminal,
                                                isVisible) =>
                                            ColumnSuper(
                                                alignment: Alignment.centerLeft,
                                                children: [
                                                  Padding(
                                                    padding: const Pad(all: 10),
                                                    child: Text(
                                                      "${terminal?.name}",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize:
                                                              Adaptive.sp(16)),
                                                    ),
                                                  ),
                                                  Container(
                                                    height: 1,
                                                    color: Colors.grey
                                                        .withOpacity(0.3),
                                                  ),
                                                ]),
                                        isFilterOnline: true,
                                        title: Padding(
                                          padding: const Pad(all: 10),
                                          child: Text(
                                            'Select District',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: Adaptive.sp(16),
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        showSearchBox: true,
                                        searchDelay:
                                            const Duration(microseconds: 500)),
                                    filterFn: (user, filter) =>
                                        user?.districtFilterByName(filter) ??
                                        false,
                                    // asyncItems: (String filter) => getData(filter),

                                    items: states.data ?? [],
                                    itemAsString: (StateDatum? u) =>
                                        u?.name ?? "",
                                    onChanged: (StateDatum? data) => ref
                                        .watch(districtProvider.notifier)
                                        .state = data,
                                    dropdownDecoratorProps:
                                        const DropDownDecoratorProps(
                                      dropdownSearchDecoration: InputDecoration(
                                          contentPadding:
                                              Pad(left: 10, bottom: 5, top: 5),
                                          hintText: "Select District",
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(8)),
                                              borderSide: BorderSide())),
                                    ),
                                  ),
                              error: (e, s) => Container(),
                              loading: () =>
                                  const CupertinoActivityIndicator()),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please input valid address';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.text,
                    controller: addressController,
                    decoration: InputDecoration(
                        hintText: "Enter address",
                        label: const Text("Enter address"),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please input valid pincode';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.text,
                    controller: pinCodeController,
                    decoration: InputDecoration(
                        hintText: "Enter Pincode",
                        label: const Text("Enter Pincode"),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ref.watch(statesProvider) == null
                      ? const SizedBox()
                      : ref
                          .watch(districtListProvider(
                              code: ref.watch(statesProvider)?.code))
                          .when(
                              data: (states) => DropdownSearch<StateDatum?>(
                                    popupProps: PopupProps.menu(
                                        searchFieldProps: const TextFieldProps(
                                            autofocus: true,
                                            padding: Pad(left: 10, right: 10),
                                            decoration: InputDecoration(
                                              contentPadding:
                                                  Pad(left: 10, right: 10),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                style: BorderStyle.solid,
                                              )),
                                              disabledBorder:
                                                  OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                style: BorderStyle.solid,
                                              )),
                                              errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                style: BorderStyle.solid,
                                              )),
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                style: BorderStyle.solid,
                                              )),
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                style: BorderStyle.solid,
                                              )),
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                style: BorderStyle.solid,
                                              )),
                                            )),
                                        menuProps: MenuProps(
                                            shape: RoundedRectangleBorder(
                                                side: const BorderSide(),
                                                borderRadius:
                                                    BorderRadius.circular(8))),
                                        itemBuilder: (context, terminal,
                                                isVisible) =>
                                            ColumnSuper(
                                                alignment: Alignment.centerLeft,
                                                children: [
                                                  Padding(
                                                    padding: const Pad(all: 10),
                                                    child: Text(
                                                      "${terminal?.name}",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize:
                                                              Adaptive.sp(16)),
                                                    ),
                                                  ),
                                                  Container(
                                                    height: 1,
                                                    color: Colors.grey
                                                        .withOpacity(0.3),
                                                  ),
                                                ]),
                                        isFilterOnline: true,
                                        title: Padding(
                                          padding: const Pad(all: 10),
                                          child: Text(
                                            'Select District',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: Adaptive.sp(16),
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        showSearchBox: true,
                                        searchDelay:
                                            const Duration(microseconds: 500)),
                                    filterFn: (user, filter) =>
                                        user?.districtFilterByName(filter) ??
                                        false,
                                    // asyncItems: (String filter) => getData(filter),

                                    items: states.data ?? [],
                                    itemAsString: (StateDatum? u) =>
                                        u?.name ?? "",
                                    onChanged: (StateDatum? data) => ref
                                        .watch(districtProvider.notifier)
                                        .state = data,
                                    dropdownDecoratorProps:
                                        const DropDownDecoratorProps(
                                      dropdownSearchDecoration: InputDecoration(
                                          contentPadding:
                                              Pad(left: 10, bottom: 5, top: 5),
                                          hintText: "Select District",
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(8)),
                                              borderSide: BorderSide())),
                                    ),
                                  ),
                              error: (e, s) => Container(),
                              loading: () =>
                                  const CupertinoActivityIndicator()),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please input Bank Branch Address';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.text,
                    controller: bankBranchController,
                    decoration: InputDecoration(
                        hintText: "Enter Bank Branch Address",
                        label: const Text("Enter Bank Branch Address"),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please input Bank Account Number';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    controller: bankBranchController,
                    decoration: InputDecoration(
                        hintText: "Enter Bank Account Number",
                        label: const Text("Enter Bank Account Number"),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ],
              )))),
    );
  }

  // driverFormLayout(BuildContext context, WidgetRef ref) => ListView(children: [
  //       TextFormField(
  //         controller: driverNameController,
  //         textInputAction: TextInputAction.next,
  //         decoration: const InputDecoration(
  //             label: Text("Driver Name"),
  //             hintText: "Driver Name",
  //             border: OutlineInputBorder()),
  //       ),
  //       const SizedBox(
  //         height: 10,
  //       ),
  //       TextFormField(
  //         controller: driverPhoneController,
  //         textInputAction: TextInputAction.next,
  //         maxLength: 10,
  //         decoration: const InputDecoration(
  //             label: Text("Driver Phone"),
  //             hintText: "Driver Phone",
  //             border: OutlineInputBorder()),
  //       ),
  //       const SizedBox(
  //         height: 10,
  //       ),
  //       TextFormField(
  //         controller: driverEmailController,
  //         textInputAction: TextInputAction.next,
  //         decoration: const InputDecoration(
  //             label: Text("Driver Email"),
  //             hintText: "Driver Email",
  //             border: OutlineInputBorder()),
  //       ),
  //       const SizedBox(
  //         height: 10,
  //       ),
  //       TextFormField(
  //         controller: driverLicenseController,
  //         textInputAction: TextInputAction.next,
  //         decoration: const InputDecoration(
  //             label: Text("Driver License number"),
  //             hintText: "Driver License number",
  //             border: OutlineInputBorder()),
  //       ),
  //       const SizedBox(
  //         height: 10,
  //       ),
  //       SizedBox(
  //         width: MediaQuery.of(context).size.width,
  //         child: ElevatedButton(
  //             // style: StyleConstants.buttonBordersStyle(
  //             //     borderColor: Col,
  //             //     backgroundColor: Colors.white),
  //             onPressed: () async {
  //               await imagePicker
  //                   .pickImage(source: ImageSource.gallery)
  //                   .then((value) async {
  //                 if (value != null) {
  //                   ref.watch(licenseImage.notifier).state = File(value.path);
  //                 }
  //               });
  //             },
  //             child: Text(
  //               "Select license Image",
  //               style: StyleConstants.normalStyle(),
  //             )),
  //       ),
  //       if (ref.watch(licenseImage) != null)
  //         Image.file(ref.watch(licenseImage) ?? File(""))
  //       else
  //         SizedBox(),
  //       const SizedBox(
  //         height: 10,
  //       ),
  //       DropdownButton(
  //         // Initial Value
  //         value: ref.watch(stateProvider),
  //
  //         // Down Arrow Icon
  //         icon: const Icon(Icons.keyboard_arrow_down),
  //
  //         // Array list of items
  //         items: StringContants.states.map((String items) {
  //           return DropdownMenuItem(
  //             value: items,
  //             child: Text(items),
  //           );
  //         }).toList(),
  //         // After selecting the desired option,it will
  //         // change button value to selected value
  //         onChanged: (String? newValue) {
  //           ref.watch(stateProvider.notifier).state =
  //               newValue ?? "Select State";
  //         },
  //       ),
  //       const SizedBox(
  //         height: 10,
  //       ),
  //       TextFormField(
  //         controller: driverCityController,
  //         textInputAction: TextInputAction.next,
  //         decoration: const InputDecoration(
  //             label: Text("Select City"),
  //             hintText: "Select City",
  //             border: OutlineInputBorder()),
  //       ),
  //       const SizedBox(
  //         height: 10,
  //       ),
  //       TextFormField(
  //         controller: driverPincodeController,
  //         textInputAction: TextInputAction.next,
  //         maxLength: 6,
  //         keyboardType: TextInputType.number,
  //         decoration: const InputDecoration(
  //             label: Text("Enter Pincode"),
  //             hintText: "Enter Pincode",
  //             border: OutlineInputBorder()),
  //       ),
  //       const SizedBox(
  //         height: 10,
  //       ),
  //       TextFormField(
  //         controller: driverBankNameController,
  //         textInputAction: TextInputAction.next,
  //         decoration: const InputDecoration(
  //             label: Text("Bank Name"),
  //             hintText: "Bank Name",
  //             border: OutlineInputBorder()),
  //       ),
  //       const SizedBox(
  //         height: 10,
  //       ),
  //       TextFormField(
  //         controller: driverBankAccountNoController,
  //         textInputAction: TextInputAction.next,
  //         keyboardType: TextInputType.number,
  //         decoration: const InputDecoration(
  //             label: Text("Bank Account Number"),
  //             hintText: "Bank Account Number",
  //             border: OutlineInputBorder()),
  //       ),
  //       const SizedBox(
  //         height: 10,
  //       ),
  //       TextFormField(
  //         controller: driverBankIFSCController,
  //         textInputAction: TextInputAction.next,
  //         decoration: const InputDecoration(
  //             label: Text("Bank IFSC code"),
  //             hintText: "Bank IFSC code",
  //             border: OutlineInputBorder()),
  //       ),
  //       const SizedBox(
  //         height: 10,
  //       ),
  //       TextFormField(
  //         controller: driverPanCardNoController,
  //         textInputAction: TextInputAction.next,
  //         decoration: const InputDecoration(
  //             label: Text("Pan card no"),
  //             hintText: "Pan card no",
  //             border: OutlineInputBorder()),
  //       ),
  //       const SizedBox(
  //         height: 10,
  //       ),
  //       TextFormField(
  //         controller: driverAadharNoController,
  //         keyboardType: TextInputType.number,
  //         textInputAction: TextInputAction.next,
  //         decoration: const InputDecoration(
  //             label: Text("Aadhar card no."),
  //             hintText: "Aadhar card no.",
  //             border: OutlineInputBorder()),
  //       ),
  //       const SizedBox(
  //         height: 10,
  //       ),
  //       SizedBox(
  //         width: MediaQuery.of(context).size.width,
  //         child: ElevatedButton(
  //             style: StyleConstants.buttonBordersStyle(
  //                 borderColor: ColorConstants.primaryColorWSP,
  //                 backgroundColor: Colors.white),
  //             onPressed: () async {
  //               await imagePicker
  //                   .pickImage(source: ImageSource.gallery)
  //                   .then((value) async {
  //                 if (value != null) {
  //                   ref.watch(panImage.notifier).state = File(value.path);
  //                 }
  //               });
  //             },
  //             child: Text(
  //               "Select Pan Image",
  //               style: StyleConstants.normalStyle(),
  //             )),
  //       ),
  //       if (ref.watch(panImage) != null)
  //         Image.file(ref.watch(panImage) ?? File(""))
  //       else
  //         SizedBox(),
  //       const SizedBox(
  //         height: 10,
  //       ),
  //       SizedBox(
  //         width: MediaQuery.of(context).size.width,
  //         child: ElevatedButton(
  //             style: StyleConstants.buttonBordersStyle(
  //                 borderColor: ColorConstants.primaryColorWSP,
  //                 backgroundColor: Colors.white),
  //             onPressed: () async {
  //               await imagePicker
  //                   .pickImage(source: ImageSource.gallery)
  //                   .then((value) async {
  //                 if (value != null) {
  //                   ref.watch(aadharImage.notifier).state = File(value.path);
  //                 }
  //               });
  //             },
  //             child: Text(
  //               "Select Aadhar Image",
  //               style: StyleConstants.normalStyle(),
  //             )),
  //       ),
  //       if (ref.watch(aadharImage) != null)
  //         Image.file(ref.watch(aadharImage) ?? File(""))
  //       else
  //         SizedBox(),
  //       const SizedBox(
  //         height: 10,
  //       ),
  //       SizedBox(
  //         width: context.widthPx,
  //         child: ElevatedButton(
  //             style: StyleConstants.buttonBordersStyle(
  //                 borderColor: ColorConstants.primaryColorWSP,
  //                 backgroundColor: Colors.white),
  //             onPressed: () async {
  //               await imagePicker
  //                   .pickImage(source: ImageSource.gallery)
  //                   .then((value) async {
  //                 if (value != null) {
  //                   ref.watch(chequeImage.notifier).state = File(value.path);
  //                 }
  //               });
  //             },
  //             child: Text(
  //               "Select Cheque/Passbook Image",
  //               style: StyleConstants.normalStyle(),
  //             )),
  //       ),
  //       if (ref.watch(chequeImage) != null)
  //         Image.file(ref.watch(chequeImage) ?? File(""))
  //       else
  //         SizedBox(),
  //       const SizedBox(
  //         height: 10,
  //       ),
  //       SizedBox(
  //         width: context.widthPx,
  //         child: ElevatedButton(
  //             style: StyleConstants.buttonBordersStyle(
  //                 borderColor: ColorConstants.primaryColorWSP,
  //                 backgroundColor: Colors.white),
  //             onPressed: () async {
  //               await imagePicker
  //                   .pickImage(source: ImageSource.gallery)
  //                   .then((value) async {
  //                 if (value != null) {
  //                   ref.watch(profileImage.notifier).state = File(value.path);
  //                 }
  //               });
  //             },
  //             child: Text(
  //               "Select Profile Image",
  //               style: StyleConstants.normalStyle(),
  //             )),
  //       ),
  //       if (ref.watch(profileImage) != null)
  //         Image.file(ref.watch(profileImage) ?? File(""))
  //       else
  //         SizedBox(),
  //       ElevatedButton(
  //           style: StyleConstants.buttonBordersStyle(
  //               borderColor: Colors.white,
  //               backgroundColor: ColorConstants.secondaryColorWSP),
  //           onPressed: () {
  //             if (driverNameController.text.toString().isEmpty) {
  //               errorToast("please input driver name");
  //             } else if (driverPhoneController.text.isEmpty ||
  //                 driverPhoneController.text.length != 10) {
  //               errorToast("please input proper driver phone");
  //             } else if (driverEmailController.text.isEmpty) {
  //               errorToast("please input driver email");
  //             } else if (driverLicenseController.text.isEmpty) {
  //               errorToast("please input driver license");
  //             } else if (driverCityController.text.isEmpty) {
  //               errorToast("please input driver city");
  //             } else if (driverPincodeController.text.isEmpty) {
  //               errorToast("please input driver pincode");
  //             } else if (driverBankNameController.text.isEmpty) {
  //               errorToast("please input driver bank name");
  //             } else if (driverBankAccountNoController.text.isEmpty) {
  //               errorToast("please input driver account number");
  //             } else if (driverBankIFSCController.text.isEmpty) {
  //               errorToast("please input driver bank ifsc");
  //             } else if (driverPanCardNoController.text.isEmpty) {
  //               errorToast("please input driver pan card number");
  //             } else if (driverAadharNoController.text.isEmpty) {
  //               errorToast("please input driver aadhar number");
  //             } else if (ref.watch(licenseImage) == null) {
  //               errorToast("please select license image");
  //             } else if (ref.watch(panImage) == null) {
  //               errorToast("please select pan card image");
  //             } else if (ref.watch(aadharImage) == null) {
  //               errorToast("please select aadhar card image");
  //             } else if (ref.watch(chequeImage) == null) {
  //               errorToast("please select cheque image");
  //             } else if (ref.watch(profileImage) == null) {
  //               errorToast("please select profile image");
  //             } else {
  //               successToast("Success");
  //             }
  //           },
  //           child: Text(
  //             "Submit",
  //             style: StyleConstants.buttonTextStyle(),
  //           ))
  //     ]);
}
