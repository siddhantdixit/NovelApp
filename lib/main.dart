import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fuzzy/fuzzy.dart';
import 'package:siddhant_dixit/view/grid_home.dart';
import 'package:http/http.dart' as http;
import 'package:siddhant_dixit/view/novel_page.dart';
import 'package:siddhant_dixit/view/tag_options.dart';


// Carousel Wallpapers
final List<String> imgList = [
  'https://nogozo.com/static/book/images/c2.webp',
  'https://nogozo.com/static/book/images/c3.webp',
  'https://nogozo.com/static/book/images/c4.webp',
  'https://nogozo.com/static/book/images/c5.png'
];

List novelResponse = new List.empty();

int userSelectedIndex = -1;


String searchedSelected = "";
int searchedSelectedIndex = -1;

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


    // Fuzzy Search Test
    // final fuse = Fuzzy(['Eleven Minutes By Paulo Coelho', 'Veronica Decides to die by Paulo Coelhi']);
    //
    // final result = fuse.search('paulo');
    // print(result);
    // result.map((r) => r.output.first.value).forEach(print);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new HomeScreen(),
    );
  }
}


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Nogozo'),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Nogozo'),
        actions: [
          IconButton(onPressed: (){
            // print('Pressed');
            showSearch(context: context, delegate: DataSearch());
          }, icon: Icon(Icons.search))
        ],
      ),

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
                          height: 100,
                          fit: BoxFit.fill,
                          width: double.infinity,
                        )),
                  ))
                      .toList(),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFFa569bd),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        child: Text('IIT JEE', style: TextStyle(fontSize: 10),),
                        onPressed: () {
                          iiitjeeDialog(context);
                        },
                      ),
                      SizedBox(width: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Color(0xFFe74c3c),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        child: Text('NEET', style: TextStyle(fontSize: 10),),
                        onPressed: () {
                          neetDialog(context);
                        },
                      ),
                      SizedBox(width: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Color(0xFFffab40),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        child: Text('Class XII', style: TextStyle(fontSize: 10),),
                        onPressed: () {
                          class12Dialog(context);
                        },
                      ),
                      SizedBox(width: 10),

                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFF16a085),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        child: Text('Class XI', style: TextStyle(fontSize: 10),),
                        onPressed: () {
                          class11Dialog(context);
                        },
                      ),
                      SizedBox(width: 10),

                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Color(0xFFe67e22),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        child: Text('Class X', style: TextStyle(fontSize: 10),),
                        onPressed: () {

                        },
                      ),
                      SizedBox(width: 10),

                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Color(0xFF1abc9c),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        child: Text('Class IX', style: TextStyle(fontSize: 10),),
                        onPressed: () {

                        },
                      ),
                      SizedBox(width: 10),

                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Color(0xFF2e86c1),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        child: Text('ICSE & ISC', style: TextStyle(fontSize: 10),),
                        onPressed: () {

                        },
                      ),
                      SizedBox(width: 10),

                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Color(0xFFc1862e),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        child: Text('Govt Exams', style: TextStyle(fontSize: 10),),
                        onPressed: () {

                        },
                      ),
                      SizedBox(width: 10),

                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Color(0xFF2e86c1),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        child: Text('Novels', style: TextStyle(fontSize: 10),),
                        onPressed: () {

                        },
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                  child: Text('Books For Romance',
                      style: TextStyle(
                        fontSize: 20
                      ),
                  ),
                padding: EdgeInsets.all(10),
              ),
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

  final trendingNovels = [

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
            child: Text(searchedSelected+"{$searchedSelectedIndex}"),
          ),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions

    final suggestionList = query.isEmpty
        ? trendingNovels
        :  Fuzzy<String>(novelNames, options: FuzzyOptions(threshold: .4))
        .search(query)
        .map((result) => result.item)
        .toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          searchedSelected = suggestionList[index];
          searchedSelectedIndex = novelNames.indexWhere((element) =>
          element == searchedSelected);
          // showResults(context);
          userSelectedIndex = searchedSelectedIndex;
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NovelPage()),
          );
        },
        leading: const Icon(Icons.book),
        title: RichText(
          text: TextSpan(
              text: suggestionList[index],
              style: const TextStyle(
                  color: Colors.black,
              ),
              // children: [
              //   TextSpan(
              //       text: suggestionList[index].substring(query.length),
              //       style: const TextStyle(color: Colors.grey))
              // ]
          ),
        ),
      ),
    );
  }
}
