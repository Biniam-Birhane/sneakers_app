import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hsvcolor_picker/flutter_hsvcolor_picker.dart';
import 'package:sneakers/src/admin/features/dashboard/presentation/bloc/shoe_bloc.dart';
import 'package:sneakers/src/admin/features/dashboard/presentation/pages/admin_dashboard.dart';
import 'package:sneakers/src/admin/features/dashboard/presentation/widgets/app_bar.dart';
import 'package:sneakers/src/admin/features/dashboard/presentation/widgets/drawer.dart';
import 'package:supercharged/supercharged.dart';

class AddShoe extends StatefulWidget {
  @override
  State<AddShoe> createState() => _AddShoeState();
}

class _AddShoeState extends State<AddShoe> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  final GlobalKey<FormState> _formKey = GlobalKey();

  void postShoe() {
    if (_formKey.currentState!.validate()) {
      double price = double.tryParse(_price.text) ?? 0.0;
      context.read<ShoeBloc>().add(AddShoeEvent(
            backGroundColor: _colorNotifier.value,
            description: _description.text,
            image: "assets/images/" + _image.text,
            model: _model.text,
            name: _name.text,
            price: price,
          ));
    }
  }

  TextEditingController _name = TextEditingController();
  TextEditingController _model = TextEditingController();
  TextEditingController _description = TextEditingController();
  TextEditingController _price = TextEditingController();
  TextEditingController _image = TextEditingController();

  final _colorNotifier = ValueNotifier<Color>(Colors.green);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String title = 'Add Shoe Page';
    return BlocListener<ShoeBloc, ShoeState>(
      listener: (context, state) {
        if (state is ShoeAdded) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.green,
            content: Text(
              'Shoe added successfully!',
              style: TextStyle(fontFamily: "Quicksand"),
            ),
            duration: Duration(seconds: 2),
          ));
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => AdminDashboard()));
        }
      },
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBarPage(_scaffoldKey, title, context),
        drawer: DrawerPage(size, context),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: BlocBuilder<ShoeBloc, ShoeState>(
              builder: (context, state) {
                return Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        child: const Text(
                          "ADD NEW SHOE",
                          style: TextStyle(
                            fontFamily: "Quicksand",
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.03),
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
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              SizedBox(height: size.height * 0.01),
                              Container(
                                width: size.width * 0.45,
                                child: TextFormField(
                                  controller: _name,
                                  decoration: InputDecoration(
                                    hintText: "Enter name",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Name is required';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: size.width * 0.02),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: const Text(
                                  "Model :",
                                  style: TextStyle(
                                    fontFamily: "Quicksand",
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              SizedBox(height: size.height * 0.01),
                              Container(
                                width: size.width * 0.45,
                                child: TextFormField(
                                  controller: _model,
                                  decoration: InputDecoration(
                                    hintText: "Enter model",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Model is required';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: size.height * 0.02),
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
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              SizedBox(height: size.height * 0.01),
                              Container(
                                width: size.width * 0.45,
                                child: TextFormField(
                                  controller: _image,
                                  decoration: InputDecoration(
                                    hintText: "Enter URL",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Image URL is required';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: size.width * 0.02),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text(
                                  "Price :",
                                  style: TextStyle(
                                    fontFamily: "Quicksand",
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              SizedBox(height: size.height * 0.01),
                              Container(
                                width: size.width * 0.45,
                                child: TextFormField(
                                  controller: _price,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    hintText: "Enter Price",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Price is required';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: size.height * 0.02),
                      Column(
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Description :",
                              style: TextStyle(
                                fontFamily: "Quicksand",
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          SizedBox(height: size.height * 0.01),
                          TextFormField(
                            controller: _description,
                            maxLines: 8,
                            decoration: InputDecoration(
                              hintText: "Enter description",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Description is required';
                              }
                              return null;
                            },
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
                              onChanged: (value) =>
                                  _colorNotifier.value = value,
                            );
                          },
                        ),
                      ),
                      SizedBox(height: size.height * 0.03),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          alignment: Alignment.topRight,
                          child: BlocBuilder<ShoeBloc, ShoeState>(
                            builder: (context, state) {
                              if (state is AddingShoe)
                                return const CircularProgressIndicator();

                              return ElevatedButton(
                                onPressed: postShoe,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.2,
                                    vertical: size.height * 0.03,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: Text("Submit"),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
