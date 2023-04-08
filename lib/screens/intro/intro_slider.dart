import 'package:doctor_appointment/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroSliderPage extends StatefulWidget {
  const IntroSliderPage({super.key});

  @override
  State<IntroSliderPage> createState() => _IntroSliderPageState();
}

class _IntroSliderPageState extends State<IntroSliderPage> {
  // ________________Var Sec___________________________
  @override
  void initState() {
    super.initState();
    checkIsFirstTime();
  }

  void checkIsFirstTime() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool? isFirstTime = prefs.getBool('isFirstTime');

    // check is null or true
    if (isFirstTime == null || isFirstTime) {
      prefs.setBool('isFirstTime', false);
    } else {
      Navigator.pushReplacementNamed(context, '/welcome');
    }
  }

  // ________________End Var Sec___________________________
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        globalBackgroundColor: Colors.white,
        scrollPhysics: const BouncingScrollPhysics(),
        pages: [
          PageViewModel(
            titleWidget: const Text(
              "Need A Doctor",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            body:
                "\"Need a doctor\" is a phrase commonly used to express a desire or urgent requirement for medical attention or assistance. It implies that someone is experiencing physical or mental distress and requires the expertise and intervention of a qualified medical professional.",
            image: Image.asset(
              'assets/images/image1.png',
              height: 400,
              width: 400,
            ),
          ),
          PageViewModel(
            titleWidget: const Text(
              "Health Advice",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            body:
                "Exercise regularly to maintain a healthy weight, improve your cardiovascular health. Stay hydrated by drinking plenty of water throughout the day.",
            image: Image.asset(
              'assets/images/image2.png',
              height: 400,
              width: 400,
            ),
          ),
          PageViewModel(
            titleWidget: const Text(
              "24 x 7 Sevices",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            body:
                "Write the more description of the page. Write the more description of the page.",
            image: Image.asset(
              'assets/images/image3.png',
              height: 400,
              width: 400,
            ),
          ),
        ],

        //
        onDone: () {
          Navigator.pushReplacementNamed(context, '/welcome');
        },
        onSkip: () {
          Navigator.pushReplacementNamed(context, '/welcome');
        },
        //
        showSkipButton: true,

        skip: const Text(
          "Skip",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: AppColors.introColor,
          ),
        ),
        next: const Icon(
          Icons.arrow_forward,
          color: AppColors.introColor,
        ),
        done: const Text(
          "Done",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: AppColors.introColor,
          ),
        ),

        //
        dotsDecorator: DotsDecorator(
          size: const Size.square(10),
          activeSize: const Size(20, 10),
          color: Colors.black26,
          activeColor: AppColors.introColor,
          spacing: const EdgeInsets.symmetric(horizontal: 3),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
    );
  }
}
