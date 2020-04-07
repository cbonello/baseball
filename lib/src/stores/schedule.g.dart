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

  final _$scheduleFutureAtom = Atom(name: '_ScheduleStore.scheduleFuture');

  @override
  ObservableFuture<SCScheduleModel> get scheduleFuture {
    _$scheduleFutureAtom.context.enforceReadPolicy(_$scheduleFutureAtom);
    _$scheduleFutureAtom.reportObserved();
    return super.scheduleFuture;
  }

  @override
  set scheduleFuture(ObservableFuture<SCScheduleModel> value) {
    _$scheduleFutureAtom.context.conditionallyRunInAction(() {
      super.scheduleFuture = value;
      _$scheduleFutureAtom.reportChanged();
    }, _$scheduleFutureAtom, name: '${_$scheduleFutureAtom.name}_set');
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
        'scheduleFuture: ${scheduleFuture.toString()},schedule: ${schedule.toString()},errorMessage: ${errorMessage.toString()},state: ${state.toString()}';
    return '{$string}';
  }
}
