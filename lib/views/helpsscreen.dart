import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {

  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/help.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Card(
          elevation: 18.0,
          margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 100.0),
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Center(
                    child: Text(
                      'Contact Us',
                      style: TextStyle(fontSize: 30,
                          color: Colors.blue,fontWeight:
                          FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 26.0),
                  TextFormField(
                    controller: _messageController,
                    maxLines: 5,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter your message',
                    ),
                  ),
                  SizedBox(height: 16.0),
                  SizedBox(
                    width: 200, // set the width of the button
                    height: 50, // set the height of the button
                    child: ElevatedButton(
                      onPressed: () {
                        // send the message
                        String message = _messageController.text;
                        // send message using your preferred method (e.g. email, API)
                      },
                      child: Text('Send'),
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