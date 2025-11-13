import 'package:mobx/mobx.dart';
import 'package:get_it/get_it.dart';
import 'transaction_model.dart';

part 'transaction_details_store.g.dart';

class TransactionDetailsStore = _TransactionDetailsStore with _$TransactionDetailsStore;

abstract class _TransactionDetailsStore with Store {
  final ObservableList<Transaction> transactions = GetIt.I<ObservableList<Transaction>>();

  Transaction? getTransactionById(String id) {
    try {
      return transactions.firstWhere((transaction) => transaction.id == id);
    } catch (e) {
      return null;
    }
  }
}