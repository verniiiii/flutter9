import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import '../../data/transaction_model.dart';
import '../../data/transaction_store.dart'; // Добавляем импорт store
import '../../../../core/constants/categories.dart';

class TransactionDetailsScreen extends StatefulWidget {
  final String transactionId;

  const TransactionDetailsScreen({super.key, required this.transactionId});

  @override
  State<TransactionDetailsScreen> createState() => _TransactionDetailsScreenState();
}

class _TransactionDetailsScreenState extends State<TransactionDetailsScreen> {
  late TransactionStore _store; // Добавляем поле store

  @override
  void initState() {
    super.initState();
    _store = GetIt.I<TransactionStore>(); // Инициализируем в initState
  }

  // Метод для получения транзакции по ID из store
  Transaction? _getTransactionById(String id) {
    try {
      return _store.transactions.firstWhere((transaction) => transaction.id == id);
    } catch (e) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Observer( // Оборачиваем в Observer для реактивных обновлений
      builder: (_) {
        // Получаем транзакцию из store по ID
        final transaction = _getTransactionById(widget.transactionId);

        // Если транзакция не найдена, показываем заглушку
        if (transaction == null) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Детали транзакции'),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => context.go('/'),
              ),
            ),
            body: const Center(
              child: Text('Транзакция не найдена'),
            ),
          );
        }

        return Scaffold(
          appBar: AppBar(
            title: const Text('Детали транзакции'),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                // ГОРИЗОНТАЛЬНАЯ НАВИГАЦИЯ - возврат с заменой
                context.go('/');
              },
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          transaction.title,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          transaction.description,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Сумма:',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            Text(
                              '${transaction.amount.toStringAsFixed(2)} ₽',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: transaction.isIncome ? Colors.green : Colors.red,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Категория:',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            Text(
                              transaction.category,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Тип:',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            Text(
                              transaction.type.displayName,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Дата:',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            Text(
                              '${transaction.createdAt.day}.${transaction.createdAt.month}.${transaction.createdAt.year}',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // Демонстрация навигации назад
                      context.pop();
                    },
                    child: const Text('Назад (Pop)'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}