import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/money_controller.dart';

class SavingsScreen extends StatelessWidget {
  final userController = Get.put(MoneyController());
  final saveEditingController = TextEditingController();
  final borrowEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('BAS Borrow And Saving '),
    ),
    backgroundColor: Colors.white,
    body:Card(
    elevation: 18.0,
    margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 78.0),
    child: SingleChildScrollView(
    child: Container(
      child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Obx(() => Text(
      'Your Current Balance: \$${userController.current_balance.value.toStringAsFixed(2)}',
      style: TextStyle(fontSize: 21, color: Colors.blueAccent,fontWeight: FontWeight.bold),
      )),
              SizedBox(height: 20),
              TextField(
                controller: borrowEditingController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'How much do you want to borrow?',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 22),
              Obx(
                () => ElevatedButton(
                  onPressed: userController.account_existing.value
                      ? () async {
                          userController.amount_borowed.value +=
                              double.parse(borrowEditingController.text);
                          userController.current_balance.value +=
                              double.parse(borrowEditingController.text);
                          await userController.addTransaction(
                              userController.amount_borowed.value,
                              userController.amount_saved.value);
                          borrowEditingController.clear();

                          Get.snackbar(
                              userController.message.value.contains("Error")
                                  ? 'Error'
                                  : 'Success',
                              userController.message.value,
                              backgroundColor: userController.message.value.contains("Error") ? Color.fromARGB(255, 247, 20, 4) : Colors.blue,
                              colorText: Colors.white,
                              borderRadius: 11.0,
                              snackPosition: SnackPosition.BOTTOM);
                        }
                      : null,
                  child: Text('Borrow'),
                ),
              ),
              SizedBox(height: 22),
              TextField(
                controller: saveEditingController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'How much do you want to Save?',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 22),
              ElevatedButton(
                onPressed: () async {
                  if (double.parse(saveEditingController.text) >
                      userController.current_balance.value) {
                    Get.snackbar('Error',
                        'Sorry, you cannot save more than your current balance!',
                        backgroundColor: Color.fromARGB(255, 250, 20, 4),
                        colorText: Colors.white,
                        borderRadius: 11.0,
                        snackPosition: SnackPosition.BOTTOM);
                  } else
                    {
                    userController.amount_saved.value +=
                        double.parse(saveEditingController.text);
                    userController.current_balance.value -=
                        double.parse(saveEditingController.text);
                    await userController.addTransaction(
                        userController.amount_borowed.value,
                        userController.amount_saved.value);
                    saveEditingController.clear();
                    Get.snackbar(
                        'Success', 'You have successfully saved your money!',
                        backgroundColor: Colors.blue,
                        colorText: Colors.white,
                        borderRadius: 12.0,
                        snackPosition: SnackPosition.BOTTOM);
                  }
                },
                child: Text('Save'),
              ),
              SizedBox(height: 29),
              Center(
                child: SizedBox(
                  width: 300,
                  height: 220,
                  child: Card(
                    child: Container(
                      padding: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.blueAccent, Colors.blue, Colors.blueAccent, Colors.blue],
                        ),
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              'Status',
                              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                          ),
                          SizedBox(height: 29),
                          Obx(
                                () =>  Text(
                              'Amounts Borrowed: \$${userController.amount_borowed.value.toStringAsFixed(2)}',
                              style: TextStyle(fontSize: 17, color: Colors.white),
                            ),
                                ),

                          SizedBox(height: 11),
                          Obx(() =>  Text(
                              'Amounts Saved : \$${userController.amount_saved.value.toStringAsFixed(2)}',
                              style: TextStyle(fontSize: 17, color: Colors.white),
                            ),
                          ),
                          SizedBox(height: 11),
                          Obx(() =>  Text(
                              'Current Balance: \$${userController.current_balance.value.toStringAsFixed(2)}',
                              style: TextStyle(fontSize: 17, color: Colors.white),
                            ),
                          ),
                          SizedBox(height: 22),
                        ],
                      ),

                    ),

                  ),
                ),
              )

            ],
          ),
        ),
    ),
    ),
    )
    );
  }
}
