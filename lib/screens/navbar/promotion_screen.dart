import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class PromotionScreen extends StatelessWidget {
  const PromotionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bg9.jpg"),
              fit: BoxFit.cover,
            ),
          ),

          //
          child: SingleChildScrollView(
            child: CarouselSlider(
              items: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (_) => ImageDialog(
                                  'https://picsum.photos/id/240/200/300'));
                        },
                        child: Center(
                          child: Image.asset(
                            'assets/images/doctor1.jpg',
                            height: MediaQuery.of(context).size.height / 1.9,
                            width: MediaQuery.of(context).size.width,
                          ),
                        ),
                      ),
                      Center(
                        child: Column(
                          children: [
                            const SizedBox(height: 30),
                            Text(
                              "Stay hydrated by drinking plenty of water throughout the day.",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 124, 20, 20),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 23.0),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Container(
                                    height:
                                        MediaQuery.of(context).size.height / 2,
                                    child: SingleChildScrollView(
                                        child: Text(
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16.0,
                                              height: 2,
                                            ),
                                            "\"Need a doctor\" is a phrase commonly used to express a desire or urgent requirement for medical attention or assistance. It implies that someone is experiencing physical or mental distress and requires the expertise and intervention of a qualified medical professional. It can be a serious matter and may indicate a medical emergency or a long-term health issue that needs attention. Seeking medical help when needed is essential for maintaining good health and preventing potential complications.")))),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ImageDialog extends StatelessWidget {
  ImageDialog(this.imgUrl);

  final String imgUrl;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: MediaQuery.of(context).size.height / 1.5,
        child: Center(
          child: Image.network(
            fit: BoxFit.fill,
            imgUrl,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
        ),
      ),
    );
  }
}
