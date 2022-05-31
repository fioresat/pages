import 'package:flutter/material.dart';
import 'page1.dart';
import 'page2.dart';
import 'custom_theme.dart';

Set<String> ideas = {};
int a = 0;


void removeItem(int removeAt) {
  ideas.remove(ideas.elementAt(removeAt));
}

void main() {
  runApp(Nav2App());
}

class Nav2App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: CustomTheme.lightTheme,
      routes: {
        '/': (context) => const MyStatefulWidget(),
        '/details': (context) => const DetailScreenWidget(),
      },
    );
  }
}
