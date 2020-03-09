// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ScheduleStore on _ScheduleStore, Store {
  Computed<ScheduleStoreState> _$stateComputed;

  @override
  ScheduleStoreState get state =>
      (_$stateComputed ??= Computed<ScheduleStoreState>(() => super.state))
          .value;

  final _$_scheduleFutureAtom = Atom(name: '_ScheduleStore._scheduleFuture');

  @override
  ObservableFuture<SCScheduleModel> get _scheduleFuture {
    _$_scheduleFutureAtom.context.enforceReadPolicy(_$_scheduleFutureAtom);
    _$_scheduleFutureAtom.reportObserved();
    return super._scheduleFuture;
  }

  @override
  set _scheduleFuture(ObservableFuture<SCScheduleModel> value) {
    _$_scheduleFutureAtom.context.conditionallyRunInAction(() {
      super._scheduleFuture = value;
      _$_scheduleFutureAtom.reportChanged();
    }, _$_scheduleFutureAtom, name: '${_$_scheduleFutureAtom.name}_set');
  }

  final _$scheduleAtom = Atom(name: '_ScheduleStore.schedule');

  @override
  SCScheduleModel get schedule {
    _$scheduleAtom.context.enforceReadPolicy(_$scheduleAtom);
    _$scheduleAtom.reportObserved();
    return super.schedule;
  }

  @override
  set schedule(SCScheduleModel value) {
    _$scheduleAtom.context.conditionallyRunInAction(() {
      super.schedule = value;
      _$scheduleAtom.reportChanged();
    }, _$scheduleAtom, name: '${_$scheduleAtom.name}_set');
  }

  final _$errorMessageAtom = Atom(name: '_ScheduleStore.errorMessage');

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
  Future<void> geSchedule(String date) {
    return _$geScheduleAsyncAction.run(() => super.geSchedule(date));
  }

  @override
  String toString() {
    final string =
        'schedule: ${schedule.toString()},errorMessage: ${errorMessage.toString()},state: ${state.toString()}';
    return '{$string}';
  }
}
