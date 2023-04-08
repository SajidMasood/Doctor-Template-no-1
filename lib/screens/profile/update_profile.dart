import 'package:doctor_appointment/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../constants/app_Images.dart';
import '../../widgets/widgets.dart';

class UpdateProfile extends StatelessWidget {
  const UpdateProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 50),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: const Image(
                        image: AssetImage(AppImage.doctor1 + "profile.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  //
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF7165D6),
                      ),
                      child: const Icon(
                        Icons.camera_alt_outlined,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),

              //
              const SizedBox(
                height: 20,
              ),
              Form(
                child: Column(
                  children: [
                    const MyInputField(
                      title: 'First Name',
                      hint: 'Enter Your First Name',
                      icon: Icons.person,
                    ),
                    const MyInputField(
                      title: 'Last Name',
                      hint: 'Enter Your Last Name',
                      icon: Icons.person_add,
                    ),
                    const MyInputField(
                      title: 'Email Address',
                      hint: 'Enter Your Email',
                      icon: Icons.mark_email_read,
                    ),
                    const MyInputField(
                      keyboardType: true,
                      title: 'Phone Number',
                      hint: 'Enter Your Phone Number',
                      icon: Icons.phone_callback,
                    ),
                    const MyInputField(
                      title: 'Password',
                      hint: 'Enter New Password',
                      icon: Icons.lock_person_sharp,
                    ),
                    const SizedBox(
                      height: 15,
                    ),

                    // ------------------------button-------------
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: Material(
                          color: AppColors.bgPurple,
                          borderRadius: BorderRadius.circular(10),
                          child: InkWell(
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //       builder: (context) => LoginScreen(),
                              //     ));
                            },
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 0),
                              child: Center(
                                child: Text(
                                  "Submit",
                                  style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 18,
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
            ],
          ),
        ),
      ),
    );
  }

  _appBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          //Get.back();
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back_ios),
      ),
      title: const Text('Edit Profile'),
      centerTitle: true,
      backgroundColor: AppColors.bgPurple,
    );
  }
}
