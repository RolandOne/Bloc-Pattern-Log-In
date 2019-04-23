import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'validator.dart';

class Bloc extends Object with Validators implements BaseBloc {
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  Function(String) get emailChanged => _emailController.sink.add;

  Function(String) get passwordChanged => _passwordController.sink.add;

  Stream<String> get email => _emailController.stream.transform(emailValidator);

  Stream<String> get password =>
      _passwordController.stream.transform(passwordValidator);

  Stream<List<dynamic>> get submitCheck =>
      Observable.combineLatest2(email, password, (e, p) => [true, e, p]);

  submit() {}

  @override
  void dispose() {
    _emailController?.close();
    _passwordController?.close();
  }
}

abstract class BaseBloc {
  void dispose();
}
