import '../../data/data.dart';
import 'main_state.dart';

class LoadingState extends MainState {}

class LoadingStatePagination extends MainState {
  List<dynamic> list = [];
  bool isFirstFetch;

  LoadingStatePagination({required this.list, this.isFirstFetch = true});

  List<dynamic> getList() => list;
}

class Loaded extends MainState {

  List<Products> list;


  Loaded(
      {required this.list,
   });

  List<Products> getList() => list;
}

class LoadedWithData extends MainState {
  dynamic data;
  dynamic bankData;
  dynamic gst;
  num? selectedNum;

  LoadedWithData(
      {required this.data, this.selectedNum, this.bankData, this.gst});

  dynamic getData() => data;
}

class ErrorState extends MainState {}

class RefreshPage extends MainState {}

class Empty extends MainState {}

class CreateCartCallCompleted extends MainState {
  final num? id;

  CreateCartCallCompleted(this.id);
}

class RefreshHistoryPage extends MainState {
  final bool refresh;

  RefreshHistoryPage(this.refresh);
}

class CreatingCart extends MainState {}

class CallComplete extends MainState {}

class CreateOrderCompleted extends MainState {
  final num? id;

  final int? orderId;
  final String? orderNumber;

  CreateOrderCompleted(this.id, this.orderId, this.orderNumber);
}

class PaymentTokenReceived extends MainState {
  final String? token;
  final String? orderNumber;
  final int? orderId;

  PaymentTokenReceived(this.token, this.orderNumber, this.orderId);
}

class PaymentStatusUpdated extends MainState {}

class CallFailed extends MainState {}

class LoadedBankDetails extends MainState {
  dynamic bankData;
  dynamic gstData;
  dynamic address;

  LoadedBankDetails({required this.bankData, this.gstData, this.address});

  dynamic getBankData() => bankData;

  dynamic getGstData() => gstData;
}
