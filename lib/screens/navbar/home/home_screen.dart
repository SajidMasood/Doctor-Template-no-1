import 'package:doctor_appointment/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../constants/app_Images.dart';
import '../../../widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // __________________Var Sec _______________
  List servicesName = [
    "Aesthetics",
    "Anti-Aging",
    "Hair Restoration",
    "Men's Wellness ",
    "Women's Wellness",
  ];
  List servicesImgs = [
    "aesthetics.png",
    "anti-aging.png",
    "hair-restoration.png",
    "man-wellness.png",
    "women-wellness.png",
  ];
  List<Map<String, dynamic>> medCat = [
    {
      "icon": FontAwesomeIcons.headSideCough,
      "category": 'Cough',
    },
    {
      "icon": FontAwesomeIcons.heartPulse,
      "category": 'Snuffle',
    },
    {
      "icon": FontAwesomeIcons.lungs,
      "category": 'Fiver',
    },
    {
      "icon": FontAwesomeIcons.temperatureHigh,
      "category": 'Temperature',
    },
    {
      "icon": FontAwesomeIcons.personPregnant,
      "category": 'Cold',
    },
    {
      "icon": FontAwesomeIcons.teeth,
      "category": 'Dental',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //____________________ User Image________
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Helo Alex', // hard core the user name at first...
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/profile');
                      },
                      child: const CircleAvatar(
                        radius: 25,
                        backgroundImage:
                            AssetImage('assets/images/profile.jpg'),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 30),
              //____________________ Clinic and Home Visit ________
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      //
                    },
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: AppColors.bgPurple,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 6,
                            spreadRadius: 4,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: const BoxDecoration(
                              color: AppColors.white,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.add,
                              color: AppColors.bgPurple,
                              size: 35,
                            ),
                          ),
                          const SizedBox(height: 30),
                          const Text(
                            "Clinic Visit",
                            style: TextStyle(
                              fontSize: 18,
                              color: AppColors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            "Make an appointment",
                            style: TextStyle(
                              color: Colors.white54,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      //
                    },
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 6,
                            spreadRadius: 4,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: const BoxDecoration(
                              color: Color(0xFFF0EEFA),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.home_filled,
                              color: AppColors.bgPurple,
                              size: 35,
                            ),
                          ),
                          const SizedBox(height: 30),
                          const Text(
                            "Home Visit",
                            style: TextStyle(
                              fontSize: 18,
                              //color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            "Call the doctor home",
                            style: TextStyle(
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              //____________________ your symptoms ? ________
              const Text(
                "What are your symptoms?",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: medCat.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/symptoms');
                      },
                      child: Card(
                        margin: const EdgeInsets.only(right: 20),
                        color: AppColors.bgPurple,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              FaIcon(
                                medCat[index]['icon'],
                                color: Colors.white,
                              ),
                              const SizedBox(width: 20),
                              Text(
                                medCat[index]['category'],
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              //____________________dispaly appointment card here ________
              const SizedBox(height: 20),
              const Text(
                'Appointment Today',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
              ),
              const SizedBox(height: 15),
              const AppointmentCard(),
              const SizedBox(height: 15),
              //____________________ Top Services ________
              const Text(
                'Top Services',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 25),
              // Column(
              //   children: List.generate(

              //     5,
              //     (index) {
              //       return const ServicesCard();
              //     },
              //   ),
              // ),

              // new trying
              ListView.builder(
                itemCount: 5,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
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
                            Container(
                              height: double.infinity,
                              width: MediaQuery.of(context).size.width * 0.33,
                              color: AppColors.white,
                              child: SizedBox(
                                //height: double.maxFinite,
                                width: MediaQuery.of(context).size.width * 0.33,
                                child: Image.asset(
                                  //AppImage.doctor1 + 'doctor1.jpg',
                                  AppImage.doctor1 + servicesImgs[index],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      servicesName[index],
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
                },
              )

              //____________________ ________
            ],
          ),
        )),
      ),
    );
  }
}
