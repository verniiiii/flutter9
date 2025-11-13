// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transactions_list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TransactionsListStore on _TransactionsListStore, Store {
  Computed<List<Transaction>>? _$filteredTransactionsComputed;

  @override
  List<Transaction> get filteredTransactions =>
      (_$filteredTransactionsComputed ??= Computed<List<Transaction>>(
        () => super.filteredTransactions,
        name: '_TransactionsListStore.filteredTransactions',
      )).value;

  late final _$searchQueryAtom = Atom(
    name: '_TransactionsListStore.searchQuery',
    context: context,
  );

  @override
  String get searchQuery {
    _$searchQueryAtom.reportRead();
    return super.searchQuery;
  }

  @override
  set searchQuery(String value) {
    _$searchQueryAtom.reportWrite(value, super.searchQuery, () {
      super.searchQuery = value;
    });
  }

  late final _$selectedCategoryAtom = Atom(
    name: '_TransactionsListStore.selectedCategory',
    context: context,
  );

  @override
  String get selectedCategory {
    _$selectedCategoryAtom.reportRead();
    return super.selectedCategory;
  }

  @override
  set selectedCategory(String value) {
    _$selectedCategoryAtom.reportWrite(value, super.selectedCategory, () {
      super.selectedCategory = value;
    });
  }

  late final _$sortCriteriaAtom = Atom(
    name: '_TransactionsListStore.sortCriteria',
    context: context,
  );

  @override
  String get sortCriteria {
    _$sortCriteriaAtom.reportRead();
    return super.sortCriteria;
  }

  @override
  set sortCriteria(String value) {
    _$sortCriteriaAtom.reportWrite(value, super.sortCriteria, () {
      super.sortCriteria = value;
    });
  }

  late final _$_TransactionsListStoreActionController = ActionController(
    name: '_TransactionsListStore',
    context: context,
  );

  @override
  void setSearchQuery(String value) {
    final _$actionInfo = _$_TransactionsListStoreActionController.startAction(
      name: '_TransactionsListStore.setSearchQuery',
    );
    try {
      return super.setSearchQuery(value);
    } finally {
      _$_TransactionsListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedCategory(String value) {
    final _$actionInfo = _$_TransactionsListStoreActionController.startAction(
      name: '_TransactionsListStore.setSelectedCategory',
    );
    try {
      return super.setSelectedCategory(value);
    } finally {
      _$_TransactionsListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSortCriteria(String value) {
    final _$actionInfo = _$_TransactionsListStoreActionController.startAction(
      name: '_TransactionsListStore.setSortCriteria',
    );
    try {
      return super.setSortCriteria(value);
    } finally {
      _$_TransactionsListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deleteTransaction(String id) {
    final _$actionInfo = _$_TransactionsListStoreActionController.startAction(
      name: '_TransactionsListStore.deleteTransaction',
    );
    try {
      return super.deleteTransaction(id);
    } finally {
      _$_TransactionsListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleTransactionType(String id) {
    final _$actionInfo = _$_TransactionsListStoreActionController.startAction(
      name: '_TransactionsListStore.toggleTransactionType',
    );
    try {
      return super.toggleTransactionType(id);
    } finally {
      _$_TransactionsListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
searchQuery: ${searchQuery},
selectedCategory: ${selectedCategory},
sortCriteria: ${sortCriteria},
filteredTransactions: ${filteredTransactions}
    ''';
  }
}
