import 'package:bloc/bloc.dart';
import 'package:fic1_pos_flutter_martinus/data/datasources/auth_remote_datasource.dart';
import 'package:fic1_pos_flutter_martinus/data/models/response/auth_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRemoteDatasource authRemoteDatasource;
  LoginBloc(this.authRemoteDatasource) : super(_Initial()) {
    on<_Login>((event, emit) async {
      emit(const _Loading());
      final response = await authRemoteDatasource.login(
        event.email,
        event.password,
      );
      response.fold(
        (l) {
          emit(_Error(l));
          // print(l);
        },
        (r) {
          emit(_Success(r));
          // print(r);
        },
      );
    });
  }
}
