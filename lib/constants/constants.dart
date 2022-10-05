import 'package:flutter/material.dart';

String BASEURL = " ";
String APIKEY = "OTz3XRALgqmipUGBJvkyOx8Ivy4tDu3I";

class Config {
  double deviceHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  double deviceWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
}

//Colors
Color secondary = const Color(0xff000000);
Color accent = const Color(0xffA8FF35);

Color grey = const Color(0xff171717);
Color black = Colors.black;
Color white = Colors.white;

class Nav {
  goTo(Widget child, BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute<void>(builder: (BuildContext context) {
      return child;
    }));
  }
}
