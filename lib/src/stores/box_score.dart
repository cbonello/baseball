import 'package:baseball/src/models/models.dart';
import 'package:baseball/src/services/mlb_api_client.dart';
import 'package:meta/meta.dart';
import 'package:mobx/mobx.dart';

part 'box_score.g.dart';

enum BoxScoreStoreState { initial, loading, loaded }

class BoxScoreStore extends _BoxScoreStore with _$BoxScoreStore {
  BoxScoreStore({@required MLBApiClient mlbApiClient}) : super(mlbApiClient);
}

abstract class _BoxScoreStore with Store {
  _BoxScoreStore(this._mlbApiClient);

  final MLBApiClient _mlbApiClient;

  @observable
  ObservableFuture<BoxScoreModel> _lineScoreFuture;
  @observable
  BoxScoreModel boxScore;

  @observable
  String errorMessage;

  @computed
  BoxScoreStoreState get state {
    if (_lineScoreFuture == null || _lineScoreFuture.status == FutureStatus.rejected) {
      return BoxScoreStoreState.initial;
    }
    return _lineScoreFuture.status == FutureStatus.pending
        ? BoxScoreStoreState.loading
        : BoxScoreStoreState.loaded;
  }

  @action
  Future<void> geSchedule(String gameId) async {
    try {
      errorMessage = null;
      _lineScoreFuture = ObservableFuture<BoxScoreModel>(
        _mlbApiClient.getGameBoxscoreSchedule(gameId),
      );
      boxScore = await _lineScoreFuture;
    } catch (exception) {
      errorMessage = exception.message;
    }
  }
}
