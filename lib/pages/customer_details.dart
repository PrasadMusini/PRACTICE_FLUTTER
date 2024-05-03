import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:practice_flutter/models/customer_model.dart';

class ConsulationCreationScreen extends StatefulWidget {
  const ConsulationCreationScreen({super.key});

  @override
  State<ConsulationCreationScreen> createState() =>
      _ConsulationCreationScreenState();
}

class _ConsulationCreationScreenState extends State<ConsulationCreationScreen> {
  List<String> gendersList = ['Male', 'Female', 'Others'];

  final testCon1 = TextEditingController();
  final testCon2 = TextEditingController();
  final testCon3 = TextEditingController();
  String? _selectedState;
  List<String> states = [
    "California",
    "Texas",
    "Florida",
    "New York",
    "Illinois"
  ];

  String gender = '';
  late Future<List<Branch>> apiData;

  @override
  void initState() {
    super.initState();
    apiData = fetchBranches();
  }

  Future<List<Branch>> fetchBranches() async {
    String apiUrl =
        'http://182.18.157.215/SaloonApp/API/GetBranchByUserId/null';

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = jsonDecode(response.body);
        List<dynamic> listResultJson = jsonResponse['listResult'];
        List<Branch> branches =
            listResultJson.map((e) => Branch.fromJson(e)).toList();
        return branches;
      } else {
        throw Exception('Failed to load branches');
      }
    } catch (e) {
      throw Exception('Failed to connect to the server: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: _appBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 0, top: 1.0, right: 0),
                child: GestureDetector(
                  child: Container(
                    width: screenWidth * 0.9,
                    height: 40.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        color: const Color(0xFF163CF1),
                        width: 1.5,
                      ),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(
                            'assets/User_icon.svg',
                            width: 20.0,
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, top: 6.0),
                              child: TextFormField(
                                keyboardType: TextInputType.name,
                                controller: testCon1,
                                style: const TextStyle(
                                  fontFamily: 'Calibri',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                ),
                                decoration: const InputDecoration(
                                  hintText: 'Customer Name',
                                  hintStyle: TextStyle(
                                    fontFamily: 'Calibri',
                                    fontSize: 14,
                                    color: Color(0xFFFB4110),
                                    fontWeight: FontWeight.w300,
                                  ),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0, top: 10.0, right: 0),
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: screenWidth * 0.9,
                    height: 40.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        color: const Color(0xFF163CF1),
                        width: 1.5,
                      ),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(
                            'assets/phone_1.svg',
                            width: 20.0,
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: TextFormField(
                                maxLength: 10,
                                keyboardType: TextInputType.number,
                                controller: testCon2,
                                style: const TextStyle(
                                  fontFamily: 'Calibri',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                ),
                                decoration: const InputDecoration(
                                  hintText: 'Phone Number',
                                  hintStyle: TextStyle(
                                    fontFamily: 'Calibri',
                                    fontSize: 14,
                                    color: Color(0xFFFB4110),
                                    fontWeight: FontWeight.w300,
                                  ),
                                  counterText: '',

                                  border: InputBorder.none,
                                  // Remove the underline border
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 10.0,
                ),
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: screenWidth * 0.9,
                    height: 40.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        color: const Color(0xFF163CF1),
                        width: 1.5,
                      ),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(
                            'assets/Mail_icon.svg',
                            width: 20.0,
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: TextFormField(
                                controller: testCon3,
                                style: const TextStyle(
                                  fontFamily: 'Calibri',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                ),
                                decoration: const InputDecoration(
                                  hintText: 'Email',
                                  hintStyle: TextStyle(
                                    fontFamily: 'Calibri',
                                    fontSize: 14,
                                    color: Color(0xFFFB4110),
                                    fontWeight: FontWeight.w300,
                                  ),
                                  border: InputBorder.none,
                                  // Remove the underline border
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0, left: 15),
                child: Row(
                  children: gendersList.map((option) {
                    return Row(
                      children: [
                        CustomRadioButton(
                          selected: gender == option,
                          onTap: () {
                            setState(() {
                              gender = option;
                              //  print('selectedGender:$selectedGender');
                              // isGenderSelected = true;
                            });
                          },
                        ),
                        const SizedBox(width: 8),
                        Text(
                          option,
                          style: const TextStyle(
                            fontFamily: 'Calibri',
                            fontSize: 14,
                            color: Color(0xFFFB4110),
                          ),
                        ),
                        const SizedBox(width: 26),
                      ],
                    );
                  }).toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: GestureDetector(
                  child: Container(
                    width: screenWidth * 0.9,
                    height: 40.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        color: const Color(0xFF163CF1),
                        width: 1.5,
                      ),
                    ),
                    child: FutureBuilder(
                        future: apiData,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Text('loading');
                          } else if (snapshot.hasError) {
                            return Text('${snapshot.error}');
                          } else {
                            List<Branch>? data = snapshot.data;
                            if (data == null) {
                              return DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: _selectedState,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  hint: const Text(
                                    'Select a State',
                                    style: TextStyle(
                                      fontFamily: 'Calibri',
                                      fontSize: 14,
                                      color: Color(0xFFFB4110),
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  onChanged: (newValue) {
                                    setState(() {
                                      _selectedState = newValue!;
                                    });
                                  },
                                  items: states.map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10,
                                            vertical:
                                                8), // Adjust padding as needed
                                        child: Text(
                                          value,
                                          style: const TextStyle(
                                            fontFamily: 'Calibri',
                                            fontSize: 14,
                                            color: Color(0xFFFB4110),
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              );
                            } else {
                              return const Text('List contains null.');
                            }
                          }
                        }),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 20.0,
                ),
                child: SizedBox(
                  child: Center(
                    child: GestureDetector(
                      // onTap: isButtonEnabled
                      //     ? () => validatedata()
                      //     : null,
                      child: Container(
                        width: screenWidth * 0.9,
                        height: 40.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: const Color(0xFFFB4110),
                          // color: isButtonEnabled
                          //     ? const Color(0xFFFB4110)
                          //     : Colors.grey,
                        ),
                        child: const Center(
                          child: Text(
                            'Add Costumer',
                            style: TextStyle(
                              fontFamily: 'Calibri',
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: const Color(0xFFf15f22),
      title: const Text(
        'Customer Deatils',
        style: TextStyle(color: Colors.white, fontSize: 16.0),
      ),
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}

class CustomRadioButton extends StatefulWidget {
  final bool selected;
  final VoidCallback? onTap;

  const CustomRadioButton(
      {super.key, required this.selected, required this.onTap});

  @override
  _CustomRadioButtonState createState() => _CustomRadioButtonState();
}

class _CustomRadioButtonState extends State<CustomRadioButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: 34,
        height: 30,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            width: 2,
            color: widget.selected ? const Color(0xFF163CF1) : Colors.grey,
          ),
        ),
        child: widget.selected
            ? Center(
                child: Container(
                  width: 24,
                  height: 18,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFFB4110),
                  ),
                ),
              )
            : null,
      ),
    );
  }
}
