import 'package:doctor_appointment/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // ________________________ Var Sec ___________
  final _formkey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  bool passToggle = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                // ________________________ Header Image ___________

                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Image.asset("assets/images/doctors.png"),
                ),

                const SizedBox(height: 10),
                // ________________Email Text Input Field___________
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                  child: TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    obscureText: passToggle ? false : true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Enter Username"),
                      prefixIcon: Icon(Icons.person),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter Email / User Name";
                      }
                      final bool emailValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value);
                      if (!emailValid) {
                        return "Enter Valid Email";
                      }
                    },
                  ),
                ),
                // ________________Pass Text Input Field___________
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                  child: TextFormField(
                    controller: _passController,
                    obscureText: passToggle ? true : false,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      label: const Text("Enter Password"),
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: InkWell(
                        onTap: () {
                          if (passToggle == true) {
                            passToggle = false;
                          } else {
                            passToggle = true;
                          }
                          setState(() {});
                        },
                        child: passToggle
                            ? const Icon(CupertinoIcons.eye_slash_fill)
                            : const Icon(CupertinoIcons.eye_fill),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter Password";
                      } else if (_passController.text.length < 6) {
                        return "Password length should not be less then 6 characters";
                      }
                    },
                  ),
                ),
                const SizedBox(height: 20),
                // ________________ Login Button ___________
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20),
                  child: SizedBox(
                    width: double.infinity,
                    child: Material(
                      color: AppColors.bgPurple,
                      borderRadius: BorderRadius.circular(10),
                      child: InkWell(
                        onTap: () {
                          _validateData();
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 14, horizontal: 40),
                          child: Center(
                            child: Text(
                              "Log in",
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // ________________ Create an Account ___________
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Item No 1 text Don't have any account
                    const Text(
                      "Don't have any account?",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54,
                      ),
                    ),
                    // Item No 2 Text Button create an account
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/signup');
                      },
                      child: const Text(
                        "Create Account",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.bgPurple,
                        ),
                      ),
                    ),
                  ],
                ),

                // ________________ Create an Account ___________
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _validateData() {
    if (_formkey.currentState!.validate()) {
      //Get.to(NavBarRoots());
      Navigator.pushReplacementNamed(context, '/navbar');
      print("__________________Success____________________");
      _emailController.clear();
      _passController.clear();
    }
  }
}
