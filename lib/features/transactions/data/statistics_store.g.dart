// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statistics_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StatisticsStore on _StatisticsStore, Store {
  Computed<double>? _$totalIncomeComputed;

  @override
  double get totalIncome => (_$totalIncomeComputed ??= Computed<double>(
    () => super.totalIncome,
    name: '_StatisticsStore.totalIncome',
  )).value;
  Computed<double>? _$totalExpensesComputed;

  @override
  double get totalExpenses => (_$totalExpensesComputed ??= Computed<double>(
    () => super.totalExpenses,
    name: '_StatisticsStore.totalExpenses',
  )).value;
  Computed<double>? _$balanceComputed;

  @override
  double get balance => (_$balanceComputed ??= Computed<double>(
    () => super.balance,
    name: '_StatisticsStore.balance',
  )).value;
  Computed<Map<String, double>>? _$incomeStatsComputed;

  @override
  Map<String, double> get incomeStats =>
      (_$incomeStatsComputed ??= Computed<Map<String, double>>(
        () => super.incomeStats,
        name: '_StatisticsStore.incomeStats',
      )).value;
  Computed<Map<String, double>>? _$expenseStatsComputed;

  @override
  Map<String, double> get expenseStats =>
      (_$expenseStatsComputed ??= Computed<Map<String, double>>(
        () => super.expenseStats,
        name: '_StatisticsStore.expenseStats',
      )).value;

  late final _$searchQueryAtom = Atom(
    name: '_StatisticsStore.searchQuery',
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
    name: '_StatisticsStore.selectedCategory',
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

  late final _$_StatisticsStoreActionController = ActionController(
    name: '_StatisticsStore',
    context: context,
  );

  @override
  void setSearchQuery(String value) {
    final _$actionInfo = _$_StatisticsStoreActionController.startAction(
      name: '_StatisticsStore.setSearchQuery',
    );
    try {
      return super.setSearchQuery(value);
    } finally {
      _$_StatisticsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedCategory(String value) {
    final _$actionInfo = _$_StatisticsStoreActionController.startAction(
      name: '_StatisticsStore.setSelectedCategory',
    );
    try {
      return super.setSelectedCategory(value);
    } finally {
      _$_StatisticsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
searchQuery: ${searchQuery},
selectedCategory: ${selectedCategory},
totalIncome: ${totalIncome},
totalExpenses: ${totalExpenses},
balance: ${balance},
incomeStats: ${incomeStats},
expenseStats: ${expenseStats}
    ''';
  }
}
