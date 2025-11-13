import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'core/app_router.dart';
import 'features/transactions/data/transaction_model.dart';
import 'features/transactions/data/transaction_form_store.dart';
import 'features/transactions/data/edit_transaction_store.dart';
import 'features/transactions/data/transactions_list_store.dart';
import 'features/transactions/data/statistics_store.dart';
import 'features/transactions/data/transaction_details_store.dart';

void main() {
  // Регистрируем общий ObservableList для всех stores
  GetIt.I.registerSingleton<ObservableList<Transaction>>(ObservableList<Transaction>());

  // Регистрируем все stores
  GetIt.I.registerSingleton<TransactionFormStore>(TransactionFormStore());
  GetIt.I.registerSingleton<EditTransactionStore>(EditTransactionStore());
  GetIt.I.registerSingleton<TransactionsListStore>(TransactionsListStore());
  GetIt.I.registerSingleton<StatisticsStore>(StatisticsStore());
  GetIt.I.registerSingleton<TransactionDetailsStore>(TransactionDetailsStore());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GoRouter _router = AppRouter().router;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Financial Tracker',
      routerConfig: _router,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}