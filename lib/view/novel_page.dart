import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:siddhant_dixit/main.dart';

class NovelPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              novelResponse[userSelectedIndex]['name'],
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            CachedNetworkImage(
              imageUrl: novelResponse[userSelectedIndex]['image'],
              fit: BoxFit.contain,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  'Rented Price: ',
                  style: TextStyle(fontSize: 20),
                ),
                Spacer(
                  flex: 1,
                ),
                Text(
                  '₹',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff005DFF),
                  ),
                ),
                Text(
                  novelResponse[userSelectedIndex]['one_week_rent_price']
                      .toString(),
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff005DFF),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  '₹',
                  style: TextStyle(
                    fontSize: 20.0,
                    decoration: TextDecoration.lineThrough,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff005DFF),
                  ),
                ),
                Text(
                  novelResponse[userSelectedIndex]['mrp'].toString(),
                  style: TextStyle(
                    fontSize: 20.0,
                    decoration: TextDecoration.lineThrough,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff005DFF),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
                'Lorem ipsum dolor sit amet, consectetur a Maecenas pretium, dolor vel posuere rhoncus, libero ante lacinia odio, ut viverra risus justo ut enim.'),
          ],
        ),
      ),
    );
  }
}
