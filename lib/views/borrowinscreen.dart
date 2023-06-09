import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/money_controller.dart';

class  BorrowingScreen extends StatelessWidget {
  final userController = Get.put(MoneyController());
  final saveEditingController = TextEditingController();
  final borrowEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' Borrowing'),
      ),
      body:  Card(
        elevation: 18.0,
        margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 98.0),
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
                SizedBox(height: 36),
                TextField(
                  controller: borrowEditingController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'How much do you want to borrow?',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    userController.amount_borowed.value +=
                        double.parse(borrowEditingController.text);
                    userController.current_balance.value +=
                        double.parse(borrowEditingController.text);
                    borrowEditingController.clear();
                    Get.snackbar(
                        'Success',  'You have successfully borrowed your money!',
                        backgroundColor: Colors.blue,
                        colorText: Colors.white,
                        borderRadius: 10.0,
                        snackPosition: SnackPosition.BOTTOM)
                    ;
                  },
                  child: Text('Borrow'),
                ),
                SizedBox(height: 20),

                SizedBox(height: 20),
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
                            SizedBox(height: 30),
                            Obx(
                                  () => Text(
                                  'Amounts Borrowed: \$${userController.amount_borowed.value.toStringAsFixed(2)}',
                                  style: TextStyle(fontSize: 17, color: Colors.white),
                                ),
                              ),



                            SizedBox(height: 10),
                            Obx(() =>  Text(
                                'Current Balance: \$${userController.current_balance.value.toStringAsFixed(2)}',
                                style: TextStyle(fontSize: 17, color: Colors.white),
                              ),
                            ),
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
     ),
      );

  }
}
