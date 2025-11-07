import 'package:flutter/material.dart';
import '../features/transactions/data/transaction_store.dart'; // Заменяем импорт

class TransactionInherited extends InheritedWidget {
  final TransactionStore store; // Меняем repository на store

  const TransactionInherited({
    super.key,
    required this.store, // Меняем repository на store
    required super.child,
  });

  static TransactionInherited of(BuildContext context) {
    final TransactionInherited? result =
    context.dependOnInheritedWidgetOfExactType<TransactionInherited>();
    assert(result != null, 'No TransactionInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TransactionInherited oldWidget) {
    return false;
  }
}