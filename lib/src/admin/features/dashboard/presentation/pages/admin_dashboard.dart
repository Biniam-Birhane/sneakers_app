import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sneakers/src/admin/features/dashboard/presentation/bloc/shoe_bloc.dart';
import 'package:sneakers/src/admin/features/dashboard/presentation/widgets/app_bar.dart';
import 'package:sneakers/src/admin/features/dashboard/presentation/widgets/drawer.dart';
import 'package:sneakers/src/admin/features/dashboard/presentation/widgets/update_shoe.dart';

class AdminDashboard extends StatefulWidget {
  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    context.read<ShoeBloc>().add(GetShoesEvent());
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String title = "Admin Dashboard";
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBarPage(_scaffoldKey, title, context),
      drawer: DrawerPage(size, context),
      body: BlocConsumer<ShoeBloc, ShoeState>(
        listenWhen: (previousState, state) {
          var res = previousState != state || false;
          return res;
        },
        listener: (context, state) {
          if (state is ShoeAdded || state is ShoeDeleted)
            context.read<ShoeBloc>().add(GetShoesEvent());
        },
        builder: (context, state) {
          return BlocBuilder<ShoeBloc, ShoeState>(
            // buildWhen: (previous, current) => previous,
            builder: (context, state) {
              return state is GettingShoes
                  ? Center(child: CircularProgressIndicator())
                  : state is ShoesLoaded
                      ? Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Container(
                                    width: size.width * 0.75,
                                    child: const TextField(
                                      decoration: InputDecoration(
                                          prefixIcon: Icon(Icons.search),
                                          hintText: "Search",
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)))),
                                    ),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.02,
                                  ),
                                  Container(
                                      height: size.height * 0.08,
                                      width: size.width * 0.18,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.blue),
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.white,
                                      ),
                                      child: Icon(
                                        Icons.person,
                                        size: 40,
                                        color: Colors.blue,
                                      ))
                                ],
                              ),
                            ),
                            Expanded(
                              child: ListView.builder(
                                itemCount: state.shoes.length,
                                itemBuilder: (context, index) {
                                  final shoe = state.shoes[index];
                                  return Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Container(
                                      width: size.width,
                                      child: ListTile(
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 10.0),
                                        leading: Container(
                                          color: shoe.backGroundColor,
                                          child: Transform.rotate(
                                            angle: -20 * pi / 180,
                                            child: Image.asset(
                                              shoe.image,
                                              height: size.height * 0.3,
                                              width: size.width * 0.2,
                                            ),
                                          ),
                                        ),
                                        title: Text(
                                          shoe.model,
                                          style: const TextStyle(
                                            fontFamily: "Quicksand",
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        subtitle: Text(
                                          "euro " + shoe.price.toString(),
                                          style: const TextStyle(
                                            fontFamily: "Quicksand",
                                            fontSize: 20,
                                          ),
                                        ),
                                        trailing: Container(
                                          width: size.width * 0.25,
                                          child: Row(
                                            children: [
                                              IconButton(
                                                onPressed: () => {
                                                  showDialog(
                                                      context: context,
                                                      builder: (context) =>
                                                          UpdateShoeWidget(
                                                              shoe: shoe))
                                                  // Navigator.push(
                                                  //     context,
                                                  //     MaterialPageRoute(
                                                  //         builder: ((context) =>
                                                  //             UpdateShoeWidget(
                                                  //               shoe: shoe,
                                                  //               context:
                                                  //                   context,
                                                  //             ))))
                                                },
                                                color: Colors.green,
                                                icon: Icon(Icons.edit),
                                              ),
                                              IconButton(
                                                onPressed: () {
                                                  context.read<ShoeBloc>().add(
                                                      DeleteShoeEvent(
                                                          id: shoe.id));
                                                },
                                                color: Colors.red,
                                                icon: Icon(Icons.delete),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        )
                      : Text("Hello");
            },
          );
        },
      ),
    );
  }
}
