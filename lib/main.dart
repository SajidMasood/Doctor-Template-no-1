import 'package:doctor_appointment/screens/intro/intro_slider.dart';
import 'package:doctor_appointment/screens/navbar/home/top_services.dart';
import 'package:doctor_appointment/screens/profile/update_profile.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screens/auth/login_screen.dart';
import 'screens/auth/signup_screen.dart';
import 'screens/navbar/navbar.dart';
import 'screens/profile/profile_screen.dart';
import 'screens/welcome_screen.dart';

bool? isViewed;
Future<void> main() async {
  // SystemChrome.setSystemUIOverlayStyle(
  //     const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isViewed = prefs.getBool('isFirstTime');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Doctor Appointment',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      initialRoute: isViewed != true ? '/introSlider' : '/welcome',
      //home: isViewed != true ? const IntroSliderPage() : const HomeScreen(),
      routes: {
        '/introSlider': (context) => const IntroSliderPage(),
        '/welcome': (context) => const WelcomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignUpScreen(),
        // navbar roots...
        '/navbar': (context) => const NavBarRoots(),
        '/about': (context) => const AboutScreen(),

        // Home page...
        '/profile': (context) => const ProfileScreen(),
        '/upDateProfile': (context) => const UpdateProfile(),
        '/symptoms': (context) =>  const SymptomScreen(),
        '/topServices': (context) =>  const TopServices(),
        // about page...
        '/bookingScreen': (context) => const BookingScreen(),
        '/successBooking': (context) => const AppointmentBooked(),
      },
    );
  }
}
