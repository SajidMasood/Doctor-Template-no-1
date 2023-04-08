import 'package:doctor_appointment/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  //___________________ Var Sec __________________
  final _formkey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
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
                // __________________ header Image ____________
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Image.asset("assets/images/doctors.png"),
                ),
                // __________________Name TextFormField ____________
                const SizedBox(height: 15),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                  child: TextFormField(
                    controller: _nameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter Full Name";
                      }
                    },
                    decoration: const InputDecoration(
                      labelText: "Full Name",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
                ),

                // __________________Email TextFormField ____________
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                  child: TextFormField(
                    controller: _emailController,
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
                    decoration: const InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email),
                    ),
                  ),
                ),

                // __________________Phone TextFormField ____________
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                  child: TextFormField(
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter Valid Phone Number";
                      }
                    },
                    decoration: const InputDecoration(
                      labelText: "Phone Number",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.phone),
                    ),
                  ),
                ),

                // __________________Pass TextFormField ____________
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                  child: TextFormField(
                    controller: _passController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter Password";
                      } else if (_passController.text.length < 6) {
                        return "Password length should not be less then 6 characters";
                      }
                    },
                    obscureText: passToggle ? true : false,
                    decoration: InputDecoration(
                      labelText: "Email Password",
                      border: const OutlineInputBorder(),
                      prefixIcon: const Icon(Icons.person),
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
                  ),
                ),

                // __________________Create Account Button _________
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(10.0),
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
                              "Create Account",
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

                // __________________Already have an account ? _________
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account?",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/login');
                      },
                      child: const Text(
                        "Log in",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.bgPurple,
                        ),
                      ),
                    ),
                  ],
                ),

                // __________________ ____________
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _validateData() {
    if (_formkey.currentState!.validate()) {
      Navigator.pushReplacementNamed(context, '/navbar');

      print("__________________Success____________________");
      _nameController.clear();
      _emailController.clear();
      _phoneController.clear();
      _passController.clear();
    }
  }
}
