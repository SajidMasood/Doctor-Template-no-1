import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../constants/colors.dart';
import '../../../widgets/widgets.dart';

class AppointmentBooked extends StatelessWidget {
  const AppointmentBooked({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bgPurple,
        title: const Text('Booking'),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back),
        ),
        actions: [
          PopupMenuButton(
            onSelected: (value) {
              // you logic
              Navigator.pushNamed(context, value.toString());
              print('____________________ $value ____________________');
            },
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem(
                  //value: '/home',
                  child: Text('Home'),
                ),

                // 2nd
                const PopupMenuItem(
                  value: '/about',
                  child: Text('About'),
                ),

                // 3rd
                const PopupMenuItem(
                  value: '/profile',
                  child: Text('Profile'),
                ),
              ];
            },
          ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 15.0),
          //   child: Icon(Icons.more_vert),
          // ),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,

              // you may download your favorite lottile file and insert here.
              child: Lottie.asset('assets/json/success.json'),
            ),
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: const Text(
                'Successfully Booked',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: MyButton(
                width: double.infinity,
                title: "Back to Home",
                onPressed: () => Navigator.of(context).pushNamed("/navbar"),
                disable: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
