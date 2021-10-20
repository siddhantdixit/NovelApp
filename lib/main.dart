import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fuzzy/fuzzy.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:siddhant_dixit/view/grid_home.dart';
import 'package:http/http.dart' as http;

final List<String> imgList = [
  'https://nogozo.com/static/book/images/c2.webp',
  'https://nogozo.com/static/book/images/c3.webp',
  'https://nogozo.com/static/book/images/c4.webp',
  'https://nogozo.com/static/book/images/c5.png'
];

List novelResponse = new List.empty();

List<String> novelNames = new List.empty(growable: true);

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
    final String url = 'https://nogozo.com/api/romance-novels/?format=json';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      setState(() {
        novelResponse = json.decode(response.body);
        for(var nvl in novelResponse)
          {
            novelNames.add(nvl['name']);
          }
        print("Fetched data");
        print(novelResponse);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchProducts();


    final fuse = Fuzzy(['apple', 'banana', 'orange']);

    final result = fuse.search('an');
    print(result);
    // result.map((r) => r.output.first.value).forEach(print);
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
      home: new HomeScreen(),
      // home: MyScaff(),
      // home: Scaffold(
      //   appBar: AppBar(
      //     title: Text('Nogozo'),
      //     actions: [
      //       IconButton(onPressed: (){
      //         // print('Pressed');
      //         showSearch(context: context, delegate: DataSearch());
      //       }, icon: Icon(Icons.search))
      //     ],
      //   ),
      //
      //   // appBar: AppBar(
      //   //   title: Text('Nogozo'),
      //   //   // actions: [
      //   //   //       Expanded(
      //   //   //         child: TextField(
      //   //   //         decoration: const InputDecoration(
      //   //   //         border: OutlineInputBorder(),
      //   //   //           hintText: 'Enter a search term'
      //   //   //     ),
      //   //   //   ),
      //   //   //       )
      //   //   // ],
      //   // ),
      //   body: SafeArea(
      //     child: SingleChildScrollView(
      //       child: Column(
      //         crossAxisAlignment: CrossAxisAlignment.stretch,
      //         children: [
      //           Container(
      //             height: 100,
      //             child: CarouselSlider(
      //               options: CarouselOptions(
      //                   viewportFraction: 1.0,
      //                   autoPlay: true,
      //                   autoPlayInterval: Duration(seconds: 8)),
      //               items: imgList
      //                   .map((item) => Container(
      //                         child: Center(
      //                             child:
      //                                 // Image.network(item, fit: BoxFit.cover, width: 1000)
      //                                 CachedNetworkImage(
      //                           imageUrl: item,
      //                           fit: BoxFit.fitWidth,
      //                           width: double.infinity,
      //                         )),
      //                       ))
      //                   .toList(),
      //             ),
      //           ),
      //           TextField(
      //             decoration: const InputDecoration(
      //                 border: OutlineInputBorder(),
      //                 hintText: 'Enter a search term'),
      //           ),
      //           Text('Book For Romance'),
      //           Container(
      //             child: GridData(),
      //           )
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Nogozo'),
        actions: [
          IconButton(onPressed: (){
            // print('Pressed');
            showSearch(context: context, delegate: DataSearch());
          }, icon: Icon(Icons.search))
        ],
      ),

      // appBar: AppBar(
      //   title: Text('Nogozo'),
      //   // actions: [
      //   //       Expanded(
      //   //         child: TextField(
      //   //         decoration: const InputDecoration(
      //   //         border: OutlineInputBorder(),
      //   //           hintText: 'Enter a search term'
      //   //     ),
      //   //   ),
      //   //       )
      //   // ],
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 100,
                child: CarouselSlider(
                  options: CarouselOptions(
                      viewportFraction: 1.0,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 8)),
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
              TextField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter a search term'),
              ),
              Text('Book For Romance'),
              Container(
                child: GridData(),
              )
            ],
          ),
        ),
      ),
    );
  }
}









class DataSearch extends SearchDelegate<String> {
  // final novelNames = [
  //   "Bhandup",
  //   "Mumbai",
  //   "Visakhapatnam",
  //   "Coimbatore",
  //   "Coimbatore",
  //   "Coimbatore",
  //   "Coimbatore",
  //   "Coimbatore",
  //   "Coimbatore",
  //   "Coimbatore",
  //   "Coimbatore",
  //   "Coimbatore",
  //   "Coimbatore",
  // ];

  final recentCities = [

  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, "/");
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Center(
      child: Container(
        height: 100.0,
        width: 100.0,
        child: Card(
          color: Colors.red,
          child: Center(
            child: Text(query),
          ),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    final suggestionList = query.isEmpty
        ? recentCities
        : novelNames.where((p) => p.startsWith(query)).toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          showResults(context);
        },
        leading: const Icon(Icons.location_city),
        title: RichText(
          text: TextSpan(
              text: suggestionList[index].substring(0, query.length),
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                    text: suggestionList[index].substring(query.length),
                    style: const TextStyle(color: Colors.grey))
              ]),
        ),
      ),
    );
  }
}
