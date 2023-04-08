import 'package:doctor_appointment/constants/app_Images.dart';
import 'package:doctor_appointment/constants/colors.dart';
import 'package:flutter/material.dart';

import 'profile_menu_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 50),
          child: Column(
            children: [
              //__________________ Stack____________________________
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
                        Icons.edit,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
              //__________________End Stack____________________________
              const SizedBox(height: 10),
              Text(
                'User Name ',
                style: Theme.of(context).textTheme.headline5,
              ),
              const SizedBox(height: 5),
              Text(
                'abc@gmail.com',
                style: Theme.of(context).textTheme.bodyText2,
              ),
              const SizedBox(height: 20),
              //__________________Edit Profile Button___________________
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.bgPurple,
                    side: BorderSide.none,
                    shape: const StadiumBorder(),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/upDateProfile');
                  },
                  child: const Text('Edit Profile'),
                ),
              ),
              const SizedBox(height: 30),

              //__________________ Divider ____________________________
              const Divider(),
              const SizedBox(height: 10),
              //__________________Start menu____________________________
              ProfileMenuWidget(
                boxColor: Colors.deepPurple.shade100,
                icon: Icons.notifications_none_outlined,
                title: 'Notifications',
                iconColor: Colors.deepPurple,
                onPress: () {},
              ),
              SizedBox(
                height: 5,
              ),
              ProfileMenuWidget(
                  title: 'Privacy',
                  icon: Icons.privacy_tip_outlined,
                  onPress: () {},
                  boxColor: Colors.indigo.shade100,
                  iconColor: Colors.indigo),
              Divider(),
              SizedBox(
                height: 10,
              ),
              ProfileMenuWidget(
                title: 'About Us',
                icon: Icons.info_outline_rounded,
                onPress: () {},
                boxColor: Colors.orange.shade100,
                iconColor: Colors.orange,
              ),
              ProfileMenuWidget(
                boxColor: Colors.redAccent.shade100,
                icon: Icons.logout,
                title: 'Log Out',
                iconColor: Colors.redAccent,
                onPress: () {},
                endIcon: false,
                textColor: Colors.red,
              ),
              //__________________End menu____________________________
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
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back_ios),
      ),
      title: const Text('Profile'),
      centerTitle: true,
      backgroundColor: AppColors.bgPurple,
    );
  }
}
