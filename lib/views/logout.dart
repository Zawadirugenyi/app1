import 'package:app1/controllers/money_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogoutScreen extends StatelessWidget {
  final userController = Get.put(MoneyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Logout'),
        ),
        body:  Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/logout.jpg'),
              fit: BoxFit.cover,
            ),
          ),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child:  Text(
                    'Are you sure you want to logout?',
                    style: TextStyle(fontSize: 22,
                        color: Colors.white,fontWeight:
                        FontWeight.normal),
                  ),
                ),
                const SizedBox(height: 30),
                Card(
                  elevation: 16.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(34.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Get.offAllNamed('/login');
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                          ),
                          child: const Text('Yes'),
                        ),
                        const SizedBox(width: 30),
                        ElevatedButton(
                          onPressed: () {
                            Get.back();
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red[400],
                          ),
                          child: const Text('No'),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),

      );

  }
}
