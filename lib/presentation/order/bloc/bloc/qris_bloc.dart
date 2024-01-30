import 'package:bloc/bloc.dart';
import 'package:CashierPOS/data/datasources/midtrans_remote_datasource.dart';
import 'package:CashierPOS/data/models/response/qris_response_model.dart';
import 'package:CashierPOS/data/models/response/qris_status_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'qris_event.dart';
part 'qris_state.dart';
part 'qris_bloc.freezed.dart';

class QrisBloc extends Bloc<QrisEvent, QrisState> {
  final MidtransRemoteDataSource midtransRemoteDataSource;
  QrisBloc(this.midtransRemoteDataSource) : super(_Initial()) {
    on<_GenerateQRisCode>((event, emit) async {
      emit(_Loading());
      final response = await midtransRemoteDataSource.generateQRCode(
          event.orderId, event.grossAmount);
 
      emit(_QrisResponse(response));
    });

    on<_CheckPaymentStatus>((event, emit) async {
      final response =
          await midtransRemoteDataSource.checkPaymentStatus(event.orderId);
      
      emit(_Loading());
      if (response.transactionStatus == "settlement") {
        emit(_Success("Payment Success"));
      }
    });
  }
}
