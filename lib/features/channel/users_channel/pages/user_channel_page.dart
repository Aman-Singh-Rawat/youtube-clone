import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_clone/cores/widgets/flat_button.dart';

class UserChannelPage extends StatelessWidget {
  const UserChannelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset('assets/images/flutter background.png'),
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 12, top: 20),
              child: Row(
                children: [
                  CircleAvatar(radius: 38, backgroundColor: Colors.grey),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Aman Singh',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '@aman-singh',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Colors.blueGrey,
                            ),
                            children: [
                              TextSpan(text: 'No Subscripton'),
                              TextSpan(text: 'No Videos'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 8, right: 8),
              child: FlatButton(
                text: 'SUBSCRIBE',
                onPressed: () {},
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
