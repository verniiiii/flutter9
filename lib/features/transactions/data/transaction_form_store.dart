import 'package:mobx/mobx.dart';
import 'package:get_it/get_it.dart';
import 'transaction_model.dart';
import '../../../../core/constants/categories.dart';

part 'transaction_form_store.g.dart';

class TransactionFormStore = _TransactionFormStore with _$TransactionFormStore;

abstract class _TransactionFormStore with Store {
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
  void addTransaction() {
    final newTransaction = Transaction(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      title: title,
      description: description,
      amount: amount,
      createdAt: DateTime.now(),
      type: type,
      category: selectedCategory,
    );
    transactions.add(newTransaction);
  }
}