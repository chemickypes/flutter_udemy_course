import 'package:firebase_example_login/model/user.dart';
import 'package:bloc/bloc.dart';

abstract class UserEvent{
  UserEvent(this.user);
  User user;
}

class GetUserEvent extends UserEvent {
  GetUserEvent(User user) : super(user);
}


class UserBloc extends Bloc<UserEvent,User>{
  @override
  User get initialState => User('','UserName','UserEmail');

  @override
  Stream<User> mapEventToState(UserEvent event) async*{
    yield event.user;
  }

}