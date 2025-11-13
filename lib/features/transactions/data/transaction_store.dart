import 'package:mobx/mobx.dart';
import 'transaction_model.dart';
import '../../../../core/constants/categories.dart';

part 'transaction_store.g.dart';

class TransactionStore = _TransactionStore with _$TransactionStore;
abstract class _TransactionStore with Store {
  @observable
  ObservableList<Transaction> transactions = ObservableList<Transaction>.of([
    Transaction(
      id: '1',
      title: 'Стипендия',
      description: 'Стипендия за январь',
      amount: 10000,
      createdAt: DateTime.now(),
      type: TransactionType.income,
      category: 'Зарплата',
    ),
    Transaction(
      id: '2',
      title: 'Продукты',
      description: 'Покупки в супермаркете',
      amount: 3500,
      createdAt: DateTime.now().subtract(const Duration(days: 1)),
      type: TransactionType.expense,
      category: 'Продукты',
    ),
    Transaction(
      id: '3',
      title: 'сумка',
      description: '',
      amount: 15000,
      createdAt: DateTime.now().subtract(const Duration(days: 1)),
      type: TransactionType.expense,
      category: 'Одежда',
    ),
    // остальные транзакции из вашего репозитория
  ]);
  @action
  void addTransaction(Transaction transaction) {
    transactions.add(transaction);
  }
  @action
  void updateTransaction(String id, Transaction updatedTransaction) {
    final index = transactions.indexWhere((transaction) => transaction.id == id);
    if (index != -1) {
      transactions[index] = updatedTransaction.copyWith(id: id);
    }
  }
  @action
  void deleteTransaction(String id) {
    transactions.removeWhere((transaction) => transaction.id == id);
  }

  @action
  void toggleTransactionType(String id) {
    final index = transactions.indexWhere((transaction) => transaction.id == id);
    if (index != -1) {
      final transaction = transactions[index];
      transactions[index] = transaction.copyWith(
        type: transaction.isIncome ? TransactionType.expense : TransactionType.income,
      );
    }
  }
  @computed
  double get totalIncome => transactions
      .where((transaction) => transaction.isIncome)
      .fold(0.0, (sum, transaction) => sum + transaction.amount);
  @computed
  double get totalExpenses => transactions
      .where((transaction) => transaction.isExpense)
      .fold(0.0, (sum, transaction) => sum + transaction.amount);
  @computed
  double get balance => totalIncome - totalExpenses;
}