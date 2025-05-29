import 'package:flutter/material.dart';
import 'package:youtube_clone/cores/colors.dart';
import 'package:youtube_clone/cores/widgets/image_button.dart';

class MyChannelScreen extends StatelessWidget {
  const MyChannelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              children: [
                Center(
                  child: CircleAvatar(radius: 38, backgroundColor: Colors.grey),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 4),
                  child: Text(
                    'Aman Singh',
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 9),
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(color: Colors.blueGrey),
                      children: [
                        TextSpan(text: '@aman-sing '),
                        TextSpan(text: 'No subscription '),
                        TextSpan(text: 'No videos'),
                      ],
                    ),
                  ),
                ),
                const Text('More about this channel'),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Container(
                          height: 41,
                          decoration: BoxDecoration(
                            color: softBlueGreyBackGround,
                            borderRadius: BorderRadius.all(Radius.circular(9)),
                          ),
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              'Manage Videos',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: ImageButton(
                          onPressed: () {},
                          image: 'pen.png',
                          haveColor: true,
                        ),
                      ),
                      Expanded(
                        child: ImageButton(
                          onPressed: () {},
                          image: 'time-watched.png',
                          haveColor: true,
                        ),
                      ),
                    ],
                  ),
                ),

                // create tab bar
                Padding(
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
