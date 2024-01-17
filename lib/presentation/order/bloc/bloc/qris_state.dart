part of 'qris_bloc.dart';

@freezed
class QrisState with _$QrisState {
  const factory QrisState.initial() = _Initial;
  const factory QrisState.loading() = _Loading;
  const factory QrisState.error(String error) = _Error;
  //qrisResponse
  const factory QrisState.qrisResponse(QrisResponseModel qrisResponseModel) =
      _QrisResponse;
  //success
  const factory QrisState.success(String message) = _Success;
  //statuscheck
  const factory QrisState.statusCheck(
      QrisStatusResponseModel qrisStatusResponseModel) = _StatusCheck;
  
}
