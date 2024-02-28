import '../Models/user_model.dart';

enum UserStatus{
  initial,
  loading,
  loaded,
  error,

}

class UserState {
  UserStatus? userStatus;
  UserModel? userModel;
  String? error;

  UserState({
    required  this.userStatus,
    this.userModel,
    this.error,
  });
  ///
  factory UserState.intial(){
    return UserState(userStatus: UserStatus.initial,userModel: null,error: "");
  }
  ///
  UserState copyWith({
    UserStatus? newsStatus,
    UserModel? newsModel,
    String? error, required UserStatus userStatus,
  }) {
    return UserState(
      userStatus: newsStatus ?? this.userStatus,
      userModel: newsModel ?? this.userModel,
      error: error ?? this.error,
    );
  }
  
}
