import 'dart:developer';

import 'package:apnagodam_driver/Presentation/Utils/color_constants.dart';
import 'package:flutter/material.dart';

class DriverProfileScreen extends StatefulWidget {
  const DriverProfileScreen({super.key});

  @override
  State<DriverProfileScreen> createState() => _DriverProfileScreenState();
}

class _DriverProfileScreenState extends State<DriverProfileScreen> {
  final List<String> _bankNames = [
    'Bank of America',
    'Chase Bank',
    'Wells Fargo',
    'Citibank',
    'HSBC',
    'PNC Bank',
  ];
  final List<String> _states = ['California', 'Texas', 'New York', 'Florida'];
  final List<String> _cities = [
    'Los Angeles',
    'Houston',
    'New York City',
    'Miami'
  ];

  String? _selectedState;
  String? _selectedCity;

  String? _selectedBank;
  @override
  void initState() {
    super.initState();
    _selectedBank = _bankNames[0];
    _selectedState = _states[0];
    _selectedCity = _cities[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          children: [
            Container(
                height: 50,
                margin: EdgeInsets.only(left: 3),
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                child: BackButton(
                  color: ColorConstants.secondaryColorWSP,
                )),
            Text(
              '  Driver Profile',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.edit,
                color: Colors.white,
              ))
        ],
        backgroundColor:  ColorConstants.secondaryColorWSP,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/ProfileBackground.png',
                  color:  ColorConstants.secondaryColorWSP,
                ),
                Stack(
                  children: [
                    Container(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        margin: EdgeInsets.only(left: 10, right: 10, top: 70),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 70,
                            ),
                            Text('First name & Last name*'),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                  hintText: "Name*".trim(),
                                  label: Text("Name*".trim()),
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
                            Text('Mobile Number*'),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                  hintText: "EnterMobileNumber".trim(),
                                  label: Text("EnterMobileNumber".trim()),
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
                            Text('License Number*'),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                  hintText: "LicenseNumber".trim(),
                                  label: Text("LicenseNumber".trim()),
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
                            Text('Address*'),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                  hintText: "Address".trim(),
                                  label: Text("Address".trim()),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Expanded(child: Text('State Name*')),
                                Expanded(child: Text('   city Name*')),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Container(
                                    padding:
                                    EdgeInsets.symmetric(horizontal: 5),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color:Colors.black),
                                        borderRadius:
                                        BorderRadius.circular(10)),
                                    child: DropdownButton<String>(
                                      iconEnabledColor:
                                      ColorConstants.secondaryColorWSP,
                                      // iconEnabledColor:
                                      //     const Color.fromARGB(255, 224, 24, 10),
                                      underline: SizedBox.shrink(),
                                      value: _selectedState,
                                      isExpanded: true,
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          _selectedState = newValue;
                                        });
                                      },
                                      items: _states
                                          .map<DropdownMenuItem<String>>(
                                              (String state) {
                                            return DropdownMenuItem<String>(
                                              value: state,
                                              child: Text(state),
                                            );
                                          }).toList(),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                    width:
                                    20), // Add space between the two dropdowns
                                // City Dropdown
                                Expanded(
                                  child: Container(
                                    padding:
                                    EdgeInsets.symmetric(horizontal: 5),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color:Colors.black),
                                        borderRadius:
                                        BorderRadius.circular(10)),
                                    child: DropdownButton<String>(
                                      iconEnabledColor:
                                      ColorConstants.secondaryColorWSP,
                                      // iconEnabledColor:
                                      //     const Color.fromARGB(255, 224, 24, 10),
                                      underline: SizedBox.shrink(),
                                      value: _selectedCity,
                                      isExpanded: true,
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          _selectedCity = newValue;
                                        });
                                      },
                                      items: _cities
                                          .map<DropdownMenuItem<String>>(
                                              (String city) {
                                            return DropdownMenuItem<String>(
                                              value: city,
                                              child: Text(city),
                                            );
                                          }).toList(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text('Bank Name*'),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(10)),
                              child: DropdownButton<String>(
                                underline: SizedBox.shrink(),
                                iconEnabledColor:
                                ColorConstants.secondaryColorWSP,
                                // iconEnabledColor:
                                //     const Color.fromARGB(255, 224, 24, 10),
                                value: _selectedBank,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    _selectedBank = newValue;
                                  });
                                },
                                items: _bankNames.map<DropdownMenuItem<String>>(
                                        (String bank) {
                                      return DropdownMenuItem<String>(
                                        value: bank,
                                        child: Text(bank),
                                      );
                                    }).toList(),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text('Bank Branch Address*'),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                  hintText: "Branch Address".trim(),
                                  label: Text("Branch Address".trim()),
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
                            Text('Bank Account No.*'),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                  hintText: "Bank Account No.".trim(),
                                  label: Text("Bank Account No.".trim()),
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
                            Text('IFSC Code*'),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                  hintText: "Branch IFSC Code".trim(),
                                  label: Text("Branch IFSC Code".trim()),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              child: Center(
                                child: Text(
                                  'Save',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700,
                                      color:
                                     Colors.white),
                                ),
                              ),
                              padding: EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                // color: const Color.fromARGB(255, 224, 24, 10),
                                  color:  ColorConstants.secondaryColorWSP,
                                  borderRadius: BorderRadius.circular(7)),
                            )
                          ],
                        ),
                      ),
                      // height: MediaQuery.of(context).size.height / 2,
                      decoration: BoxDecoration(
                        // color: const Color.fromARGB(255, 224, 24, 10),
                        // color: ColorConstation.secondaryColorWSP,

                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(40),
                              bottomRight: Radius.circular(40))),
                    ),
                    Positioned(
                      right: 0,
                      left: 0,
                      top: 0,
                      child: Container(
                        height: 120, width: 120,
                        child: Center(
                          child: Stack(
                            children: [
                              Image.asset('assets/profile(bydefault).png'),
                              Positioned(
                                right: 0,
                                bottom: 0,
                                child: CircleAvatar(
                                  backgroundColor:
                                  ColorConstants.secondaryColorWSP,
                                  // backgroundColor: const Color.fromARGB(255, 224, 24, 10),
                                  child: Icon(
                                    Icons.camera_alt_outlined,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 1,
                                  color: Colors.grey)
                            ]),
                        // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                        // width: MediaQuery.of(context).size.width,s
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}