part of 'checkout_bloc.dart';

@freezed
class CheckoutEvent with _$CheckoutEvent {
  const factory CheckoutEvent.started() = _Started;
  //add table number
  const factory CheckoutEvent.loadTableNumber (int tableNumber) = _LoadTableNumber;
  const factory CheckoutEvent.addcheckout( Product product) =
      _AddCheckout;
  const factory CheckoutEvent.removeCheckout(Product product) =
      _RemoveCheckout;

  const factory CheckoutEvent.deleteCheckout(Product product) =
      _DeleteCheckout;

      const factory CheckoutEvent.clearTableOrder() =
      _ClearTableOrder;
}
