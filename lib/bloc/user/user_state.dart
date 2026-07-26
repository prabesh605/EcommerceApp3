import 'package:ecommerce_app3/models/user_model.dart';

abstract class UserState {}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserLoaded extends UserState {
  UserModel data;
  UserLoaded(this.data);
}
