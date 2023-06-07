import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/src/material/colors.dart';
import '../controllers/money_controller.dart';
import './routes.dart';

final user_controller = Get.put(MoneyController());

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({Key? key}) : super(key: key);

  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    // define your pages here
    HomePage(),
    ServicesPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void getData() async {
    await user_controller.getRegisterData();
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coopec Microtous'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.black,),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.monetization_on, color: Colors.black,),
            label: 'Services',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings, color: Colors.black,),
            label: 'Setting',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      body: _pages[_selectedIndex],
    );
  }
}

// Define your pages as separate widgets here
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              elevation: 9, // add elevation for a 3D effect
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0), // add rounded corners
              ),
              margin: EdgeInsets.symmetric(horizontal: 12, vertical: 13),
              color: Colors.blue,
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/download.jfif',
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                  TextButton(
                    onPressed: () {
                      Get.toNamed('/join');
                    },
                    child: Text(
                      'Join us',
                    ),
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      textStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            Card(
              elevation: 9, // add elevation for a 3D effect
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0), // add rounded corners
              ),
              margin: EdgeInsets.symmetric(horizontal: 12, vertical: 13),
              color: Colors.blue,
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/download1.jfif',
                    height: 259,
                    fit: BoxFit.cover,
                  ),
                  TextButton(
                    onPressed: () {
                      Get.toNamed('/borrowing');
                    },
                    child: Text(
                      'Borrow from us ',
                    ),
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      textStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            Card(
              elevation: 9, // add elevation for a 3D effect
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0), // add rounded corners
              ),
              margin: EdgeInsets.symmetric(horizontal: 12, vertical: 13),
              color: Colors.blue,
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/images2.jfif',
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                  TextButton(
                    onPressed: () {
                      Get.toNamed('/saving');
                    },
                    child: Text(
                      'All in One',
                    ),
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      textStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class ServicesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Column(
        children: [
          Container(
            height: 250,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                ClipPath(
                  clipper: HalfCircleClipper(),
                  child: Container(
                    height: 700,
                    color: Colors.blue,
                  ),
                ),
                Center(
                  child: Text(
                    'Services',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  width: 420,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.lightBlueAccent, Colors.blue, Colors.blueAccent, Colors.lightBlue,Colors.lightBlueAccent],
                    ),
                    borderRadius: BorderRadius.circular(1.0),
                  ),

                  child: Center(
                    child: Text(
                      'Our Services',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 42,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 29,

          ),
          Expanded(
            child: ListView(
              children: [
                Card(
                  elevation: 9, // add elevation for a 3D effect
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0), // add rounded corners
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 12, vertical: 23), // add margin
                  child: ListTile(
                    leading: Icon(Icons.card_membership, color: Colors.black),
                    title: Text('Membership'),
                    onTap: () {
                      Get.toNamed('/create');
                      // navigate to borrowing screen
                    },
                  ),
                ),
                Card(
                  elevation: 9, // add elevation for a 3D effect
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0), // add rounded corners
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 12, vertical: 13), // add margin
                  child: ListTile(
                    leading: Icon(Icons.savings, color: Colors.black),
                    title: Text('Borrow And Save'),
                    onTap: () {
                      Get.toNamed('/saving');
                      // navigate to savings screen
                    },
                  ),
                ),
                Card(
                  elevation: 9, // add elevation for a 3D effect
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0), // add rounded corners
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 12, vertical: 23), // add margin
                  child: ListTile(
                    leading: Icon(Icons.request_quote_sharp, color: Colors.black),
                    title: Text('Borrow'),
                    onTap: () {
                      Get.toNamed('/borrowing');
                      // navigate to borrowing screen
                    },
                  ),
                ),
                Card(
                  elevation: 9, // add elevation for a 3D effect
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0), // add rounded corners
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 12, vertical: 13), // add margin
                  child: ListTile(
                    leading: Icon(Icons.local_activity, color: Colors.black),
                    title: Text('Status'),
                    onTap: () {
                      Get.toNamed('/status');
                      // navigate to savings screen
                    },
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}

class HalfCircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width / 2, 0);
    path.quadraticBezierTo(size.width / 2, size.height, size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(HalfCircleClipper oldClipper) => false;
}


class ProfilePage extends StatelessWidget {

  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Manage My Account',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            ListTile(
              leading: Icon(Icons.add, color: Colors.black,),
              title: Text('Add An Account'),
              onTap: () {
                Get.toNamed('/create');
              },
            ),
            ListTile(
              leading: Icon(Icons.edit, color: Colors.black,),
              title: Text('Update My Account'  ),
              onTap: () {
                Get.toNamed('/update');
              },
            ),
            ListTile(
              leading: Icon(Icons.delete, color: Colors.black,),
              title: Text('Delete My Account'),
              onTap: () {
                Get.toNamed('/delete');
              },
            ),
            ListTile(
              leading: Icon(Icons.help, color: Colors.black,),
              title: Text('Help'),
              onTap: () {
                Get.toNamed('/help');
              },
            ),
            SizedBox(height: 16),
            Divider(),
            SizedBox(height: 16),
            Text(
              'Account',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            ListTile(
              leading: Icon(Icons.logout, color: Colors.black,),
              title: Text('Log out'),
              onTap: () {
                Get.toNamed('/logout');
              },
            ),
          ],
        ),
      ),
    );
  }
}
