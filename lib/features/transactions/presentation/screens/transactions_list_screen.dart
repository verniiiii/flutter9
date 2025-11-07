import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import '../widgets/transaction_list.dart';
import '../../data/transaction_model.dart';
import '../../../../core/constants/categories.dart';
import 'transaction_form_screen.dart';
import 'edit_transaction_screen.dart';
import 'statistics_screen.dart';
import '../../../../features/profile/presentation/screens/profile_screen.dart';
import '../../../../features/transactions/data/transaction_store.dart';

class TransactionsListScreen extends StatefulWidget {
  const TransactionsListScreen({super.key});

  @override
  State<TransactionsListScreen> createState() => _TransactionsListScreenState();
}

class _TransactionsListScreenState extends State<TransactionsListScreen> {
  String _selectedCategory = 'Все категории';
  String _searchQuery = '';

  late TransactionStore _store; // Добавляем поле store

  @override
  void initState() {
    super.initState();
    _store = GetIt.I<TransactionStore>(); // Инициализируем в initState
  }

  void _addTransaction() {
    context.push('/add');
  }

  void _toggleTransaction(String id) {
    _store.toggleTransactionType(id); // Заменяем вызов репозитория
  }

  void _deleteTransaction(String id) {
    _store.deleteTransaction(id); // Заменяем вызов репозитория
  }

  void _editTransaction(Transaction transaction) {
    context.push('/edit/${transaction.id}', extra: transaction);
  }

  void _showTransactionDetails(String transactionId) {
    context.pushReplacement('/details?id=$transactionId');
  }

  void _showStatistics() {
    context.push('/statistics');
  }

  void _showProfile() {
    context.push('/profile');
  }

  List<Transaction> get _filteredTransactions {
    return _store.transactions.where((transaction) { // Используем store.transactions
      final matchesQuery =
          transaction.title.toLowerCase().contains(_searchQuery.toLowerCase()) ||
              transaction.description.toLowerCase().contains(_searchQuery.toLowerCase());

      final matchesCategory = _selectedCategory == 'Все категории' ||
          transaction.category == _selectedCategory;

      return matchesQuery && matchesCategory;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final allCategories = ['Все категории', ...TransactionCategories.incomeCategories, ...TransactionCategories.expenseCategories];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Финансовый Трекер'),
        actions: [
          IconButton(
            icon: const Icon(Icons.bar_chart),
            onPressed: _showStatistics,
            tooltip: 'Статистика',
          ),
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: _showProfile,
            tooltip: 'Профиль',
          ),
        ],
      ),
      body: Column(
        children: [
          // Поиск и фильтрация
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Поиск транзакций',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _searchQuery = value;
                    });
                  },
                ),
                const SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  value: _selectedCategory,
                  decoration: const InputDecoration(
                    labelText: 'Категория',
                    border: OutlineInputBorder(),
                  ),
                  items: allCategories.map((String category) {
                    return DropdownMenuItem<String>(
                      value: category,
                      child: Text(category),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedCategory = newValue!;
                    });
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: Observer( // Добавляем Observer для реактивных обновлений
              builder: (_) => TransactionList(
                transactions: _filteredTransactions,
                onToggle: _toggleTransaction,
                onDelete: _deleteTransaction,
                onEdit: _editTransaction,
                onDetails: _showTransactionDetails,
                totalIncome: _store.totalIncome, // Используем computed свойства из store
                totalExpenses: _store.totalExpenses,
                balance: _store.balance,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTransaction,
        child: const Icon(Icons.add),
      ),
    );
  }
}