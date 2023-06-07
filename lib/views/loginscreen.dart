
import 'package:app1/controllers/money_controller.dart';
import 'package:app1/views/customwidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
 LoginScreen({Key? key}) : super(key: key);

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final userController = Get.put(MoneyController());

  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
            SizedBox(
            height: 70,
          ),
          Image.asset(
            'assets/images/15-removebg-preview (3).png',
            height: 180,
            width: 100,
            fit: BoxFit.contain,
          ),
          SizedBox(
            height: 25,
          ),
          Center(
              child: myTextWidget(
                  'Welcome to Microtous ', 34.0, Colors.blueAccent)),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: usernameController,
              decoration: const InputDecoration(
                prefix: Icon(
                  Icons.person,
                  color: Colors.blueAccent,
                ),
                labelText: 'User Name',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Enter password',
                prefixIcon: Icon(Icons.key, color: Colors.blueAccent),
                suffixIcon: InkWell(
                  onTap: () {
                    isPasswordVisible = !isPasswordVisible;
                    // update the state of the widget when user taps the suffix icon
                    // to toggle password visibility
                    userController.update();
                  },
                  child: Icon(
                    isPasswordVisible
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: Colors.white,
                  ),
                ),
                border: OutlineInputBorder(),
              ),
              obscureText: !isPasswordVisible,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: myTextWidget(
              'Forgot Password?',
              20.0,
              Colors.blueAccent,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
              children: [
          Padding(
          padding: const EdgeInsets.all(9.2),
          child: ElevatedButton(
            onPressed: () => userController.storeLoginData(
              usernameController.text,
              passwordController.text,
            ),
            style: ElevatedButton.styleFrom(
              fixedSize: Size(150, 50),
              primary: Colors.blueAccent,
              onPrimary: Colors.white,
              side:
              BorderSide(color: Colors.lightBlueAccent, width: 2),
              // foreground
            ),
            child: Obx(
                  () => userController.loading.value
                  ? CircularProgressIndicator(
                color: Colors.white,
              )
                  : const Text('Login'),
            ),
          ),
        ),
        Spacer(),
        Padding(
            padding: const EdgeInsets.all(9.2),
            child: ElevatedButton(
                onPressed: () {
                  Get.toNamed('/signup');
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(140, 50),
                  primary: Colors.blueAccent,
                  onPrimary: Colors.white,
                  side: BorderSide(
                      color: Colors.lightBlueAccent, width: 2),
                  // foreground
                ),


                  child: const Text('Signup')),
            ),
          ],
        )
      ]
      ),
    )
    )
    );
  }
}
