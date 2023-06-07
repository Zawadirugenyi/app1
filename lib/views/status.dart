import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/money_controller.dart';

class StatusScreen extends StatelessWidget {
  final userController = Get.put(MoneyController());
  final saveEditingController = TextEditingController();
  final borrowEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:const  Text(' My Status '),
        ),
        backgroundColor: Colors.white,
        body:Card(
          elevation: 18.0,
          margin: const  EdgeInsets.symmetric(horizontal: 16.0, vertical: 200.0),
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
                    SizedBox(height: 30),
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
                                colors: [Colors.lightBlueAccent, Colors.blue, Colors.blueAccent, Colors.lightBlue,Colors.lightBlueAccent],
                              ),
                              borderRadius: BorderRadius.circular(1.0),
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
                                      () =>  Text(
                                    'Amounts Borrowed: \$${userController.amount_borowed.value.toStringAsFixed(2)}',
                                    style: TextStyle(fontSize: 17, color: Colors.white),
                                  ),
                                ),

                                SizedBox(height: 10),
                                Obx(() =>  Text(
                                  'Amounts Saved : \$${userController.amount_saved.value.toStringAsFixed(2)}',
                                  style: TextStyle(fontSize: 17, color: Colors.white),
                                ),
                                ),
                                SizedBox(height: 10),
                                Obx(() =>  Text(
                                  'Current Balance: \$${userController.current_balance.value.toStringAsFixed(2)}',
                                  style: TextStyle(fontSize: 17, color: Colors.white),
                                ),
                                ),
                                SizedBox(height: 20),
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
