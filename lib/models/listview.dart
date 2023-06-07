import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MyListView extends StatelessWidget {
  const MyListView({super.key});

  Future<List<Item>> _fetchData() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List;

      return data.map((item) => Item.fromJson(item)).toList();
    } else {
      throw Exception('Failed to fetch data from API');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Items")),
      body: FutureBuilder<List<Item>>(
        future: _fetchData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final item = snapshot.data![index];
                // print(item.imageUrl);
                return
                  Card(
                    color: Colors.white,
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                     side: BorderSide(color: Colors.grey.shade300),
                    ),
                    child: ListTile(
                    leading: Image.network("https://picsum.photos/seed/$index 5/200/",
                      height: 380, width: 80,),
                    title: Text(item.albumId.toString(), ),
                    subtitle: Text(item.title),textColor: Colors.blue,
                ),

                );


              },
            );
          } else if (snapshot.hasError) {
            print("Hellooooooo"+snapshot.error.toString());
            return Center(
              child: Text('${snapshot.error.toString()}'),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class Item {
  final String title;
  final String imageUrl;
  final String url;
  final int id;
  final int albumId;

  Item({
    required this.title,
    required this.imageUrl,
    required this.id,
    required this.albumId,
    required this.url
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    //Corrected where you had
    /*
      name: json['name'],
      description: json['description'],
        */
    return Item(
      title: json['title'],
      imageUrl: json['thumbnailUrl'],
      id: json['id'],
      albumId: json['albumId'],
      url: json['url']
    );
  }
}