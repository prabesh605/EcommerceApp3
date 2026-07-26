import 'package:ecommerce_app3/bloc/user/user_event.dart';
import 'package:ecommerce_app3/bloc/user/user_state.dart';
import 'package:ecommerce_app3/models/user_model.dart';
import 'package:ecommerce_app3/services/firebase_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  FirebaseService service = FirebaseService();
  UserBloc() : super(UserInitial()) {
    on<GetUserDetail>((event, emit) async {
      User? user = await service.getLoginUserInfo();
      emit(UserLoading());
      var data = await service.getCurrentUserData(user?.uid ?? '');
      emit(UserLoaded(data));
    });
  }
}
