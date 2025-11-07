import 'package:prac9/features/transactions/data/transaction_model.dart';
import 'package:prac9/core/constants/categories.dart';

class TransactionRepository {
  final List<Transaction> transactions = [
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
      id: '10',
      title: 'Зарплата',
      description: '',
      amount: 50000,
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
  title: 'Транспорт',
  description: 'Проездной на месяц',
  amount: 2500,
  createdAt: DateTime.now().subtract(const Duration(days: 2)),
  type: TransactionType.expense,
  category: 'Транспорт',
  ),
  Transaction(
  id: '4',
  title: 'Фриланс',
  description: 'Разработка приложения',
  amount: 20000,
  createdAt: DateTime.now().subtract(const Duration(days: 3)),
  type: TransactionType.income,
  category: 'Фриланс',
  ),
  Transaction(
  id: '5',
  title: 'Развлечения',
  description: 'Поход в кино',
  amount: 800,
  createdAt: DateTime.now().subtract(const Duration(days: 4)),
  type: TransactionType.expense,
  category: 'Развлечения',
  ),
  ];

  void addTransaction(Transaction transaction) {
    transactions.add(transaction);
  }

  void updateTransaction(String id, Transaction updatedTransaction) {
    final index = transactions.indexWhere((transaction) => transaction.id == id);
    if (index != -1) {
      transactions[index] = Transaction(
        id: id,
        title: updatedTransaction.title,
        description: updatedTransaction.description,
        amount: updatedTransaction.amount,
        createdAt: transactions[index].createdAt,
        type: updatedTransaction.type,
        category: updatedTransaction.category,
      );
    }
  }

  void deleteTransaction(String id) {
    transactions.removeWhere((transaction) => transaction.id == id);
  }

  void toggleTransactionType(String id) {
    final index = transactions.indexWhere((transaction) => transaction.id == id);
    if (index != -1) {
      transactions[index] = Transaction(
        id: transactions[index].id,
        title: transactions[index].title,
        description: transactions[index].description,
        amount: transactions[index].amount,
        createdAt: transactions[index].createdAt,
        type: transactions[index].isExpense ? TransactionType.income : TransactionType.expense,
        category: transactions[index].category,
      );
    }
  }

  double getTotalIncome() {
    return transactions
        .where((transaction) => transaction.isIncome)
        .fold(0.0, (sum, transaction) => sum + transaction.amount);
  }

  double getTotalExpenses() {
    return transactions
        .where((transaction) => transaction.isExpense)
        .fold(0.0, (sum, transaction) => sum + transaction.amount);
  }

  double getBalance() {
    return getTotalIncome() - getTotalExpenses();
  }
}