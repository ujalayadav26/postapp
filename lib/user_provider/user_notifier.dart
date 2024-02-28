

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

      UserModel newsModel = await userRepo.getAllUserPosts();
      print("${UserModel}");
      state = state.copyWith(userStatus: UserStatus.loaded, newsModel: newsModel);
    } catch (e) {
      state = state.copyWith(userStatus: UserStatus.error, error: e.toString());
    }
  }
}