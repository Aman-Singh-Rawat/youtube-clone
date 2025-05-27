import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_clone/cores/widgets/flat_button.dart';
import 'package:youtube_clone/features/auth/repository/user_data_service.dart';

final formKey = GlobalKey<FormState>();

class UsernamePage extends ConsumerStatefulWidget {
  const UsernamePage({
    super.key,
    required this.displayName,
    required this.email,
    required this.profilePic,
  });

  final String displayName;
  final String profilePic;
  final String email;

  @override
  ConsumerState<UsernamePage> createState() => _UsernamePageState();
}

class _UsernamePageState extends ConsumerState<UsernamePage> {
  final TextEditingController usernameController = TextEditingController();
  String? targetedUsername;
  bool _isValidate = true;

  void validateUsername() async {
    final userMap = await FirebaseFirestore.instance.collection('users').get();
    final users = userMap.docs.map((user) => user).toList();

    for (var user in users) {
      if (usernameController.text == user.data()['username']) {
        targetedUsername = user.data()['username'];
        _isValidate = false;
        setState(() {});
      }

      if (usernameController.text != targetedUsername) {
        _isValidate = true;
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 26, horizontal: 14),
              child: Text(
                'Enter the username',
                style: TextStyle(color: Colors.blueGrey),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15.0),
              child: Form(
                child: TextFormField(
                  key: formKey,
                  onChanged: (username) {
                    validateUsername();
                  },
                  autovalidateMode: AutovalidateMode.always,
                  validator: (username) {
                    return _isValidate ? null : 'username already taken';
                  },
                  controller: usernameController,
                  decoration: InputDecoration(
                    suffixIcon: Icon(
                      _isValidate ? Icons.verified_user_rounded : Icons.cancel,
                    ),
                    suffixIconColor: _isValidate ? Colors.green : Colors.red,
                    hintText: 'Insert username',
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    ),
                  ),
                ),
              ),
            ),

            const Spacer(),

            Padding(
              padding: EdgeInsets.only(bottom: 30, left: 8, right: 8),
              child: FlatButton(
                text: 'CONTINUE',
                onPressed: () async {
                  _isValidate
                      ? await ref
                          .read(userDataServiceProvider)
                          .addUserDataToFirestore(
                            displayName: widget.displayName,
                            email: widget.email,
                            profilePicture: widget.profilePic,
                            description: '',
                            username: usernameController.text,
                          )
                      : null;
                },
                color: _isValidate ? Colors.green : Colors.green.shade200,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
