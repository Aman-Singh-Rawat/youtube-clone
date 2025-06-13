import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageTabBar extends StatelessWidget {
  const PageTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 14.0),
      child: TabBar(
        isScrollable: true,
        labelStyle: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
        indicatorSize: TabBarIndicatorSize.label,
        indicatorPadding: const EdgeInsets.only(top: 12),
        tabs: [
          Text('Home'),
          Text('Videos'),
          Text('shorts'),
          Text('community'),
          Text('playlists'),
          Text('channels'),
          Text('about'),
        ],
      ),
    );
  }
}
