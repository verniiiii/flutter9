import 'package:mobx/mobx.dart';
import 'package:get_it/get_it.dart';
import 'transaction_model.dart';
import '../../../../core/constants/categories.dart';

part 'edit_transaction_store.g.dart';

class EditTransactionStore = _EditTransactionStore with _$EditTransactionStore;

abstract class _EditTransactionStore with Store {
  final ObservableList<Transaction> transactions = GetIt.I<ObservableList<Transaction>>();

  @observable
  String title = '';

  @observable
  String description = '';

  @observable
  double amount = 0.0;

  @observable
  TransactionType type = TransactionType.expense;

  @observable
  String selectedCategory = 'Продукты';

  @action
  void setTitle(String value) {
    title = value;
  }

  @action
  void setDescription(String value) {
    description = value;
  }

  @action
  void setAmount(double value) {
    amount = value;
  }

  @action
  void setType(TransactionType value) {
    type = value;
  }

  @action
  void setSelectedCategory(String value) {
    selectedCategory = value;
  }

  @action
  void updateTransaction(String id) {
    final index = transactions.indexWhere((transaction) => transaction.id == id);
    if (index != -1) {
      transactions[index] = transactions[index].copyWith(
        title: title,
        description: description,
        amount: amount,
        type: type,
        category: selectedCategory,
      );
    }
  }
}