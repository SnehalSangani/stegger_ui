import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stegger_ui/screen/home/provider/home_provider.dart';

import 'screen/home/view/home_screen.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Homeprovider(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/':(context) => home(),
        },
      ),
    ),
  );
}