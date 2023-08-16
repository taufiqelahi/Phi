import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phi/backend/model/offer.dart';
import 'package:phi/backend/model/product.dart';
import 'package:phi/backend/services/offer_func.dart';
import 'package:phi/backend/services/produc_func.dart';
import 'package:phi/component/button.dart';
import 'package:phi/component/custom_carousel.dart';
import 'package:phi/component/label.dart';
import 'package:phi/component/product_view.dart';
import 'package:phi/utils/all_colors.dart';
import 'package:phi/utils/font_size.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {




  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initController();
  }

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
       FutureBuilder(
          future: OfferFunc().getAllOffer(),
        builder:
            (BuildContext context, AsyncSnapshot<List<Offer>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Container(height: 200,);
              }
              List<Offer> offers = snapshot.data ?? [];

              return CustomCarousel(offers: offers,);
            }),

        ProductView()

      ]),
    );
  }

  void initController() {}
}
