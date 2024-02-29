

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:telegramflutter/Models/user_model.dart';
import 'package:telegramflutter/repo/user_repo.dart';
import 'package:telegramflutter/user_provider/user_state.dart';

final userProvider = StateNotifierProvider< UserNotifier, UserState>(
        (ref) => UserNotifier()
);

class UserNotifier extends StateNotifier<UserState>{
  UserRepo userRepo = UserRepo();

  UserNotifier(): super(UserState.intial()){
    getUserPosts();
  }
  void getUserPosts() async {
    state = state.copyWith(userStatus: UserStatus.loading);

    try {

      UserModel userModel = await userRepo.getAllUserPosts();
      print("${userModel}");
      state = state.copyWith(userStatus: UserStatus.loaded, userModel: userModel);
    } catch (e) {
      state = state.copyWith(userStatus: UserStatus.error, error: e.toString());
    }
  }
}