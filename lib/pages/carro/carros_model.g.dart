// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'carros_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CarrosModel on CarrosModelBase, Store {
  late final _$carrosAtom =
      Atom(name: 'CarrosModelBase.carros', context: context);

  @override
  List<Carro>? get carros {
    _$carrosAtom.reportRead();
    return super.carros;
  }

  @override
  set carros(List<Carro>? value) {
    _$carrosAtom.reportWrite(value, super.carros, () {
      super.carros = value;
    });
  }

  late final _$errorAtom =
      Atom(name: 'CarrosModelBase.error', context: context);

  @override
  Exception? get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(Exception? value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$fetchAsyncAction =
      AsyncAction('CarrosModelBase.fetch', context: context);

  @override
  Future fetch(String tipo) {
    return _$fetchAsyncAction.run(() => super.fetch(tipo));
  }

  @override
  String toString() {
    return '''
carros: ${carros},
error: ${error}
    ''';
  }
}
