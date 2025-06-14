import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_clone/features/auth/repository/user_data_service.dart';

import '../model/user_model.dart';

final currentUserProvider = FutureProvider((ref) async {
  final UserModel user =
      await ref.watch(userDataServiceProvider).fetchCurrentUserData();
  return user;
});
