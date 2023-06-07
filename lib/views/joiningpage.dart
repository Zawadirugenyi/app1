import 'dart:convert';

import 'package:app1/controllers/money_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

var loading = false.obs;

var message = "".obs;

Future<void> storeLoginData(
    String Full_name,
    String Email,
    String Phone_number,
    String Occupation,
    String Income,
    String Address,
    String Person_of_reference) async {
  loading.value = true;
  try {
    final response = await http.post(
      Uri.parse('https://zawadi.kimworks.buzz/registration.php'),
      body: {
        'Full_name': Full_name,
        'Email': Email,
        'Phone_number': Phone_number,
        'Occupation': Occupation,
        'Income': Income,
        'Address': Address,
        'Person_of_reference': Person_of_reference,
        'checkDuplicate': 'true' // add a flag to check for duplicate usernames
      },
    );

    if (response.statusCode != 200) {
      loading.value = false;
      message.value = "An error occurred";
      Get.snackbar("Error", "An error occurred",
          backgroundColor: Colors.red,
          colorText: Colors.white,
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
        Get.snackbar("Successful", "Account successfully Updated",
            backgroundColor: Colors.blue,
            colorText: Colors.white,
            borderRadius: 10.0,
            snackPosition: SnackPosition.BOTTOM);
        Get.toNamed('/profile');
      }
      print(response.body);
    }
  } catch (e) {
    loading.value = false;
    Get.snackbar("Error", e.toString(), snackPosition: SnackPosition.BOTTOM);
  }
}

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _occupationController = TextEditingController();
  final TextEditingController _incomeController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _referenceController = TextEditingController();

  final name_Controller = Get.put(MoneyController());

  @override
  Widget build(BuildContext context) {
    _fullNameController.text = name_Controller.active_user.value.username;
    _emailController.text = name_Controller.active_user.value.email;
    _phoneNumberController.text =
        name_Controller.active_account.value.phoneNumber;
    _occupationController.text =
        name_Controller.active_account.value.occupation;
    _incomeController.text =
        name_Controller.active_account.value.income.toString();
    _addressController.text =
        name_Controller.active_account.value.address;
    _referenceController.text =
        name_Controller.active_account.value.personOfReference;

    return Scaffold(
      appBar: AppBar(
        title: Text('Create An Account'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                child: Image.asset(
                  'assets/images/images1.jfif',
                  height: 160,
                  fit: BoxFit.cover,
                ),
              ),
              TextField(
                controller: _fullNameController,
                decoration: InputDecoration(labelText: 'Full Name'),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _phoneNumberController,
                decoration: InputDecoration(labelText: 'Phone Number'),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _occupationController,
                decoration: InputDecoration(labelText: 'Occupation'),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _incomeController,
                decoration: InputDecoration(labelText: 'Income'),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _addressController,
                decoration: InputDecoration(labelText: 'Address'),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _referenceController,
                decoration: InputDecoration(labelText: 'Person of Reference'),
              ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: () => storeLoginData(
                  _fullNameController.text,
                  _emailController.text,
                  _phoneNumberController.text,
                  _occupationController.text,
                  _incomeController.text,
                  _addressController.text,
                  _referenceController.text,
                ),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(150, 50),
                  primary: Colors.blueAccent,
                  onPrimary: Colors.white,
                  side: BorderSide(color: Colors.lightBlueAccent, width: 2),
                  // foreground
                ),
                child: Obx(
                      () => loading.value
                      ? CircularProgressIndicator(color: Colors.white)
                      : const Text('Register'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}




