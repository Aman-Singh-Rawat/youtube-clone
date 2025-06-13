import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:youtube_clone/cores/screens/error_page.dart';
import 'package:youtube_clone/cores/screens/loader.dart';
import 'package:youtube_clone/cores/widgets/image_button.dart';
import 'package:youtube_clone/features/auth/provider/user_provider.dart';
import 'package:youtube_clone/features/channel/my_channel/repository/edit_field.dart';
import 'package:youtube_clone/features/channel/my_channel/repository/send_image_to_cloudinary.dart';
import 'package:youtube_clone/features/channel/my_channel/widgets/edit_setting_dialog.dart';
import 'package:youtube_clone/features/channel/my_channel/widgets/setting_field_item.dart';

class MyChannelSettings extends ConsumerStatefulWidget {
  const MyChannelSettings({super.key});

  @override
  ConsumerState<MyChannelSettings> createState() => _MyChannelSettingsState();
}

class _MyChannelSettingsState extends ConsumerState<MyChannelSettings> {
  bool _isSwitched = false;
  File? _image;
  final _picker = ImagePicker();

  _getImageFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      _image = File(pickedFile.path);
      String? imageUrl = await SendImageToCloudinary.sendImage(
        _image!,
        'user/profile picture',
      );
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ref
        .watch(currentUserProvider)
        .when(
          data:
              (currentUser) => Scaffold(
                body: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            SizedBox(
                              height: 170,
                              width: double.infinity,
                              child: Image.asset(
                                'assets/images/flutter background.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              left: 180,
                              top: 60,
                              child: CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.grey,
                                backgroundImage: CachedNetworkImageProvider(
                                  currentUser.profilePicture,
                                ),
                              ),
                            ),
                            Positioned(
                              right: 16,
                              top: 10,
                              child: ImageButton(
                                onPressed: () {
                                  _getImageFromGallery();
                                },
                                image: 'camera.png',
                                haveColor: false,
                              ),
                            ),
                          ],
                        ),

                        // Second Part
                        const SizedBox(height: 14),

                        SettingsItem(
                          identifier: 'Name',
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder:
                                  (context) => SettingsDialog(
                                    identifier: 'Your new Display name',
                                    onSave: (name) {
                                      ref
                                          .watch(editSettingsProvider)
                                          .editDisplayName(name);
                                    },
                                  ),
                            );
                          },
                          value: currentUser.displayName,
                        ),
                        const SizedBox(height: 14),
                        SettingsItem(
                          identifier: 'Description',
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder:
                                  (context) => SettingsDialog(
                                    identifier: 'Your new Descripton',
                                    onSave: (username) {
                                      ref
                                          .watch(editSettingsProvider)
                                          .editUserName(username);
                                    },
                                  ),
                            );
                          },
                          value: currentUser.username,
                        ),
                        const SizedBox(height: 14),
                        SettingsItem(
                          identifier: 'Description',
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder:
                                  (context) => SettingsDialog(
                                    identifier: 'Description',
                                    onSave: (description) {
                                      ref
                                          .watch(editSettingsProvider)
                                          .editDescription(description);
                                    },
                                  ),
                            );
                          },
                          value: currentUser.description,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12, right: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('keep all my subscribers private'),
                              Switch(
                                value: _isSwitched,
                                onChanged: (value) {
                                  setState(() {
                                    _isSwitched = value;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 20,
                            horizontal: 10.0,
                          ),
                          child: Text(
                            'Changes made on your names and profile pictures are visible only to youtube and not other Google Services',
                            style: TextStyle(color: Colors.blueGrey),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          error: (error, stackTrace) => ErrorPage(),
          loading: () => Loader(),
        );
  }
}
