import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:siddhant_dixit/view/grid_home.dart';
import 'package:http/http.dart' as http;

final List<String> imgList = [
  'https://nogozo.com/static/book/images/c2.webp',
  'https://nogozo.com/static/book/images/c3.webp',
  'https://nogozo.com/static/book/images/c4.webp',
  'https://nogozo.com/static/book/images/c5.png'
];

List novelResponse = new List.empty();

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Future fetchProducts() async {
    final String url =
        'https://raw.githubusercontent.com/om-chauhan/dummy-data/main/super-store-product.json';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      setState(() {
        novelResponse = json.decode(response.body);
        print("Fetched data");
        print(novelResponse);
      });
    }
  }



  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      // home: MyScaff(),
      home: Scaffold(
        appBar: AppBar(title: Text('Nogozo')),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: 100,
                  child: CarouselSlider(
                    options:
                        CarouselOptions(viewportFraction: 1.0, autoPlay: true,autoPlayInterval: Duration(seconds: 8)),
                    items: imgList
                        .map((item) => Container(
                              child: Center(
                                  child:
                                      // Image.network(item, fit: BoxFit.cover, width: 1000)
                                      CachedNetworkImage(
                                imageUrl: item,
                                fit: BoxFit.fitWidth,
                                width: double.infinity,
                              )),
                            ))
                        .toList(),
                  ),
                ),
                Text('Book For Romance'),
                Container(
                  child: GridData(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
