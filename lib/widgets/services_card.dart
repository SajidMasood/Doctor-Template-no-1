// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:doctor_appointment/constants/app_Images.dart';

import '../constants/colors.dart';

class ServicesCard extends StatefulWidget {
  
   ServicesCard({
    Key? key,
  
  }) : super(key: key);

  @override
  State<ServicesCard> createState() => _ServicesCardState();
}

class _ServicesCardState extends State<ServicesCard> {
  // Services list...
  List servicesImgs = [
    "aesthetics.png",
    "anti-aging.png",
    "hair-restoration.png",
    "man-wellness.png",
    "women-wellness.png",
  ];
  List servicesName = [
    "Aesthetics",
    "Anti-Aging",
    "Hair Restoration",
    "Men's Wellness ",
    "Women's Wellness",
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
      height: 150,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed('/topServices');
        },
        child: Card(
          elevation: 5,
          color: AppColors.bgPurple,
          child: Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.33,
                child: Image.asset(
                  AppImage.doctor1 + 'doctor1.jpg',
                  //servicesImgs[index],
                  fit: BoxFit.fill,
                ),
              ),
              Flexible(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Dr Sajid Abdali',
                        style: TextStyle(
                          fontSize: 18,
                          color: AppColors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        'Dental',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.white,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Icon(
                            Icons.star_border,
                            color: AppColors.yellow,
                            size: 16,
                          ),
                          Spacer(
                            flex: 1,
                          ),
                          Text(
                            '4.5',
                            style: TextStyle(
                              color: AppColors.white,
                            ),
                          ),
                          Spacer(
                            flex: 1,
                          ),
                          Text(
                            'Reviews',
                            style: TextStyle(
                              color: AppColors.white,
                            ),
                          ),
                          Spacer(
                            flex: 1,
                          ),
                          Text(
                            '(20)',
                            style: TextStyle(
                              color: AppColors.white,
                            ),
                          ),
                          Spacer(
                            flex: 7,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
