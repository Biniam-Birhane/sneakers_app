import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sneakers/src/admin/features/dashboard/domain/entities/shoe_entity.dart';
import 'package:sneakers/src/admin/features/dashboard/presentation/bloc/shoe_bloc.dart';
import 'package:sneakers/src/animations/animations.dart';
import 'package:sneakers/src/bottomPage/bottom_items_list.dart';
import 'package:sneakers/src/bottomPage/common_bottom_bar.dart';
import 'package:sneakers/src/user/cart/view/cart.dart';
import 'package:sneakers/src/user/profile/profile.dart';
import 'package:sneakers/src/user/shoe_detail.dart';
import 'package:sneakers/src/user/tab_bar.dart';

class Dashboard extends StatefulWidget {
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    super.initState();
    context.read<ShoeBloc>().add(GetShoesEvent());
  }

  int selectedIndex = 0;
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

  List<String> brandChoice = [
    'Nike',
    'Adidas',
    'Jordan',
    'Puma',
    'Gucci',
    'Tom Ford',
    'Kolo'
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 238, 237, 237),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 235, 234, 234),
        title: const Text(
          "Discover",
          style: TextStyle(
            fontSize: 25,
            fontFamily: 'Quicksand',
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
          ),
        ],
      ),
      body: BlocConsumer<ShoeBloc, ShoeState>(
        listener: (context, state) {
          if (state is ShoeAdded) {
            context.read<ShoeBloc>().add(GetShoesEvent());
          }
        },
        builder: (context, state) {
          return state is GettingShoes
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : state is ShoesLoaded
                  ? _buildTabBarView()
                  : Text("no state");
        },
      ),
      bottomNavigationBar: CommonBottomBar(
        items: bottomBarItems,
        currentIndex: selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildTabBarView() {
    return DefaultTabController(
      length: brandChoice.length, // Define the number of tabs
      child: Column(
        children: [
          TabBar(
            indicatorPadding: EdgeInsets.zero,
            isScrollable: true,
            
            tabs: List.generate(
              brandChoice.length, // Generate tabs based on brandChoice length
              (index) => Container(
                child: Tab(
                  child: Text(
                    brandChoice[index],
                    style:
                        TextStyle(fontFamily: "Quicksand-Bold", fontSize: 20),
                  ),
                ),
              ), // Create a tab for each brand
            ),
          ),
          Expanded(
            child: TabBarView(
              children: List.generate(
                brandChoice.length, // Generate content for each tab
                (index) => _buildTabContent(
                    'Tab ${index + 1} Content'), // Placeholder content
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabContent(String content) {
    return Center(
      child: Text(content), // Your content for each tab
    );
  }

  // Padding secondShoeList(Size size, List<Shoe> shoes) {
  //   return Padding(
  //     padding: const EdgeInsets.all(8.0),
  //     child: Container(
  //       height: size.height * 0.25,
  //       child: ListView.builder(
  //           scrollDirection: Axis.horizontal,
  //           itemCount: shoes.length,
  //           itemBuilder: ((context, index) {
  //             // print(shoes[index].price);
  //             return Padding(
  //               padding: const EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
  //               child: Stack(
  //                 children: [
  //                   Container(
  //                     width: size.width * 0.5,
  //                     decoration: BoxDecoration(
  //                         borderRadius: BorderRadius.circular(10),
  //                         color: Colors.white),
  //                   ),
  //                   Positioned(
  //                       top: 10,
  //                       left: 10,
  //                       child: FadeAnimation(
  //                           1.3,
  //                           Container(
  //                             padding: const EdgeInsets.symmetric(
  //                                 horizontal: 8.0, vertical: 16.0),
  //                             color: const Color.fromARGB(255, 235, 21, 6),
  //                             child: const RotatedBox(
  //                               quarterTurns: -1,
  //                               child: Text(
  //                                 "NEW",
  //                                 style: TextStyle(color: Colors.white),
  //                               ),
  //                             ),
  //                           ))),
  //                   Positioned(
  //                       top: 10,
  //                       right: 10,
  //                       child: FadeAnimation(
  //                         1.3,
  //                         const Icon(
  //                           Icons.favorite,
  //                           color: Colors.black,
  //                           size: 24,
  //                         ),
  //                       )),
  //                   Positioned(
  //                       top: size.height * 0.07,
  //                       left: size.width * 0.05,
  //                       child: FadeAnimation(
  //                           1.6,
  //                           GestureDetector(
  //                             onTap: () => {
  //                               Navigator.push(
  //                                   context,
  //                                   MaterialPageRoute(
  //                                     builder: (context) => ShoeDetail(
  //                                         singleshoeDetail: shoes[index]),
  //                                   ))
  //                             },
  //                             child: Transform.rotate(
  //                               angle: -20 * (3.14 / 180),
  //                               child: Hero(
  //                                 tag: "${shoes[index].id}+2",
  //                                 child: Image.asset(
  //                                   shoes[index].image,
  //                                   height: size.height * 0.09,
  //                                 ),
  //                               ),
  //                             ),
  //                           ))),
  //                   Positioned(
  //                       top: size.height * 0.18,
  //                       left: size.width * 0.13,
  //                       child: FadeAnimation(
  //                           1.8,
  //                           Text(
  //                             shoes[index].model,
  //                             style: const TextStyle(
  //                               color: Colors.black,
  //                               fontFamily: 'OpenSans',
  //                               fontSize: 15,
  //                             ),
  //                           ))),
  //                   Positioned(
  //                       top: size.height * 0.21,
  //                       left: size.width * 0.13,
  //                       child: FadeAnimation(
  //                           2,
  //                           Text(
  //                             "Euro " + shoes[index].price.toString(),
  //                             style: const TextStyle(
  //                               color: Colors.black,
  //                               fontFamily: 'Quicksand',
  //                               fontSize: 18,
  //                               fontWeight: FontWeight.bold,
  //                             ),
  //                           ))),
  //                 ],
  //               ),
  //             );
  //           })),
  //     ),
  //   );
  // }

  // Padding more(Size size) {
  //   return Padding(
  //     padding: const EdgeInsets.fromLTRB(15.0, 0.0, 10.0, 0.0),
  //     child: Row(
  //       children: [
  //         Expanded(
  //             child: Text(
  //           "More",
  //           style: TextStyle(
  //               fontFamily: 'OpenSans',
  //               fontSize: size.height * 0.03,
  //               fontWeight: FontWeight.bold),
  //         )),
  //         IconButton(
  //             onPressed: () => {},
  //             icon: const Icon(Icons.arrow_forward),
  //             iconSize: size.height * 0.04)
  //       ],
  //     ),
  //   );
  // }

  // Expanded shoeLists(Size size, List<Shoe> shoes) {
  //   return Expanded(
  //     child: Container(
  //       padding: const EdgeInsets.all(8.0),
  //       height: size.height * 0.42,
  //       child: ListView.builder(
  //         scrollDirection: Axis.horizontal,
  //         itemCount: shoes.length,
  //         itemBuilder: (context, index) {
  //           return Padding(
  //               padding: const EdgeInsets.all(10.0),
  //               child: Stack(
  //                 children: [
  //                   Container(
  //                     height: size.height * 0.5,
  //                     width: size.width * 0.65,
  //                     decoration: BoxDecoration(
  //                       borderRadius: BorderRadius.circular(30),
  //                       color: shoes[index].backGroundColor,
  //                     ),
  //                   ),
  //                   Positioned(
  //                       top: 10,
  //                       left: 10,
  //                       child: FadeAnimation(
  //                         1.4,
  //                         const Text(
  //                           'NIKE',
  //                           style: TextStyle(
  //                             color: Colors.white,
  //                             fontFamily: 'Quicksand',
  //                             fontSize: 16,
  //                             fontWeight: FontWeight.bold,
  //                           ),
  //                         ),
  //                       )),
  //                   Positioned(
  //                       top: 10,
  //                       right: 60,
  //                       child: FadeAnimation(
  //                         1.4,
  //                         const Icon(
  //                           Icons.favorite,
  //                           color: Colors.white,
  //                           size: 24,
  //                         ),
  //                       )),
  //                   Positioned(
  //                       top: 40,
  //                       left: 10,
  //                       child: FadeAnimation(
  //                           1.7,
  //                           Text(
  //                             shoes[index].model,
  //                             style: const TextStyle(
  //                               color: Colors.white,
  //                               fontFamily: 'Quicksand',
  //                               fontSize: 16,
  //                               fontWeight: FontWeight.bold,
  //                             ),
  //                           ))),
  //                   Positioned(
  //                       top: 70,
  //                       left: 10,
  //                       child: FadeAnimation(
  //                           1.8,
  //                           Text(
  //                             "Euro " + shoes[index].price.toString(),
  //                             style: const TextStyle(
  //                               color: Colors.white,
  //                               fontFamily: 'Quicksand',
  //                               fontSize: 16,
  //                               fontWeight: FontWeight.bold,
  //                             ),
  //                           ))),
  //                   Positioned(
  //                       child: FadeAnimation(
  //                     2,
  //                     Transform.rotate(
  //                       angle: -30 * (3.14 / 180), // Convert degrees to radians
  //                       child: GestureDetector(
  //                         onTap: () => {
  //                           Navigator.push(
  //                               context,
  //                               MaterialPageRoute(
  //                                 builder: (context) => ShoeDetail(
  //                                     singleshoeDetail: shoes[index]),
  //                               ))
  //                         },
  //                         child: Hero(
  //                           tag: shoes[index].id,
  //                           child: Image.asset(
  //                             shoes[index].image,
  //                             width: 280,
  //                             height: 400,
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //                   )),
  //                   Positioned(
  //                       top: size.height * 0.33,
  //                       left: size.width * 0.5,
  //                       child: const Icon(
  //                         Icons.arrow_forward_rounded,
  //                         color: Colors.white,
  //                         size: 30,
  //                       ))
  //                 ],
  //               ));
  //         },
  //       ),
  //     ),
  //   );
  // }

  // Container timingOfShoe() {
  //   return Container(
  //     alignment: Alignment.topLeft,
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.start,
  //       children: [
  //         Padding(
  //           padding: const EdgeInsets.symmetric(vertical: 8.0),
  //           child: TextButton(
  //             onPressed: () => {},
  //             style: TextButton.styleFrom(
  //               textStyle: const TextStyle(
  //                 fontFamily: 'OpenSans-Bold',
  //                 fontSize: 20,
  //               ),
  //             ),
  //             child: const RotatedBox(
  //               quarterTurns: -1,
  //               child: Text(
  //                 "Upcoming",
  //                 style: TextStyle(color: Colors.black),
  //               ),
  //             ),
  //           ),
  //         ),
  //         Padding(
  //           padding: const EdgeInsets.symmetric(vertical: 8.0),
  //           child: TextButton(
  //             onPressed: () {
  //               Navigator.push(context,
  //                   MaterialPageRoute(builder: (context) => TabBarPage()));
  //             },
  //             style: TextButton.styleFrom(
  //               textStyle: const TextStyle(
  //                 fontFamily: 'OpenSans-Bold',
  //                 fontSize: 20,
  //               ),
  //             ),
  //             child: const RotatedBox(
  //               quarterTurns: -1,
  //               child: Text(
  //                 "Featured",
  //                 style: TextStyle(color: Colors.black),
  //               ),
  //             ),
  //           ),
  //         ),
  //         Padding(
  //           padding: const EdgeInsets.symmetric(vertical: 8.0),
  //           child: TextButton(
  //             onPressed: () {},
  //             style: TextButton.styleFrom(
  //               textStyle: const TextStyle(
  //                 fontFamily: 'OpenSans-Bold',
  //                 fontSize: 20,
  //               ),
  //             ),
  //             child: RotatedBox(
  //               quarterTurns: -1,
  //               child: Text(
  //                 "New",
  //                 style: TextStyle(color: Colors.black),
  //               ),
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // Row _brandChoiceAlternative() {
  //   return Row(
  //     children: [
  //       Expanded(
  //         child: Container(
  //           height: 60,
  //           child: ListView.builder(
  //             scrollDirection: Axis.horizontal,
  //             itemCount: brandChoice.length,
  //             itemBuilder: (context, index) {
  //               return Padding(
  //                 padding: const EdgeInsets.all(8.0),
  //                 child: TextButton(
  //                   onPressed: () {
  //                     selectedIndex = index;
  //                     print(selectedIndex);
  //                   },
  //                   style: TextButton.styleFrom(
  //                     textStyle: TextStyle(
  //                         fontFamily: 'OpenSans-Bold',
  //                         fontSize: 20,
  //                         fontWeight: selectedIndex == index
  //                             ? FontWeight.bold
  //                             : FontWeight.normal),
  //                   ),
  //                   child: Text(
  //                     brandChoice[index],
  //                     style: const TextStyle(color: Colors.black),
  //                   ),
  //                 ),
  //               );
  //             },
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }
}
