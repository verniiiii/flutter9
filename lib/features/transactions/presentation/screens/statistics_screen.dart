import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:collection/collection.dart';
import 'package:flutter_mobx/flutter_mobx.dart'; // Добавляем импорт для Observer
import '../../../../core/constants/categories.dart';
import '../../data/transaction_store.dart';
import 'package:get_it/get_it.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final store = GetIt.I<TransactionStore>(); // Получаем store через GetIt

    Map<String, double> _getCategoryStats(TransactionType type) {
      final filtered = store.transactions.where((t) => t.type == type).toList(); // Используем store.transactions
      final grouped = groupBy(filtered, (t) => t.category);

      return grouped.map((category, transactions) => MapEntry(
        category,
        transactions.fold(0.0, (sum, t) => sum + t.amount),
      ));
    }

    double _getTotal(TransactionType type) {
      return store.transactions // Используем store.transactions
          .where((t) => t.type == type)
          .fold(0.0, (sum, t) => sum + t.amount);
    }

    return Observer( // Оборачиваем в Observer для реактивных обновлений
      builder: (_) {
        final incomeStats = _getCategoryStats(TransactionType.income);
        final expenseStats = _getCategoryStats(TransactionType.expense);
        final totalIncome = store.totalIncome; // Используем computed свойства из store
        final totalExpenses = store.totalExpenses;
        final balance = store.balance;

        return Scaffold(
          appBar: AppBar(
            title: const Text('Статистика'),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => context.pop(), // ВЕРТИКАЛЬНЫЙ ВОЗВРАТ
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Сводка
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Text(
                          'Общая статистика',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[700],
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _buildStatItem('Доходы', '${totalIncome.toStringAsFixed(2)} ₽', Colors.green),
                            _buildStatItem('Расходы', '${totalExpenses.toStringAsFixed(2)} ₽', Colors.red),
                            _buildStatItem('Баланс', '${balance.toStringAsFixed(2)} ₽',
                                balance >= 0 ? Colors.green : Colors.red),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Статистика по доходам
                _buildCategorySection('Доходы по категориям', incomeStats, totalIncome, Colors.green),
                const SizedBox(height: 20),

                // Статистика по расходам
                _buildCategorySection('Расходы по категориям', expenseStats, totalExpenses, Colors.red),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildStatItem(String label, String value, Color color) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[600],
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ],
    );
  }

  Widget _buildCategorySection(String title, Map<String, double> stats, double total, Color color) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(height: 12),
            ...stats.entries.map((entry) => _buildCategoryRow(
              entry.key,
              entry.value,
              total,
              color,
            )).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryRow(String category, double amount, double total, Color color) {
    final percentage = total > 0 ? (amount / total * 100) : 0;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(category),
          ),
          Expanded(
            flex: 3,
            child: LinearProgressIndicator(
              value: percentage / 100,
              backgroundColor: color.withOpacity(0.2),
              valueColor: AlwaysStoppedAnimation<Color>(color),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              '${amount.toStringAsFixed(2)} ₽\n${percentage.toStringAsFixed(1)}%',
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[600],
              ),
            ),
          ),
        ],
      ),
    );
  }
}