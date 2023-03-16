import 'package:d23_dyuksha/widgets/cyberpunk_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/cypberpunk_background_scaffold.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    const double pad_btw = 30.0;
    const carousel_list = [
      AssetImage("assets/images/workshop1.jpg"),
      AssetImage("assets/images/workshop2.jpg"),
      AssetImage("assets/images/workshop3.jpg"),
      AssetImage("assets/images/workshop4.jpg"),
      AssetImage("assets/images/workshop5.jpg"),
      AssetImage("assets/images/workshop6.jpg"),
      AssetImage("assets/images/workshop7.jpg")
    ];
    return CyberpunkBackgroundScaffold(
      child: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: pad_btw,
              ),
              Image(
                image: AssetImage("assets/images/d23_logo_text.png"),
                width: width * 0.5,
              ),
              SizedBox(
                height: pad_btw,
              ),
              Image(
                image: AssetImage("assets/images/ks_harishankar.jpg"),
                width: width * 0.8,
              ),
              SizedBox(
                height: pad_btw,
              ),
              Expanded(
                child: Container(
                    child: Column(
                  children: [
                    CyberpunkButton(
                      color: Colors.red,
                      label: 'Book Now',
                      onTap: () {},
                    ),
                    Text(
                      'Department',
                      style: GoogleFonts.chakraPetch(
                          fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: pad_btw,
                    ),
                    CarouselSlider.builder(
                      itemCount: carousel_list.length,
                      options: CarouselOptions(
                          height: 200.0,
                          enlargeCenterPage: true,
                          enlargeFactor: 0.5,
                          viewportFraction: 0.5),
                      itemBuilder: (BuildContext context, int itemIndex,
                          int pageViewIndex) {
                        print("$pageViewIndex,$itemIndex");
                        return Container(
                            width: width * 0.8,
                            margin: EdgeInsets.symmetric(horizontal: 2.0),
                            child: Image(image: carousel_list[itemIndex]));
                      },
                    ),
                  ],
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
