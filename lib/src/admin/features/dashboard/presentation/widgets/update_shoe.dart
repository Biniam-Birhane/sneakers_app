import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hsvcolor_picker/flutter_hsvcolor_picker.dart';
import 'package:sneakers/src/admin/features/dashboard/domain/entities/shoe_entity.dart';
import 'package:sneakers/src/admin/features/dashboard/presentation/bloc/shoe_bloc.dart';
import 'package:sneakers/src/admin/features/dashboard/presentation/pages/admin_dashboard.dart';
import 'package:sneakers/src/admin/features/dashboard/presentation/widgets/app_bar.dart';
import 'package:sneakers/src/admin/features/dashboard/presentation/widgets/drawer.dart';

class UpdateShoeWidget extends StatelessWidget {
  UpdateShoeWidget({required this.shoe});
  final Shoe shoe;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  void updateShoe() {}

  TextEditingController _name = TextEditingController();

  TextEditingController _model = TextEditingController();

  TextEditingController _description = TextEditingController();

  TextEditingController _price = TextEditingController();

  TextEditingController _image = TextEditingController();

  final _colorNotifier = ValueNotifier<Color>(Colors.green);

  Widget build(BuildContext context) {
    _name.text = shoe.name;
    _model.text = shoe.model;
    _description.text = shoe.description;
    _price.text = shoe.price.toString();
    _image.text = shoe.image;
    _colorNotifier.value = shoe.backGroundColor;

    Size size = MediaQuery.of(context).size;
    String title = "Update Shoe page";
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBarPage(_scaffoldKey, title, context),
      drawer: DrawerPage(size, context),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: BlocBuilder<ShoeBloc, ShoeState>(builder: (context, state) {
              return Column(
                children: [
                  Container(
                      alignment: Alignment.topLeft,
                      child: const Text(
                        "UPDATE SHOE",
                        style: TextStyle(
                            fontFamily: "Quicksand",
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.blue),
                      )),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              child: const Text(
                            "Name :",
                            style: TextStyle(
                                fontFamily: "Quicksand",
                                fontSize: 15,
                                fontWeight: FontWeight.w700),
                          )),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Container(
                            width: size.width * 0.45,
                            child: TextField(
                              controller: _name,
                              decoration: InputDecoration(
                                  hintText: "Enter name",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: size.width * 0.02,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              child: const Text(
                            "Model :",
                            style: TextStyle(
                                fontFamily: "Quicksand",
                                fontSize: 15,
                                fontWeight: FontWeight.w700),
                          )),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Container(
                            width: size.width * 0.45,
                            child: TextField(
                              controller: _model,
                              decoration: InputDecoration(
                                  hintText: "Enter model ",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              child: const Text(
                            "Image Url :",
                            style: TextStyle(
                                fontFamily: "Quicksand",
                                fontSize: 15,
                                fontWeight: FontWeight.w700),
                          )),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Container(
                            width: size.width * 0.45,
                            child: TextField(
                              controller: _image,
                              decoration: InputDecoration(
                                  hintText: "Enter url ",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: size.width * 0.02,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              child: Text(
                            "Price :",
                            style: TextStyle(
                                fontFamily: "Quicksand",
                                fontSize: 15,
                                fontWeight: FontWeight.w700),
                          )),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Container(
                            width: size.width * 0.45,
                            child: TextField(
                              controller: _price,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  hintText: "Enter Price ",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Column(
                    children: [
                      Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Description :",
                            style: TextStyle(
                                fontFamily: "Quicksand",
                                fontSize: 15,
                                fontWeight: FontWeight.w700),
                          )),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      TextField(
                        controller: _description,
                        maxLines: 8,
                        decoration: InputDecoration(
                            hintText: "Enter description ",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ],
                  ),
                  Container(
                    width: size.width * 0.8,
                    child: ValueListenableBuilder<Color>(
                      valueListenable: _colorNotifier,
                      builder: (_, color, __) {
                        return ColorPicker(
                          color: color,
                          onChanged: (value) => _colorNotifier.value =
                              value, // Update _colorNotifier.value
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        alignment: Alignment.topRight,
                        child: ElevatedButton(
                            onPressed: () {
                              double price = double.tryParse(_price.text) ??
                                  0.0; // Use 0.0 as default value if parsing fails
                              context.read<ShoeBloc>().add(UpdateShoeEvent(
                                  backGroundColor: _colorNotifier.value,
                                  description: _description.text,
                                  image: _image.text,
                                  model: _model.text,
                                  name: _name.text,
                                  price: price,
                                  id: shoe.id));
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  backgroundColor: Colors.green,
                                  content: Text(
                                    'Shoe updated successfully!',
                                    style: TextStyle(fontFamily: "Quicksand"),
                                  ),
                                  duration: Duration(
                                      seconds:
                                          2), // Adjust the duration as needed
                                ),
                              );
                              Navigator.of(context).pop();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.2,
                                  vertical: size.height * 0.03),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            child: Text("Submit"))),
                  )
                ],
              );
            })),
      ),
    );
  }
}
