import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sneakers/src/admin/features/dashboard/presentation/pages/admin_dashboard.dart';
import 'package:sneakers/src/animations/animations.dart';
import 'package:sneakers/src/bottomPage/bottom_items_list.dart';
import 'package:sneakers/src/bottomPage/common_bottom_bar.dart';
import 'package:sneakers/src/user/cart/view/cart.dart';
import 'package:sneakers/src/user/dashboard.dart';

class StatusModel {
  StatusModel({required this.color, required this.place, required this.icon});

  final Color color;
  final String place;
  final Icon icon;
}

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int selectedIndex = 2;

  List<StatusModel> status = [
    StatusModel(color: Colors.green, place: "Away", icon: Icon(Icons.face)),
    StatusModel(
        color: Colors.purple, place: "At Work", icon: Icon(Icons.computer)),
    StatusModel(color: Colors.orange, place: "Gaming", icon: Icon(Icons.games)),
    StatusModel(
        color: const Color.fromARGB(255, 240, 52, 39),
        place: "Busy",
        icon: Icon(Icons.face)),
  ];
  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });

    if (selectedIndex == 0) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Dashboard()));
    } else if (selectedIndex == 1) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CartPage()));
    } else if (selectedIndex == 2) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Profile()));
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("My Profile"),
        actions: [IconButton(onPressed: ()=>{}, icon: Icon(Icons.settings))],
      ),
      body:FadeAnimation(1.5,  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              ListTile(
                  leading: const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage("assets/images/mit.jpg"),
                    backgroundColor: Colors.grey,
                  ),
                  title: const Text(
                    "Biniam Birhane",
                    style: TextStyle(
                        fontFamily: "Quicksand",
                        fontWeight: FontWeight.w700,
                        fontSize: 15),
                  ),
                  subtitle: const Text(
                    "Flutter Developer",
                    style: TextStyle(fontFamily: "Quicksand", fontSize: 15),
                  ),
                  trailing: IconButton(
                    onPressed: () => {},
                    icon: Icon(Icons.edit),
                  )),
              SizedBox(
                height: size.height * 0.04,
              ),
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  "My Status",
                  
                  style: TextStyle(fontFamily: "Quicksand",fontSize: 20),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Container(
                height: size.height * 0.07,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: status.length,
                  itemBuilder: ((context, index) {
                    return Container(
                      padding: EdgeInsets.symmetric(vertical:18.0,horizontal: 27),
                      margin: EdgeInsets.only(
                        right: 10.0,
                      ),
                      child: Row(
                        children: [
                          status[index].icon,
                          SizedBox(
                            width: size.width * 0.02,
                          ),
                          Text(
                            status[index].place,
                            style: TextStyle(
                                color: Colors.white, fontFamily: "Quicksand"),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: status[index].color,
                      ),
                    );
                  }),
                ),
              ),
              SizedBox(
                height: size.height * 0.06,
              ),
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  "Dashboard",
                  style: TextStyle(fontFamily: "Quicksand",fontSize: 20),
                ),
              ),
              SizedBox(height: size.height*0.01,),
              ListTile(
                leading: CircleAvatar(
                  
                  child: Icon(Icons.home_max),
                  backgroundColor: Colors.green,
                ),
                title: Text(
                  "Payments",
                  style: TextStyle(
                      fontFamily: "Quicksand",
                      
                      fontWeight: FontWeight.w700),
                ),
                trailing: Container(
                  height: 35,
                  width: 80,
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    "2 New >",
                    style: TextStyle(fontSize: 10, color: Colors.white),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.blue,
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.02),
              ListTile(
                  leading: CircleAvatar(
                    child: Icon(Icons.home_max),
                    backgroundColor: Colors.yellow,
                  ),
                  title: Text(
                    "Achievement's",
                    style: TextStyle(
                        fontFamily: "Quicksand",
                        
                        fontWeight: FontWeight.w700),
                  ),
                  trailing: IconButton(
                    onPressed: () => {},
                    icon: Icon(Icons.forward),
                  )),
              SizedBox(
                height: size.height * 0.02,
              ),
              ListTile(
                leading: CircleAvatar(
                  child: Icon(Icons.home_max),
                ),
                title: Text(
                  "privacy",
                  style: TextStyle(
                      fontFamily: "Quicksand",
                      
                      fontWeight: FontWeight.w700),
                ),
                trailing: Container(
                  height: 35,
                  width: 100,
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    "Action Needed >",
                    style: TextStyle(fontSize: 10, color: Colors.white),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.red,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  "My Account",
                  
                  style: TextStyle(fontFamily: "Quicksand",fontSize: 20),
                ),
              ),
               SizedBox(
                height: size.height * 0.02,
              ),
              Container(
                alignment: Alignment.topLeft,
                child: TextButton(onPressed: ()=>{}, child: Text(
                      "Switch to Other Account",
                      style: TextStyle(fontFamily: "Quicksand", fontWeight: FontWeight.w700,color: const Color.fromARGB(255, 7, 99, 173)),
                    ),),
              ),
              Container(
                alignment: Alignment.topLeft,
                child: TextButton(onPressed: ()=>{
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>AdminDashboard()))
                }, child: Text(
                      "Log Out",
                      style: TextStyle(fontFamily: "Quicksand",fontWeight: FontWeight.w700,color:Colors.red),
                    ),),
              )
            ],
          ),
        ),
      )),
      bottomNavigationBar: CommonBottomBar(
        items: bottomBarItems,
        currentIndex: selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
