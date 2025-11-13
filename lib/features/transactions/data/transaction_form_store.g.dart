// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_form_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TransactionFormStore on _TransactionFormStore, Store {
  late final _$titleAtom = Atom(
    name: '_TransactionFormStore.title',
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
    name: '_TransactionFormStore.description',
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
    name: '_TransactionFormStore.amount',
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
    name: '_TransactionFormStore.type',
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
    name: '_TransactionFormStore.selectedCategory',
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

  late final _$_TransactionFormStoreActionController = ActionController(
    name: '_TransactionFormStore',
    context: context,
  );

  @override
  void setTitle(String value) {
    final _$actionInfo = _$_TransactionFormStoreActionController.startAction(
      name: '_TransactionFormStore.setTitle',
    );
    try {
      return super.setTitle(value);
    } finally {
      _$_TransactionFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDescription(String value) {
    final _$actionInfo = _$_TransactionFormStoreActionController.startAction(
      name: '_TransactionFormStore.setDescription',
    );
    try {
      return super.setDescription(value);
    } finally {
      _$_TransactionFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAmount(double value) {
    final _$actionInfo = _$_TransactionFormStoreActionController.startAction(
      name: '_TransactionFormStore.setAmount',
    );
    try {
      return super.setAmount(value);
    } finally {
      _$_TransactionFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setType(TransactionType value) {
    final _$actionInfo = _$_TransactionFormStoreActionController.startAction(
      name: '_TransactionFormStore.setType',
    );
    try {
      return super.setType(value);
    } finally {
      _$_TransactionFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedCategory(String value) {
    final _$actionInfo = _$_TransactionFormStoreActionController.startAction(
      name: '_TransactionFormStore.setSelectedCategory',
    );
    try {
      return super.setSelectedCategory(value);
    } finally {
      _$_TransactionFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addTransaction() {
    final _$actionInfo = _$_TransactionFormStoreActionController.startAction(
      name: '_TransactionFormStore.addTransaction',
    );
    try {
      return super.addTransaction();
    } finally {
      _$_TransactionFormStoreActionController.endAction(_$actionInfo);
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
