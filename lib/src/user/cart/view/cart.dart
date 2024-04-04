import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sneakers/core/services/injection_dependency.dart';
import 'package:sneakers/src/admin/features/dashboard/domain/entities/shoe_entity.dart';

import 'package:sneakers/src/animations/animations.dart';
import 'package:sneakers/src/bottomPage/bottom_items_list.dart';
import 'package:sneakers/src/bottomPage/common_bottom_bar.dart';
import 'package:sneakers/src/user/cart/bloc/cart_bloc.dart';
import 'package:sneakers/src/user/dashboard.dart';
import 'package:sneakers/src/user/profile/profile.dart';

class CartPage extends StatefulWidget {
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int selectedIndex = 1;
  @override
  void initState() {
    getCartItems();
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
    if (selectedIndex == 0) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Dashboard()));
    } else if (selectedIndex == 1) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => CartPage()));
    } else if (selectedIndex == 2) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Profile()));
    }
  }

  void getCartItems() {
    context.read<CartBloc>().add(GettingCartItemsEvent());
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 238, 237, 237),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          return state is CartGetting
              ? CircularProgressIndicator()
              : state is CartLoaded
                  ? state.shoe.length == 0
                      ? const Center(
                          child: Text(
                            "There is no item in your cart",
                            style:
                                TextStyle(fontFamily: "OpenSans", fontSize: 20),
                          ),
                        )
                      : Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 12.0),
                              padding: EdgeInsets.fromLTRB(8.0, 12.0, 8.0, 8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "My Bug ",
                                    style: TextStyle(
                                        fontFamily: "Quicksand",
                                        fontSize: 30,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    "Total " +
                                        state.shoe.length.toString() +
                                        " Items",
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontFamily: "Quicksand",
                                        fontWeight: FontWeight.w700),
                                  )
                                ],
                              ),
                            ),
                            Divider(
                              height: size.height * 0.01,
                            ),
                            Container(
                              margin: EdgeInsets.all(0.0),
                              height: size.height * 0.7,
                              child: ListView.builder(
                                // List<ColorImageModel> shoes = state.shoe.[index];

                                itemCount: state.shoe.length,
                                itemBuilder: (context, index) {
                                  final Shoe shoe = state.shoe[index];
                                  int selectedAmount = 1;
                                  return FadeAnimation(
                                      1.2,
                                      ListTile(
                                        horizontalTitleGap: size.width * 0.08,
                                        leading: Container(
                                          // color: const Color.fromARGB(255, 236, 235, 235),
                                          height: size.height * 0.5,
                                          width: size.width * 0.2,
                                          child: Transform.rotate(
                                            angle: -35 * (3.14 / 180),
                                            child: Image.asset(
                                              shoe.image,
                                            ),
                                          ),
                                        ),
                                        title: Text(
                                          shoe.model,
                                          style: const TextStyle(
                                            fontFamily: "OpenSans",
                                          ),
                                        ),
                                        subtitle: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Euro " + shoe.price.toString(),
                                              textAlign: TextAlign.start,
                                              style: const TextStyle(
                                                  fontFamily: "OpenSans",
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20),
                                            ),
                                            SizedBox(
                                              height: size.height * 0.01,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  height: size.height * 0.045,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: Color.fromARGB(
                                                        255, 240, 230, 230),
                                                  ),
                                                  child: IconButton(
                                                    onPressed: () => {
                                                      setState(() {
                                                        selectedAmount--;
                                                      }),
                                                      print(selectedAmount)
                                                    },
                                                    icon: Icon(
                                                      Icons.remove,
                                                    ),
                                                    iconSize:
                                                        size.height * 0.03,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: size.width * 0.02,
                                                ),
                                                Text(
                                                  selectedAmount.toString(),
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 20),
                                                ),
                                                SizedBox(
                                                  width: size.width * 0.02,
                                                ),
                                                Container(
                                                  height: size.height * 0.045,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: Color.fromARGB(
                                                        255, 240, 230, 230),
                                                  ),
                                                  child: IconButton(
                                                    onPressed: () => {
                                                      setState(() {
                                                        selectedAmount +=
                                                            selectedAmount;
                                                      }),
                                                      print(selectedAmount)
                                                    },
                                                    icon: Icon(
                                                      Icons.add,
                                                    ),
                                                    iconSize:
                                                        size.height * 0.03,
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        trailing: IconButton(
                                          onPressed: () => {
                                            context.read<CartBloc>().add(
                                                DeleteFromCartEvent(
                                                    id: shoe.id))
                                          },
                                          icon: const Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ));
                                },
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: FadeAnimation(
                                    2,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          "Total",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontFamily: "QuickSans",
                                              fontWeight: FontWeight.w700),
                                        ),
                                        Text(
                                          "Euro " + state.totalPrice.toString(),
                                          style: const TextStyle(
                                              fontSize: 20,
                                              fontFamily: "QuickSans",
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ],
                                    )),
                              ),
                            ),
                            // SizedBox(height: size.height*0.02,),
                            ElevatedButton(
                              onPressed: () => {},
                              child: const Text(
                                "Check out",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "OpenSans"),
                              ),
                              style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: size.width * 0.35,
                                      vertical: size.height * 0.025),
                                  backgroundColor:
                                      Color.fromARGB(255, 241, 45, 45),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                          ],
                        )
                  : const Text("no state");
        },
      ),
      bottomNavigationBar: CommonBottomBar(
        items: bottomBarItems,
        currentIndex: selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
