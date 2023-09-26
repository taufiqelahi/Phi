
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phi/backend/model/offer.dart';
import 'package:phi/backend/services/offer_func.dart';
import 'package:phi/component/button.dart';
import 'package:phi/utils/all_colors.dart';

class CustomCarousel extends StatefulWidget {

  final List<Offer> offers;
  const CustomCarousel({super.key, required this.offers});

  @override
  State<CustomCarousel> createState() => _CustomCarouselState();
}

class _CustomCarouselState extends State<CustomCarousel> {
  CarouselController carouselController=CarouselController();
  int current=0;
  @override
  Widget build(BuildContext context) {
    return  Column(
          children: [
            CarouselSlider(
              carouselController: carouselController,
              items: widget.offers.map((e) => Container(
                width: MediaQuery.of(context).size.width * .9,
                margin: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    Container(
                      height: 140,
                      margin: EdgeInsets.only(top: 10, right: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AllColors.whiteSmoke),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10, top: 10),
                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              text:
                              '${(e.discount * 100).toInt()}%',
                              style: GoogleFonts.workSans(
                                  textStyle: TextStyle(
                                      fontSize: 30,
                                      fontWeight:
                                      FontWeight.w600,
                                      color: AllColors.black)),
                              children: [
                                TextSpan(
                                    text: ' Discount\n',
                                    style: TextStyle(
                                        fontWeight:
                                        FontWeight.w600,
                                        fontSize: 20)),
                                TextSpan(
                                  text: 'on your first purchase',
                                  style: TextStyle(
                                    color: AllColors.black.withOpacity(0.7),
                                      fontSize: 14,
                                      fontWeight:
                                      FontWeight.w200),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          FillButton(
                              width: 140,
                              title: 'Shop now',
                              containerColor: AllColors.black,
                              onPressed: () {}),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Positioned(
                        right: 0,
                        top: 0,
                        child: Transform.translate(
                          offset: Offset(10,0),
                          child: Image.network(
                            '${e.image}',
                            fit: BoxFit.cover,
                            height: 180,
                            width: 240,
                          ),
                        )),
                  ],
                ),
              )).toList(),
              options: CarouselOptions(
                onPageChanged: (index, reason){
                  setState(() {
                    current=index;
                  });
                },
                viewportFraction: 1,
                aspectRatio: 2.2,
              ),
            ),
            // DotsIndicator(
            //
            //   onTap: (index){
            //     carouselController.animateToPage(index);
            //     setState(() {
            //
            //     });
            //   },
            //   mainAxisSize: MainAxisSize.min,
            //   position: current,
            //   decorator: DotsDecorator(activeColor: AllColors.black),
            //   dotsCount: widget.offers.length,
            // ),
          ],
        );
  }
}
