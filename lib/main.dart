
import 'package:flutter/material.dart';
import 'package:gemini_artistic/providers/ArtMuseProvider.dart';
import 'package:gemini_artistic/screens/HomePage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create:(context)=>ArtMuseProvider(),
      child:MaterialApp(
        title: 'Art Muse',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    )
  );
}



