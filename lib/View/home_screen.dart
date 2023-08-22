import 'package:age_calculator/age_calculator.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';


import '../commmon/appcolors.dart';
import '../controller/home_controller.dart';




class HomeScreen extends GetView<HomeController> {

   @override
  Widget build(BuildContext context) {
   // final TestController testController = Get.find();
    Get.put(HomeController());

    // final selectedDate = controller.selectedDate.value;
    // final currentDate = DateTime.now();
    // final ageMonths = int.parse(controller.ageMonths.value);



    return Obx(() => Scaffold(
        backgroundColor: AppColors.lightgrey,
        body: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              Padding(
                padding: const EdgeInsets.only(top: 80),
                child: Text(
                  'Age Calculator',
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(left: 18, right: 10),
                child: Container(
                  height: Get.height * 0.25,
                  width: Get.width * 0.9,
                  decoration: BoxDecoration(
                    color: AppColors.bgcolor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 25, right: 25, top: 60, bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Transform.translate(
                          offset: Offset(0, -20),
                          child: Text(
                            'BirthData',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 65,
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: TextField(
                                          onChanged: (value) {

                                          },
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          decoration: InputDecoration(
                                            hintText:
                                                controller.selectedDate.value !=
                                                        null
                                                    ? DateFormat('yyyy-MM-dd')
                                                        .format(controller
                                                            .selectedDate
                                                            .value!)
                                                    : 'Enter birth data',
                                            border: InputBorder.none,
                                            contentPadding: EdgeInsets.all(15),
                                          ),
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () =>
                                            _showDatePicker(context),
                                        icon: Icon(
                                          Icons.calendar_today,
                                          color: AppColors.bgcolor,
                                          size: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 1),
              Padding(
                  padding: const EdgeInsets.only(left: 18, right: 10),
                  child: Container(
                    height: Get.height * 0.7,
                    width: Get.width * 0.9,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Column(
                        children: [
                          Transform.translate(
                            offset: Offset(0, -1),
                            child: Text(
                              'You are (Your age right now)',
                              style: TextStyle(
                                color: AppColors.black,
                                fontSize: 19,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 75,
                                width: 82,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Column(
                                    children: [
                                      Text(
                                        controller.ageYears.value,
                                        style: TextStyle(
                                          color: AppColors.white,
                                          fontSize: 30,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: 20),
                              Container(
                                height: 75,
                                width: 82,
                                decoration: BoxDecoration(
                                  color: Colors.lightGreen[200],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Column(
                                    children: [
                                      Text(
                                        controller.ageMonths.value,
                                        style: TextStyle(
                                          color: AppColors.white,
                                          fontSize: 30,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: 20),
                              Container(
                                height: 75,
                                width: 82,
                                decoration: BoxDecoration(
                                  color: Colors.greenAccent,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Column(
                                    children: [
                                      Text(
                                        controller.ageDays.value,
                                        style: TextStyle(
                                          color: AppColors.white,
                                          fontSize: 30,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 35),
                                child: Text(
                                  'Years',
                                  style: TextStyle(
                                    color: AppColors.lightgrey,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                              SizedBox(width: 45),
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Text(
                                  'Months',
                                  style: TextStyle(
                                    color: AppColors.lightgrey,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 50),
                                child: Text(
                                  'Days',
                                  style: TextStyle(
                                    color: AppColors.lightgrey,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: Divider(
                              color: AppColors.darkgrey,
                              height: 50,
                            ),
                          ),
                          SizedBox(height: 1),
                          Row(children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20, top: 5),
                              child: Text(
                                'Months old',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 160),
                              child: Text(
                                controller.ageInMonths.value,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ]),
                          SizedBox(height: 20),
                          Row(children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20, top: 5),
                              child: Text(
                                'Weeks old',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 158),
                              child: Text(
                                controller.ageInWeeks.value,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ]),
                          SizedBox(height: 20),
                          Row(children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20, top: 5),
                              child: Text(
                                'Days old',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 170),
                              child: Text(
                                controller.ageInDays.value,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ]),
                          SizedBox(height: 20),
                          Row(children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20, top: 5),
                              child: Text(
                                'Hours old (approx)',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 105),
                              child: Text(
                                controller.ageInHours.value,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ]),
                          SizedBox(height: 20),
                          Row(children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20, top: 5),
                              child: Text(
                                'Minutes old (approx)',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 70),
                              child: Text(
                                controller.ageInMinutes.value.toString(),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ]),
                          SizedBox(height: 20),
                          Row(children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20, top: 1),
                              child: Text(
                                'Second old (approx)',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 70),
                              child: Text(
                                controller.ageInSeconds.value,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ]),
                        ],
                      ),
                    ),
                  )),
                  SizedBox(height: 20),
                  SingleChildScrollView(  child:Padding(
                      padding:
                      const EdgeInsets.only(bottom:0, top: 0, left:20,right: 1),
                      child: Container(
                          height: Get.height * 0.2,
                          width: Get.width * 0.9,
                          decoration: BoxDecoration(
                            color: Colors.greenAccent,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 22, right: 25, top: 35, bottom: 10),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Transform.translate(
                                    offset: Offset(0, -20),
                                    child: Text(
                                      'Next Birthday',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 1),
                                  SingleChildScrollView(
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 55,
                                          width: 55,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10.0),
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(top: 10),
                                            child: Column(
                                              children: [
                                                Text(
                                                ('0'),
                                                  style: TextStyle(
                                                    color: AppColors.black,
                                                    fontSize: 30,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 20),
                                        Container(
                                          height: 55,
                                          width: 55,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10.0),
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(top: 10),
                                            child: Column(
                                              children: [
                                                Text(
                                                  ('0'),
                                                  style: TextStyle(
                                                    color: AppColors.black,
                                                    fontSize: 30,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(right: 0, top: 5),
                                        child: Transform.translate(
                                          offset: Offset(1, -0),
                                          child: Text(
                                            'Months',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 30, top: 5),
                                        child: Transform.translate(
                                          offset: Offset(1, -0),
                                          child: Text(
                                            'Days',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),

                                ]),
                            //                                 padding: const EdgeInsets.only(left: 5, top: 10),
                            //                                 child: Transform.translate(
                            //                                   offset: Offset(0, -70),
                            //                                   child: Text.rich(
                            //                                     TextSpan(
                            //                                       children: [
                            //                                         TextSpan(
                            //                                           text: 'Your Next birthday is on\n',
                            //                                           style: TextStyle(
                            //                                             color: Colors.black,
                            //                                             fontSize: 16,
                            //                                             fontWeight: FontWeight.w400,
                            //                                           ),
                            //                                         ),
                            //                                         TextSpan(
                            //                                           text: ' Thursday',
                            //                                           style: TextStyle(
                            //                                             color: Colors.black,
                            //                                             fontSize: 20,
                            //                                             fontWeight: FontWeight.bold,
                            //                                           ),
                            //                                         ), TextSpan(
                            //                                           text: ' this year',
                            //                                           style: TextStyle(
                            //                                             color: Colors.black,
                            //                                             fontSize: 15,
                            //                                             fontWeight: FontWeight.w400,
                            //                                           ),
                            //                                         ),
                            //                                       ],
                            //                                     ),
                            //                                   ),
                            //                                 ),
                            //                               )
                            //
                            //               )
                            //                         ),
                            //                       )
                            //                 ],
                            // ),
                            //                 ),
                          ))))
            ]))));
  }

  void _showDatePicker(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: controller.selectedDate.value ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (BuildContext context, Widget? child) {
        // To style the Calendar
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.blue,
            // accentColor: Colors.blue,
            buttonTheme: ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            padding: EdgeInsets.only(top: 145),
            child: child!,
          ),
        );
      },
    );

    if (pickedDate != null && pickedDate != controller.selectedDate.value) {
      controller.selectedDate.value = pickedDate;
      controller.calculateAge();
    }
  }
}
