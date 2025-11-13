import 'package:mobx/mobx.dart';
import 'package:get_it/get_it.dart';
import 'transaction_model.dart';
import '../../../../core/constants/categories.dart';

part 'transactions_list_store.g.dart';

class TransactionsListStore = _TransactionsListStore with _$TransactionsListStore;

abstract class _TransactionsListStore with Store {
  final ObservableList<Transaction> transactions = GetIt.I<ObservableList<Transaction>>();

  @observable
  String searchQuery = '';

  @observable
  String selectedCategory = 'Все категории';

  @observable
  String sortCriteria = 'Дата создания';

  @computed
  List<Transaction> get filteredTransactions {
    final query = searchQuery.toLowerCase();
    var list = transactions.where((transaction) {
      final matchesQuery = transaction.title.toLowerCase().contains(query) ||
          transaction.description.toLowerCase().contains(query);
      final matchesCategory = selectedCategory == 'Все категории' ||
          transaction.category == selectedCategory;
      return matchesQuery && matchesCategory;
    }).toList();

    list.sort((a, b) {
      switch (sortCriteria) {
        case 'Название':
          return a.title.compareTo(b.title);
        case 'Дата создания':
          return b.createdAt.compareTo(a.createdAt);
        default:
          return 0;
      }
    });
    return list;
  }

  @action
  void setSearchQuery(String value) {
    searchQuery = value;
  }

  @action
  void setSelectedCategory(String value) {
    selectedCategory = value;
  }

  @action
  void setSortCriteria(String value) {
    sortCriteria = value;
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
}