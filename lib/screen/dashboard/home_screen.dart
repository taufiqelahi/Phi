import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phi/component/button.dart';
import 'package:phi/component/label.dart';
import 'package:phi/utils/all_colors.dart';
import 'package:phi/utils/font_size.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Image> imageList = [];

  int current = 0;

  final CarouselController controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
            icon: SvgPicture.asset(
              'assets/drawer.svg',
              fit: BoxFit.cover,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          );
        }),
        title: Row(
          children: [
            InkWell(
              child: Image.asset("assets/nike.png"),
              onTap: () {},
            ),
            const Spacer(),
            InkWell(
              child: Image.asset("assets/shopping.png"),
              onTap: () {},
            ),
          ],
        ),
      ),
      drawer: const Drawer(
        width: 120,
      ),
      body: Column(children: [
        CarouselSlider(
          carouselController: controller,
          items: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AllColors.whiteSmoke),
              width: 400,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Wrap(
                  direction: Axis.vertical,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: RichText(
                        text: TextSpan(
                            text: '20%',
                            style: GoogleFonts.workSans(
                                textStyle: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                    color: AllColors.black)
                            ),

                          children: [
                            TextSpan(
                                text: ' Discount',
                                style: TextStyle(fontWeight: FontWeight.normal,fontSize: 30)
                            )
                          ],
                        ),
                      ),
                    ),
                    const Label(
                      text: 'on your first purchase',
                      fonts: Fonts.workSans,
                      fontSize: 14,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    FillButton(title: 'Shop now',containerColor: AllColors.black, onPressed: () {}),
                    Transform.translate(
                        offset: Offset(-70, -15),
                        child: Image.asset('assets/greenShoe.png'))
                  ],
                ),
              ),
            )
          ],
          options: CarouselOptions(
              viewportFraction: 1,
              height: 180,
              onPageChanged: (index, reason) {
                setState(() {
                  current = index;
                });
              }),
        ),
        DotsIndicator(
          decorator: DotsDecorator(
            activeColor: AllColors.black
          ),
          dotsCount: 7,
          position: current,
        )
        // InkWell(
        //   onTap: () {
        //     controller.nextPage(
        //         duration: const Duration(milliseconds: 300), curve:   Curves.linear);
        //   },
        //   child:
        //
        //   Container(
        //     height: 40,
        //     width: 40,
        //     decoration: BoxDecoration(
        //       shape: BoxShape.circle,
        //       color: Color(0xff000000),
        //     ),
        //   ),
        // ),
      ]),
    );
  }
}