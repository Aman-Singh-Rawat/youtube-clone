import 'package:cloudinary_public/cloudinary_public.dart';

import 'dart:io';

class SendImageToCloudinary {
  static final cloudinary = CloudinaryPublic(
    'drq0tjovm',
    'youtube-clone',
    cache: false,
  );

  static Future<String?> sendImage(File imagePath, String folderName) async {
    try {
      final res = await cloudinary.uploadFile(
        CloudinaryFile.fromFile(
          imagePath.path,
          folder: folderName,
          resourceType: CloudinaryResourceType.Image,
          context: {'alt': 'profile picture', 'caption': 'this is profile pic'},
        ),
      );
      res.url;
      print(res.url);
    } catch (error) {
      print(error);
    }
  }
}
