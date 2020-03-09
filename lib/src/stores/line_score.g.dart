// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'line_score.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LineScoreStore on _LineScoreStore, Store {
  Computed<LineScoreStoreState> _$stateComputed;

  @override
  LineScoreStoreState get state =>
      (_$stateComputed ??= Computed<LineScoreStoreState>(() => super.state))
          .value;

  final _$_lineScoreFutureAtom = Atom(name: '_LineScoreStore._lineScoreFuture');

  @override
  ObservableFuture<LineScoreModel> get _lineScoreFuture {
    _$_lineScoreFutureAtom.context.enforceReadPolicy(_$_lineScoreFutureAtom);
    _$_lineScoreFutureAtom.reportObserved();
    return super._lineScoreFuture;
  }

  @override
  set _lineScoreFuture(ObservableFuture<LineScoreModel> value) {
    _$_lineScoreFutureAtom.context.conditionallyRunInAction(() {
      super._lineScoreFuture = value;
      _$_lineScoreFutureAtom.reportChanged();
    }, _$_lineScoreFutureAtom, name: '${_$_lineScoreFutureAtom.name}_set');
  }

  final _$lineScoreAtom = Atom(name: '_LineScoreStore.lineScore');

  @override
  LineScoreModel get lineScore {
    _$lineScoreAtom.context.enforceReadPolicy(_$lineScoreAtom);
    _$lineScoreAtom.reportObserved();
    return super.lineScore;
  }

  @override
  set lineScore(LineScoreModel value) {
    _$lineScoreAtom.context.conditionallyRunInAction(() {
      super.lineScore = value;
      _$lineScoreAtom.reportChanged();
    }, _$lineScoreAtom, name: '${_$lineScoreAtom.name}_set');
  }

  final _$errorMessageAtom = Atom(name: '_LineScoreStore.errorMessage');

  @override
  String get errorMessage {
    _$errorMessageAtom.context.enforceReadPolicy(_$errorMessageAtom);
    _$errorMessageAtom.reportObserved();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.context.conditionallyRunInAction(() {
      super.errorMessage = value;
      _$errorMessageAtom.reportChanged();
    }, _$errorMessageAtom, name: '${_$errorMessageAtom.name}_set');
  }

  final _$geScheduleAsyncAction = AsyncAction('geSchedule');

  @override
  Future<void> geSchedule(String gameId) {
    return _$geScheduleAsyncAction.run(() => super.geSchedule(gameId));
  }

  @override
  String toString() {
    final string =
        'lineScore: ${lineScore.toString()},errorMessage: ${errorMessage.toString()},state: ${state.toString()}';
    return '{$string}';
  }
}
