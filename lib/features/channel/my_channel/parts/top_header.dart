import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_clone/features/auth/model/user_model.dart';

class TopHeader extends StatelessWidget {
  final UserModel user;

  const TopHeader({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Center(
            child: CircleAvatar(
              radius: 38,
              backgroundColor: Colors.grey,
              backgroundImage: CachedNetworkImageProvider(user.profilePicture),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 4),
            child: Text(
              user.displayName,
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 9),
            child: RichText(
              text: TextSpan(
                style: TextStyle(color: Colors.blueGrey),
                children: [
                  TextSpan(text: '${user.username} '),
                  TextSpan(text: '${user.subscription.length} subscriptions '),
                  TextSpan(text: '${user.videos} videos'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
