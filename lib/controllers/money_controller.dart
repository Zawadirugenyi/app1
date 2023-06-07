import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/account.dart';
import '../models/user.dart';

class MoneyController extends GetxController {

  var active_user = User(
    id: '',
    username: '',
    email: '',
    password: '',
    time: DateTime.now(),
    active: false,
  ).obs;


  var amount_borowed = 0.0.obs;
  var amount_saved = 0.0.obs;
  var current_balance = 0.0.obs;
  var bank_amount = 1000000.obs;

  var loading = false.obs;

  var message = "".obs;


  var active_account = Account(
    id: 0,
    clientId: 0,
    phoneNumber: '',
    occupation: '',
    income: 0,
    address: '',
    personOfReference: '',
    time: DateTime.now(),
  ).obs;

  var account_existing = false.obs;

  get isLoggedIn => null;

  get password => null;

  get username => null;


  Future<void> storeLoginData(String Username, String Password) async {
    loading.value = true;
    clearLoginData();

    try {
      final response = await http.post(
        Uri.parse('https://zawadi.kimworks.buzz/login.php'),
        body: {
          Username.contains("@") ? 'Email' : 'Username': Username,
          'Password': Password,
        },
      );

      if (response.statusCode != 200) {
        loading.value = false;
        message.value = "An error occurred";
        Get.snackbar(
          "Error",
          "An error occurred",
          backgroundColor: Colors.red,
          colorText: Colors.white,
          borderRadius: 10.0,
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        var responseDecoded = json.decode(response.body);
        loading.value = false;
        if (!responseDecoded.containsKey("error")) {
          Get.snackbar(
            "Successful",
            "User successfully logged in",
            backgroundColor: Colors.blue,
            colorText: Colors.white,
            borderRadius: 10.0,
            snackPosition: SnackPosition.BOTTOM,
          );
          final user = User.fromJson(responseDecoded);

          active_user.value = user;
          await getRegisterData();

          Get.toNamed('/profile');
        } else {
          Get.snackbar("Error", responseDecoded["message"],
              backgroundColor: Colors.red,
              colorText: Colors.white,
              borderRadius: 10.0,
              snackPosition: SnackPosition.BOTTOM);
        }
      }
    } catch (e) {
      loading.value = false;
      Get.snackbar("Error", e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> getRegisterData() async {
    try {
      final response = await http.post(
        Uri.parse('https://zawadi.kimworks.buzz/profile.php'),
        body: {
          'client_id': active_user.value.id,
        },
      );

      if (response.statusCode != 200) {
      } else {
        var responseDecoded = json.decode(response.body);
        if (!responseDecoded.containsKey("error")) {
          final registeredAccount = Account.fromJson(responseDecoded);
          active_account.value = registeredAccount;
          account_existing.value = true;
        } else {
          print(
              'Getting profile data: ${jsonEncode(active_user.value)} ${responseDecoded["message"]}');
        }
      }
    } catch (e) {
      print(
          'Getting profile data: ${jsonEncode(active_user.value)} ${e.toString()}');
    }
  }

  Future<void> addTransaction(
      double AmountBorrowed, double AmountSaved) async {
    final url = Uri.parse('https://zawadi.kimworks.buzz/transaction.php');
    try {
      final response = await http.post(url, body: {
        'Amount_Borrowed': AmountBorrowed.toString(),
        'Amount_Saved': AmountSaved.toString(),
        'Registration_Id': active_account.value.id.toString(),
      });

      if (response.statusCode != 200) {
        message.value = "Error: ${response.statusCode} occurred";
      } else {
        var responseDecoded = json.decode(response.body);
        if (!responseDecoded.containsKey("error")) {
          message.value = responseDecoded["message"];
        } else {
          message.value =
              'Error: ${responseDecoded["message"].toString().split("<br>")[1]}';
        }
      }
    } catch (e) {
      message.value =
      'Error: ${e.toString()}';
    }
  }

  void logout() {}

  void clearLoginData() {
    amount_borowed = 0.0.obs;
    amount_saved = 0.0.obs;
    current_balance = 0.0.obs;

    active_user = User(
      id: '',
      username: '',
      email: '',
      password: '',
      time: DateTime.now(),
      active: false,
    ).obs;

    active_account = Account(
      id: 0,
      clientId: 0,
      phoneNumber: '',
      occupation: '',
      income: 0,
      address: '',
      personOfReference: '',
      time: DateTime.now(),
    ).obs;
  }
}
