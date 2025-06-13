import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabPages extends StatelessWidget {
  const TabPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(children: [
        Center(
          child: Text('Home'),
        ),
        Center(
          child: Text('Videos'),
        ),
        Center(
          child: Text('short'),
        ),
        Center(
          child: Text('Home'),
        ),
        Center(
          child: Text('Home'),
        ),
        Center(
          child: Text('Home'),
        ),
      ]),
    );
  }
}
