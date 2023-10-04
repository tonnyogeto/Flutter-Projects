import 'package:flutter/material.dart';

//widgets are the bedrock of flutter application
//widget tree describes the structure of widgets inside your app
//there are loads and loads of widgets that are prebuilt inside flutter that we can use out of the box i.e text widgets,button widgets,row widgets,column widgets or even widgets

void main()=> runApp(MaterialApp(
  home: Scaffold(
    appBar: AppBar(
      title: Text('My first App'),
      centerTitle: true,
    ),
    body: Text('Hello Niggas'),
    )
));

