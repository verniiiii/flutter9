import 'package:mobx/mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:collection/collection.dart';
import 'transaction_model.dart';
import '../../../../core/constants/categories.dart';

part 'statistics_store.g.dart';

class StatisticsStore = _StatisticsStore with _$StatisticsStore;

abstract class _StatisticsStore with Store {
  final ObservableList<Transaction> transactions = GetIt.I<ObservableList<Transaction>>();

  @observable
  String searchQuery = '';

  @observable
  String selectedCategory = 'Все категории';

  // Добавляем computed свойства
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

  @computed
  Map<String, double> get incomeStats {
    final filtered = transactions.where((t) => t.type == TransactionType.income).toList();
    final grouped = groupBy(filtered, (t) => t.category);
    return grouped.map((category, transactions) => MapEntry(
      category,
      transactions.fold(0.0, (sum, t) => sum + t.amount),
    ));
  }

  @computed
  Map<String, double> get expenseStats {
    final filtered = transactions.where((t) => t.type == TransactionType.expense).toList();
    final grouped = groupBy(filtered, (t) => t.category);
    return grouped.map((category, transactions) => MapEntry(
      category,
      transactions.fold(0.0, (sum, t) => sum + t.amount),
    ));
  }

  @action
  void setSearchQuery(String value) {
    searchQuery = value;
  }

  @action
  void setSelectedCategory(String value) {
    selectedCategory = value;
  }
}