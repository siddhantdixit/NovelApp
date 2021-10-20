
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:siddhant_dixit/main.dart';
import 'package:siddhant_dixit/view/novel_page.dart';

class GridData extends StatefulWidget {
  const GridData({Key? key}) : super(key: key);

  @override
  _GridDataState createState() => _GridDataState();
}

class _GridDataState extends State<GridData> {
  @override
  Widget build(BuildContext context) {
    if(novelResponse.isEmpty)
      {
        return Center(child: CircularProgressIndicator());
      }
    else {
      return GridView.builder(

        physics: ScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,childAspectRatio: 3/4),
        shrinkWrap: true,
        itemCount: novelResponse.length,

        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              userSelectedIndex = index;
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NovelPage()),
              );
            },
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Container(
                width: 100.0,
                // height: 400.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5.0,
                      color: Colors.black38,
                      offset: Offset(5.0, 5.0),
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Image.network(
                        novelResponse[index]['image'],
                        height: 150.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      height: 55,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          novelResponse[index]['name'],
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 2.0,
                        right: 2.0,
                      ),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Text('Rent Price: '),
                          // Spacer(
                          //   flex: 1,
                          // ),
                          Row(
                            children: [
                              Text(
                                '₹',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff005DFF),
                                ),
                              ),
                              Text(
                                novelResponse[index]['one_week_rent_price'].toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff005DFF),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Row(
                            children: [
                              Text(
                                '₹',
                                style: TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff005DFF),
                                ),
                              ),
                              Text(
                                novelResponse[index]['mrp'].toString(),
                                style: TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff005DFF),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },

      );
    }
  }
}
