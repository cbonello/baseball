import 'package:baseball/src/models/models.dart';
import 'package:baseball/src/services/mlb_api_client.dart';
import 'package:meta/meta.dart';
import 'package:mobx/mobx.dart';

part 'line_score.g.dart';

enum LineScoreStoreState { initial, loading, loaded }

class LineScoreStore extends _LineScoreStore with _$LineScoreStore {
  LineScoreStore({@required MLBApiClient mlbApiClient}) : super(mlbApiClient);
}

abstract class _LineScoreStore with Store {
  _LineScoreStore(this._mlbApiClient);

  final MLBApiClient _mlbApiClient;

  @observable
  ObservableFuture<LineScoreModel> lineScoreFuture;
  @observable
  LineScoreModel lineScore;

  @observable
  String errorMessage;

  @computed
  LineScoreStoreState get state {
    if (lineScoreFuture == null || lineScoreFuture.status == FutureStatus.rejected) {
      return LineScoreStoreState.initial;
    }
    return lineScoreFuture.status == FutureStatus.pending
        ? LineScoreStoreState.loading
        : LineScoreStoreState.loaded;
  }

  @action
  Future<void> geSchedule(String gameId) async {
    try {
      errorMessage = null;
      lineScoreFuture = ObservableFuture<LineScoreModel>(
        _mlbApiClient.getGameLinescoreSchedule(gameId),
      );
      lineScore = await lineScoreFuture;
    } catch (exception) {
      errorMessage = exception.message;
    }
  }
}
