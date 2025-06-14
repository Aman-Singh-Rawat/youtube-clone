import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../cores/colors.dart';
import '../../../../cores/widgets/image_button.dart';

class Buttons extends StatelessWidget {
  const Buttons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
