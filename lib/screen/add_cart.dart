import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:phi/backend/get/controller/cart_item_count_controller.dart';
import 'package:phi/backend/model/product.dart';
import 'package:phi/backend/model/shoe_utility.dart';
import 'package:phi/backend/services/produc_func.dart';
import 'package:phi/backend/services/utility_func.dart';
import 'package:phi/component/label.dart';
import 'package:phi/screen/dashboard/home_screen.dart';
import 'package:phi/utils/all_colors.dart';
import 'dart:math' as math;

class AddCart extends StatefulWidget {
  const AddCart({super.key, required this.productId});

  final String productId;

  @override
  State<AddCart> createState() => _AddCartState();
}

class _AddCartState extends State<AddCart> {
  bool isAdded = false;

  final CartItemCountController cartItemCountController=Get.put(CartItemCountController());
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: ProductFunc().getAProduct(productId: widget.productId),
      builder: (BuildContext context, AsyncSnapshot<Product> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        final Product product = snapshot.data!;
        return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Label(
                text: product.title,
              ),
              leading: Center(
                child: Container(
                  height: 34,
                  width: 36,
                  decoration: BoxDecoration(
                      border: Border.all(color: AllColors.paleBlue),
                      borderRadius: BorderRadius.circular(10)),
                  child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder:(_) =>HomeScreen()));
                      },
                      icon: Icon(
                        Icons.keyboard_backspace,
                        size: 20,
                      )),
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 34,
                    width: 36,
                    decoration: BoxDecoration(
                        border: Border.all(color: AllColors.paleBlue),
                        borderRadius: BorderRadius.circular(10)),
                    child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          if (isAdded == true) {
                            showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return ListView.builder(itemCount: cartItemCountController.count.toInt(), itemBuilder: (BuildContext context, int index) {

                                  return Container(
                                    decoration: BoxDecoration(border: Border.all(color: AllColors.paleBlue)),
                                      child: Image.network(product.image,height: 100,));
                                }, );
                              },
                            );
                          }
                        },
                        icon: Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Icon(
                              Icons.card_travel,
                              size: 20,
                            ),
                            Transform.translate(
                              offset: Offset(4,-4),
                                child: Label(
                              text: cartItemCountController.count.string,
                              fontSize: 12,
                            ))
                          ],
                        )),
                  ),
                ),
              ],
            ),
            body: StreamBuilder(
              stream: UtilityFunc().getShoeUtilityStream(),
              builder:
                  (BuildContext context, AsyncSnapshot<ShoeUtility> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.data == null) {
                  return SizedBox();
                }
                ShoeUtility shoeUtility = snapshot.data!;
                return Row(
                  children: [
                    Container(
                      width: 100,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Label(
                              text: 'Size',
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                            Column(
                              children: shoeUtility.formatedSizes
                                  .map((size) => Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          height: 40,
                                          width: 60,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(14),
                                              border: Border.all(
                                                  color: product.size == size
                                                      ? AllColors.black
                                                      : AllColors.paleBlue)),
                                          child: Center(
                                            child: Label(
                                              text: 'UK ${size.toString()}',
                                            ),
                                          ),
                                        ),
                                      ))
                                  .toList(),
                            ),
                            SizedBox(
                              height: 100,
                            ),
                            Label(
                              text: '\$${product.price.toString()}',
                              fontWeight: FontWeight.w600,
                              fontSize: 23,
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Transform.translate(
                            offset: Offset(40, 0),
                            child: RotatedBox(
                                quarterTurns: -3,
                                child: Label(
                                  align: TextAlign.center,
                                  text: "NIKE",
                                  fonts: Fonts.popins,
                                  color: AllColors.black.withOpacity(0.1),
                                  fontSize: 180,
                                  fontWeight: FontWeight.w900,
                                  fontStyle: FontStyle.italic,
                                )),
                          ),
                          Draggable(
                            data: product.image,
                            feedback: Image.network(
                              product.image,
                              width: 100,
                              height: 100,
                            ),
                            child: Transform.translate(
                              offset: Offset(-24, -12),
                              child: Transform.scale(
                                scale: 2.1,
                                child: Transform.rotate(
                                    angle: 340 * math.pi / 180,
                                    child: Image.network(product.image)),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 36,
                            width: 36,
                            decoration: BoxDecoration(
                              border: Border.all(color: AllColors.paleBlue),
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: IconButton(
                              onPressed: () {},
                              icon: SvgPicture.asset('assets/bookmark.svg'),
                            ),
                          ),
                          SizedBox(
                            height: 180,
                          ),
                          Column(
                            children: shoeUtility.getColors
                                .map((e) => Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: 36,
                                        width: 36,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: AllColors.paleBlue),
                                          borderRadius:
                                              BorderRadius.circular(14),
                                        ),
                                        child: Center(
                                          child: Container(
                                            height: 16,
                                            width: 16,
                                            decoration: BoxDecoration(
                                                color: e,
                                                borderRadius:
                                                    BorderRadius.circular(3)

                                                // border: Border.all(color: AllColors.lightAsh)

                                                ),
                                          ),
                                        ),
                                      ),
                                    ))
                                .toList(),
                          )
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
            bottomNavigationBar: DragTarget(
              builder: (BuildContext context, List<Object?> candidateData,
                  List<dynamic> rejectedData) {
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                        //color: candidateData.isEmpty?AllColors.black:AllColors.blue,

                        child: Image.asset('assets/cartitem.png')),
                    isAdded
                        ? Image.network(
                            product.image,
                            width: 100,
                            height: 100,
                          )
                        : Label(text: 'Add your item')
                  ],
                );
              },
              onWillAccept: (data) {
                return true;
              },
              onAccept: (data) {
                debugPrint('hi ${product.title}');

                cartItemCountController.addItem();
                //data=product.image;
                setState(() {
                  isAdded = true;
                });
              },
            ));
      },
    );
  }
}
