import 'package:flutter/material.dart';

enum IIITJEE { physics, chemistry, maths }
enum NEET { physics, chemistry, maths }
enum Class11 {physics, chemistry, maths, biology, english, hindi, physical, commerce}
enum Class12 { physics, chemistry, maths, biology, english, hindi, physical,commerce,sample_papers }





Future<void> iiitjeeDialog(BuildContext context) async {
  switch (await showDialog<IIITJEE>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          contentPadding: EdgeInsets.all(20),
          title: const Text('IITJEE'),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, IIITJEE.physics);
              },
              child: const Text('Physics'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, IIITJEE.chemistry);
              },
              child: const Text('Chemistry'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, IIITJEE.maths);
              },
              child: const Text('Maths'),
            ),
          ],
        );
      }))
  {
    case IIITJEE.chemistry:
      break;
    case IIITJEE.physics:
      // ...
      break;
    case IIITJEE.maths:
    // ...
      break;
    case null:
      // dialog dismissed
      break;
  }
}

Future<void> neetDialog(BuildContext context) async {
  switch (await showDialog<NEET>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          contentPadding: EdgeInsets.all(20),
          title: const Text('NEET'),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, NEET.physics);
              },
              child: const Text('Physics'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, NEET.chemistry);
              },
              child: const Text('Chemistry'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, NEET.maths);
              },
              child: const Text('Maths'),
            ),
          ],
        );
      }))
  {
    case NEET.physics:
      break;
    case NEET.chemistry:
    // ...
      break;
    case NEET.maths:
    // ...
      break;
    case null:
    // dialog dismissed
      break;
  }
}


Future<void> class11Dialog(BuildContext context) async {
  switch (await showDialog<Class11>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          contentPadding: EdgeInsets.all(20),
          title: const Text('Class XI'),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, Class11.physics);
              },
              child: const Text('Physics'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, Class11.chemistry);
              },
              child: const Text('Chemistry'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, Class11.maths);
              },
              child: const Text('Maths'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, Class11.biology);
              },
              child: const Text('Biology'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, Class11.english);
              },
              child: const Text('English'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, Class11.hindi);
              },
              child: const Text('Hindi'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, Class11.physical);
              },
              child: const Text('Physical'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, Class11.commerce);
              },
              child: const Text('Commerce'),
            ),
          ],
        );
      }))
  {
    case Class11.physics:
      break;
    case Class11.chemistry:
    // ...
      break;
    case Class11.maths:
    // ...
      break;
    case Class11.biology:
    // ...
      break;
    case Class11.english:
    // ...
      break;
    case Class11.hindi:
    // ...
      break;
    case Class11.physical:
    // ...
      break;
    case Class11.commerce:
    // ...
      break;
    case null:
    // dialog dismissed
      break;
  }
}


Future<void> class12Dialog(BuildContext context) async {
  switch (await showDialog<Class12>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          contentPadding: EdgeInsets.all(20),
          title: const Text('Class XII'),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, Class12.physics);
              },
              child: const Text('Physics'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, Class12.chemistry);
              },
              child: const Text('Chemistry'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, Class12.maths);
              },
              child: const Text('Maths'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, Class12.biology);
              },
              child: const Text('Biology'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, Class12.english);
              },
              child: const Text('English'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, Class12.hindi);
              },
              child: const Text('Hindi'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, Class12.physical);
              },
              child: const Text('Physical'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, Class12.commerce);
              },
              child: const Text('Commerce'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, Class12.sample_papers);
              },
              child: const Text('Sample Papers'),
            ),
          ],
        );
      }))
  {
    case Class12.physics:
      break;
    case Class12.chemistry:
    // ...
      break;
    case Class12.maths:
    // ...
      break;
    case Class12.biology:
    // ...
      break;
    case Class12.english:
    // ...
      break;
    case Class12.hindi:
    // ...
      break;
    case Class12.physical:
    // ...
      break;
    case Class12.commerce:
    // ...
      break;
    case Class12.sample_papers:
    // ...
      break;
    case null:
    // dialog dismissed
      break;
  }
}