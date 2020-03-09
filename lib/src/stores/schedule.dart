import 'package:baseball/src/models/models.dart';
import 'package:baseball/src/services/mlb_api_client.dart';
import 'package:meta/meta.dart';
import 'package:mobx/mobx.dart';

part 'schedule.g.dart';

enum ScheduleStoreState { initial, loading, loaded }

class ScheduleStore extends _ScheduleStore with _$ScheduleStore {
  ScheduleStore({@required MLBApiClient mlbApiClient}) : super(mlbApiClient);
}

abstract class _ScheduleStore with Store {
  _ScheduleStore(this._mlbApiClient);

  final MLBApiClient _mlbApiClient;

  @observable
  ObservableFuture<SCScheduleModel> _scheduleFuture;
  @observable
  SCScheduleModel schedule;

  @observable
  String errorMessage;

  @computed
  ScheduleStoreState get state {
    if (_scheduleFuture == null || _scheduleFuture.status == FutureStatus.rejected) {
      return ScheduleStoreState.initial;
    }
    return _scheduleFuture.status == FutureStatus.pending
        ? ScheduleStoreState.loading
        : ScheduleStoreState.loaded;
  }

  @action
  Future<void> geSchedule(String date) async {
    try {
      errorMessage = null;
      _scheduleFuture = ObservableFuture<SCScheduleModel>(
        _mlbApiClient.getGameSchedule(date),
      );
      schedule = await _scheduleFuture;
    } catch (exception) {
      errorMessage = exception.message;
    }
  }
}
