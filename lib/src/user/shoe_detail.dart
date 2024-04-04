import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sneakers/src/admin/features/dashboard/domain/entities/shoe_entity.dart';
import 'package:sneakers/src/animations/animations.dart';
import 'package:sneakers/src/user/cart/bloc/cart_bloc.dart';
import 'package:sneakers/src/user/cart/view/cart.dart';
import 'package:sneakers/src/user/dashboard.dart';

class ShoeDetail extends StatefulWidget {
  ShoeDetail({required Shoe singleshoeDetail})
      : shoeDetail = singleshoeDetail;
  final Shoe shoeDetail;

  @override
  State<ShoeDetail> createState() => _ShoeDetailState();
}

class _ShoeDetailState extends State<ShoeDetail> {
  List<String> shoeSize = ["6.0", "7.0", "8.0", "9.0"];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text("Nike"),
        actions: [IconButton(onPressed: () => {}, icon: Icon(Icons.favorite))],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Hero(
                  tag: widget.shoeDetail.id,
                  child: Transform.rotate(
                      angle: -30 * (3.14 / 180),
                      child: Image.asset(
                        widget.shoeDetail.image,
                        height: size.height * 0.3,
                        width: size.width * 0.8,
                      ))),
              SizedBox(
                height: size.height * 0.05,
              ),
              FadeAnimation(
                  1,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color.fromARGB(255, 236, 235, 235),
                          ),
                          padding: EdgeInsets.all(3.0),
                          height: size.height * 0.09,
                          width: size.width * 0.2,
                          child: Image.asset(
                            widget.shoeDetail.image,
                          )),
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color.fromARGB(255, 236, 235, 235),
                          ),
                          padding: EdgeInsets.all(3.0),
                          height: size.height * 0.09,
                          width: size.width * 0.2,
                          child: Image.asset(
                            widget.shoeDetail.image,
                          )),
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color.fromARGB(255, 236, 235, 235),
                          ),
                          padding: EdgeInsets.all(3.0),
                          height: size.height * 0.09,
                          width: size.width * 0.2,
                          child: Image.asset(
                            widget.shoeDetail.image,
                          )),
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color.fromARGB(255, 236, 235, 235),
                          ),
                          padding: EdgeInsets.all(3.0),
                          height: size.height * 0.09,
                          width: size.width * 0.2,
                          child: Image.asset(
                            widget.shoeDetail.image,
                          )),
                    ],
                  )),
              SizedBox(
                height: size.height * 0.02,
              ),
              const Divider(
                height: 20,
                color: Colors.black,
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              FadeAnimation(
                  1.3,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.shoeDetail.model,
                        style: const TextStyle(
                            fontFamily: 'OpenSans',
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        "Euro " + widget.shoeDetail.price.toString(),
                        style: const TextStyle(
                            fontFamily: 'OpenSans',
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  )),
              SizedBox(
                height: size.height * 0.02,
              ),
              FadeAnimation(
                  1.6,
                   Text(
                    widget.shoeDetail.description,
                    style: TextStyle(fontFamily: 'OpenSans', fontSize: 15),
                  )),
              SizedBox(
                height: size.height * 0.02,
              ),
              FadeAnimation(
                  1.8,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Size",
                        style: TextStyle(
                            fontFamily: "OpenSans",
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          TextButton(
                              onPressed: () => {},
                              child: const Text(
                                "UK",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black)
                              )),
                          TextButton(
                              onPressed: () => {},
                              child: const Text(
                                "USA",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black)
                              ))
                        ],
                      ),
                    ],
                  )),
              SizedBox(
                height: size.height * 0.02,
              ),
              FadeAnimation(
                  1,
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: size.height * 0.08,
                        width: size.width * 0.27,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black, width: 1),
                        ),
                        child: const Row(
                          children: [
                            Text("Try it",
                                style: TextStyle(
                                    fontSize: 20, fontFamily: "OpenSans")),
                            Icon(Icons.shower)
                          ],
                        ),
                      ),
                      SizedBox(width: size.width * 0.02),
                      Expanded(
                        child: Container(
                          height: size.height * 0.08,
                          width: size.width * 0.9,
                          padding:
                              const EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: shoeSize.length,
                              itemBuilder: ((context, index) {
                                return Container(
                                    height: size.height * 0.08,
                                    width: size.width * 0.27,
                                    padding: const EdgeInsets.fromLTRB(
                                        0.0, 0.0, 10.0, 0.0),
                                    child: Container(
                                      height: size.height * 0.08,
                                      width: size.width * 0.27,
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: Colors.black, width: 1),
                                      ),
                                      child: Text(shoeSize[index],
                                          style: const TextStyle(
                                              fontSize: 20,
                                              fontFamily: "OpenSans")),
                                    ));
                              })),
                        ),
                      ),
                    ],
                  )),
              SizedBox(height: size.height * 0.02),
              FadeAnimation(2, addToBagButton(size))
            ],
          ),
        ),
      ),
    );
  }

  Widget addToBagButton(Size size) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return ElevatedButton(
          onPressed: () => {
            context
                .read<CartBloc>()
                .add(AddToCartEvent(shoe: widget.shoeDetail)),
            print(widget.shoeDetail.model),
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => CartPage()))
          },
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.33, vertical: size.height * 0.03),
              backgroundColor: Color.fromARGB(255, 241, 45, 45),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
          child: const Text(
            "ADD TO BAG",
            style: TextStyle(color: Colors.white, fontFamily: "OpenSans"),
          ),
        );
      },
    );
  }
}
