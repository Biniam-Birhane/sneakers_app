import "package:flutter/material.dart";
import "package:sneakers/src/admin/features/dashboard/presentation/pages/admin_dashboard.dart";
import "package:sneakers/src/admin/features/dashboard/presentation/widgets/add_shoe.dart";

Drawer DrawerPage(Size size, BuildContext context) {
  return Drawer(
    child: Container(
      color: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            height: size.height * 0.15,
            child: DrawerHeader(
              decoration: BoxDecoration(color: Colors.grey[50]),
              child: const Center(
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 40, // Adjust the radius as needed
                    backgroundImage: AssetImage("assets/images/mit.jpg"),
                  ),
                  title: Text(
                    "Biniam Birhane",
                    style: TextStyle(
                        fontFamily: "QuickSans", fontWeight: FontWeight.w700),
                  ),
                  subtitle: Text(
                    "Admin",
                    style: TextStyle(
                        fontFamily: "Quicksans", fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    color: Colors.grey[200],
                    child: ListTile(
                      horizontalTitleGap: size.width * 0.06,
                      leading: const Icon(
                        Icons.home,
                        color: Colors.blue,
                      ),
                      title: const Text(
                        "Dashboard",
                        style: TextStyle(
                            fontFamily: "Quicksand",
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    AdminDashboard())); // Close the drawer
                      },
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Container(
                    color: Colors.grey[200],
                    child: ListTile(
                      horizontalTitleGap: size.width * 0.06,
                      leading: Icon(
                        Icons.shop_rounded,
                        color: Colors.blue,
                      ),
                      title: Text(
                        "Add Shoes",
                        style: TextStyle(
                            fontFamily: "Quicksand",
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                      onTap: () {
                        // Add your navigation logic here
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    AddShoe())); // Close the drawer
                      },
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Container(
                    color: Colors.grey[200],
                    child: ListTile(
                      horizontalTitleGap: size.width * 0.06,
                      leading: Icon(
                        Icons.add_shopping_cart,
                        color: Colors.blue,
                      ),
                      title: Text(
                        "Orders",
                        style: TextStyle(
                            fontFamily: "Quicksand",
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                      onTap: () {
                        // Add your navigation logic here
                        Navigator.pop(context); // Close the drawer
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
