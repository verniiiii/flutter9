// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_transaction_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EditTransactionStore on _EditTransactionStore, Store {
  late final _$titleAtom = Atom(
    name: '_EditTransactionStore.title',
    context: context,
  );

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  late final _$descriptionAtom = Atom(
    name: '_EditTransactionStore.description',
    context: context,
  );

  @override
  String get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  late final _$amountAtom = Atom(
    name: '_EditTransactionStore.amount',
    context: context,
  );

  @override
  double get amount {
    _$amountAtom.reportRead();
    return super.amount;
  }

  @override
  set amount(double value) {
    _$amountAtom.reportWrite(value, super.amount, () {
      super.amount = value;
    });
  }

  late final _$typeAtom = Atom(
    name: '_EditTransactionStore.type',
    context: context,
  );

  @override
  TransactionType get type {
    _$typeAtom.reportRead();
    return super.type;
  }

  @override
  set type(TransactionType value) {
    _$typeAtom.reportWrite(value, super.type, () {
      super.type = value;
    });
  }

  late final _$selectedCategoryAtom = Atom(
    name: '_EditTransactionStore.selectedCategory',
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

  late final _$_EditTransactionStoreActionController = ActionController(
    name: '_EditTransactionStore',
    context: context,
  );

  @override
  void setTitle(String value) {
    final _$actionInfo = _$_EditTransactionStoreActionController.startAction(
      name: '_EditTransactionStore.setTitle',
    );
    try {
      return super.setTitle(value);
    } finally {
      _$_EditTransactionStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDescription(String value) {
    final _$actionInfo = _$_EditTransactionStoreActionController.startAction(
      name: '_EditTransactionStore.setDescription',
    );
    try {
      return super.setDescription(value);
    } finally {
      _$_EditTransactionStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAmount(double value) {
    final _$actionInfo = _$_EditTransactionStoreActionController.startAction(
      name: '_EditTransactionStore.setAmount',
    );
    try {
      return super.setAmount(value);
    } finally {
      _$_EditTransactionStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setType(TransactionType value) {
    final _$actionInfo = _$_EditTransactionStoreActionController.startAction(
      name: '_EditTransactionStore.setType',
    );
    try {
      return super.setType(value);
    } finally {
      _$_EditTransactionStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedCategory(String value) {
    final _$actionInfo = _$_EditTransactionStoreActionController.startAction(
      name: '_EditTransactionStore.setSelectedCategory',
    );
    try {
      return super.setSelectedCategory(value);
    } finally {
      _$_EditTransactionStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateTransaction(String id) {
    final _$actionInfo = _$_EditTransactionStoreActionController.startAction(
      name: '_EditTransactionStore.updateTransaction',
    );
    try {
      return super.updateTransaction(id);
    } finally {
      _$_EditTransactionStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
title: ${title},
description: ${description},
amount: ${amount},
type: ${type},
selectedCategory: ${selectedCategory}
    ''';
  }
}
