import 'dart:convert';
import 'package:app1/views/customwidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

var loading = false.obs;

var message = "".obs;
final usernameController = TextEditingController();
final emailController = TextEditingController();
final passwordController = TextEditingController();

Future<void> storeLoginData(
    String Username, String Email, String Password) async {
  loading.value = true;
  try {
    final response = await http.post(
      Uri.parse('https://zawadi.kimworks.buzz/create.php'),
      body: {
        'Username': Username,
        'Email': Email,
        'Password': Password,
        'checkDuplicate': 'true' // add a flag to check for duplicate usernames
      },
    );

    if (response.statusCode != 200) {
      loading.value = false;
      message.value = "An error occurred";
      Get.snackbar("Error", "An error occurred",
          backgroundColor: Colors.blue,
          colorText: Colors.red,
          borderRadius: 10.0,
          snackPosition: SnackPosition.BOTTOM);
      print(response.body);
    } else {
      var responseDecoded = json.decode(response.body);
      loading.value = false;
      if (responseDecoded.containsKey("error")) {
        // check if the response contains an error message
        Get.snackbar("Error", responseDecoded["message"],
            backgroundColor: Colors.red,
            colorText: Colors.white,
            borderRadius: 10.0,
            snackPosition: SnackPosition.BOTTOM);
      } else {
        // no error message, proceed with creating the new user
        Get.snackbar("Successful", "User successfully signed up",
            backgroundColor: Colors.blue,
            colorText: Colors.white,
            borderRadius: 10.0,
            snackPosition: SnackPosition.BOTTOM);
        Get.toNamed('/login');
      }
      print(response.body);
    }
  } catch (e) {
    loading.value = false;
    Get.snackbar("Error", e.toString(),
        backgroundColor: Colors.blue,
        colorText: Colors.white,
        borderRadius: 10.0,
        snackPosition: SnackPosition.BOTTOM);
  }
}

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(children: [
        Image.asset(
          'assets/images/second.png',
          height: 250,
          fit: BoxFit.cover,
        ),
        const SizedBox(
          height: 10,
        ),
        Center(
          child: myTextWidget(
            'Create Your Account ',
            35.0,
            Colors.blueAccent,
          ),
        ),
        Center(
          child: myTextWidget(
            '',
            25.0,
            Colors.blueAccent,
          ),
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
              labelText: 'Username',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        const SizedBox(
          height: 3,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: emailController,
            decoration: const InputDecoration(
              labelText: 'Email',
              prefix: Icon(
                Icons.email_rounded,
                color: Colors.blueAccent,
              ),
              border: OutlineInputBorder(),
            ),
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: passwordController,
            decoration: const InputDecoration(
                labelText: 'Password',
                suffix: Icon(Icons.remove_red_eye, color: Colors.white),
                prefix: Icon(Icons.key, color: Colors.blueAccent),
                border: OutlineInputBorder()),
            obscureText: true,
          ),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(9.2),
              child: InkWell(
                child: ElevatedButton(
                  onPressed: () => storeLoginData(
                    usernameController.text,
                    emailController.text,
                    passwordController.text,
                  ),
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(377, 55),
                    primary: Colors.blueAccent,
                    onPrimary: Colors.white,
                    side: BorderSide(color: Colors.lightBlueAccent, width: 2),
                    // foreground
                  ),
                  child: Obx(
                    () => loading.value
                        ? CircularProgressIndicator(color: Colors.white)
                        : const Text('Signup'),
                  ),
                ),
              ),
            ),
          ],
        )
      ]),
    )));
  }
}
