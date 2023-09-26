import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:phi/backend/model/product.dart';
import 'package:phi/backend/services/produc_func.dart';
import 'package:phi/component/button.dart';
import 'package:phi/component/label.dart';
import 'package:phi/screen/add_cart.dart';
import 'package:phi/utils/all_colors.dart';
import 'package:phi/utils/font_size.dart';

class ProductView extends StatefulWidget {
  const ProductView({super.key});

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  List<String> categories = ["All", "Running", "Sneakers", "Formal", "Casual"];
  String selectedCategory = "All";
  ScrollController scrollController= ScrollController();
  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: Column(
        children: [
          SizedBox(
              height: 80,

              child: ListView.builder(
padding: EdgeInsets.only(left: 24),
                addAutomaticKeepAlives: true,
                controller: scrollController,
              addRepaintBoundaries: true,
                itemCount: categories.length,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shrinkWrap: true,

                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: FillButton(
                        pressedOpacity: 0.8,
                        title: categories[index],
                        textColor: selectedCategory == categories[index]
                            ? AllColors.white
                            : AllColors.gray61,
                        fontSize: FontSize.p1,
                        fontWeight: FontWeight.bold,
                        containerColor: selectedCategory == categories[index]
                            ? AllColors.black
                            : Colors.transparent,
                        onPressed: () {
                           double offset=(categories[index].length*2+(index-1)*70);
                          selectedCategory = categories[index];
                          scrollController.animateTo(offset, duration: Duration(milliseconds: 200), curve: Curves.easeOut);
                          setState(() {

                          });
                        }),
                  );
                },
              )),
          StreamBuilder(
              stream: ProductFunc().getAllProducts(category: selectedCategory),
              builder:
                  (BuildContext context, AsyncSnapshot<List<Product>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                }
                List<Product> products = snapshot.data ?? [];
                return Expanded(
                  child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: .7,
                      children: products
                          .map((product) => Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        margin: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AllColors.whiteSmoke),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 150,
                              height: 150,
                              child: Image.network(
                                  fit: BoxFit.cover, '${product.image}'),
                            ),
                            Label(
                              text: product.title,
                              fontSize: FontSize.p1,
                              fontWeight: FontWeight.bold,
                            ),
                            Row(
                              children: [
                                Label(
                                  text: '\$${product.price}',
                                  fontSize: FontSize.p1,
                                ),
                                Spacer(),
                                CupertinoButton(
                                    padding: EdgeInsets.zero,
                                    child: SvgPicture.asset(
                                        'assets/arrowForword.svg'),
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>AddCart(productId: product.id,)));
                                    })
                              ],
                            ),
                          ],
                        ),
                      ))
                          .toList()),
                );
              })
        ],
      ),
    );
  }
}
