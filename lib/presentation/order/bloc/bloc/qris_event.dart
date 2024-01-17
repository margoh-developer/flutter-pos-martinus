part of 'qris_bloc.dart';

@freezed
class QrisEvent with _$QrisEvent {
  const factory QrisEvent.started() = _Started;
  //generateQRisCode
  const factory QrisEvent.generateQRisCode(String orderId, int grossAmount) = _GenerateQRisCode;
  //checkPaymentStatus
  const factory QrisEvent.checkPaymentStatus(String orderId) = _CheckPaymentStatus;
}