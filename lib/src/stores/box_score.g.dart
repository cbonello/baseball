// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'box_score.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BoxScoreStore on _BoxScoreStore, Store {
  Computed<BoxScoreStoreState> _$stateComputed;

  @override
  BoxScoreStoreState get state =>
      (_$stateComputed ??= Computed<BoxScoreStoreState>(() => super.state))
          .value;

  final _$_lineScoreFutureAtom = Atom(name: '_BoxScoreStore._lineScoreFuture');

  @override
  ObservableFuture<BoxScoreModel> get _lineScoreFuture {
    _$_lineScoreFutureAtom.context.enforceReadPolicy(_$_lineScoreFutureAtom);
    _$_lineScoreFutureAtom.reportObserved();
    return super._lineScoreFuture;
  }

  @override
  set _lineScoreFuture(ObservableFuture<BoxScoreModel> value) {
    _$_lineScoreFutureAtom.context.conditionallyRunInAction(() {
      super._lineScoreFuture = value;
      _$_lineScoreFutureAtom.reportChanged();
    }, _$_lineScoreFutureAtom, name: '${_$_lineScoreFutureAtom.name}_set');
  }

  final _$boxScoreAtom = Atom(name: '_BoxScoreStore.boxScore');

  @override
  BoxScoreModel get boxScore {
    _$boxScoreAtom.context.enforceReadPolicy(_$boxScoreAtom);
    _$boxScoreAtom.reportObserved();
    return super.boxScore;
  }

  @override
  set boxScore(BoxScoreModel value) {
    _$boxScoreAtom.context.conditionallyRunInAction(() {
      super.boxScore = value;
      _$boxScoreAtom.reportChanged();
    }, _$boxScoreAtom, name: '${_$boxScoreAtom.name}_set');
  }

  final _$errorMessageAtom = Atom(name: '_BoxScoreStore.errorMessage');

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
        'boxScore: ${boxScore.toString()},errorMessage: ${errorMessage.toString()},state: ${state.toString()}';
    return '{$string}';
  }
}
