// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TransactionStore on _TransactionStore, Store {
  Computed<double>? _$totalIncomeComputed;

  @override
  double get totalIncome => (_$totalIncomeComputed ??= Computed<double>(
    () => super.totalIncome,
    name: '_TransactionStore.totalIncome',
  )).value;
  Computed<double>? _$totalExpensesComputed;

  @override
  double get totalExpenses => (_$totalExpensesComputed ??= Computed<double>(
    () => super.totalExpenses,
    name: '_TransactionStore.totalExpenses',
  )).value;
  Computed<double>? _$balanceComputed;

  @override
  double get balance => (_$balanceComputed ??= Computed<double>(
    () => super.balance,
    name: '_TransactionStore.balance',
  )).value;

  late final _$transactionsAtom = Atom(
    name: '_TransactionStore.transactions',
    context: context,
  );

  @override
  ObservableList<Transaction> get transactions {
    _$transactionsAtom.reportRead();
    return super.transactions;
  }

  @override
  set transactions(ObservableList<Transaction> value) {
    _$transactionsAtom.reportWrite(value, super.transactions, () {
      super.transactions = value;
    });
  }

  late final _$_TransactionStoreActionController = ActionController(
    name: '_TransactionStore',
    context: context,
  );

  @override
  void addTransaction(Transaction transaction) {
    final _$actionInfo = _$_TransactionStoreActionController.startAction(
      name: '_TransactionStore.addTransaction',
    );
    try {
      return super.addTransaction(transaction);
    } finally {
      _$_TransactionStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateTransaction(String id, Transaction updatedTransaction) {
    final _$actionInfo = _$_TransactionStoreActionController.startAction(
      name: '_TransactionStore.updateTransaction',
    );
    try {
      return super.updateTransaction(id, updatedTransaction);
    } finally {
      _$_TransactionStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deleteTransaction(String id) {
    final _$actionInfo = _$_TransactionStoreActionController.startAction(
      name: '_TransactionStore.deleteTransaction',
    );
    try {
      return super.deleteTransaction(id);
    } finally {
      _$_TransactionStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleTransactionType(String id) {
    final _$actionInfo = _$_TransactionStoreActionController.startAction(
      name: '_TransactionStore.toggleTransactionType',
    );
    try {
      return super.toggleTransactionType(id);
    } finally {
      _$_TransactionStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
transactions: ${transactions},
totalIncome: ${totalIncome},
totalExpenses: ${totalExpenses},
balance: ${balance}
    ''';
  }
}
