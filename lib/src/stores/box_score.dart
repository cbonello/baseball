import 'package:baseball/src/models/models.dart';
import 'package:baseball/src/services/mlb_api_client.dart';
import 'package:flutter/foundation.dart';
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
  ObservableFuture<BoxScoreModel> boxScoreFuture;
  @observable
  BoxScoreModel boxScore;

  @observable
  String errorMessage;

  @computed
  BoxScoreStoreState get state {
    if (boxScoreFuture == null || boxScoreFuture.status == FutureStatus.rejected) {
      return BoxScoreStoreState.initial;
    }
    return boxScoreFuture.status == FutureStatus.pending
        ? BoxScoreStoreState.loading
        : BoxScoreStoreState.loaded;
  }

  @action
  Future<void> geSchedule(String gameId) async {
    try {
      errorMessage = null;
      boxScoreFuture = ObservableFuture<BoxScoreModel>(
        _mlbApiClient.getGameBoxscoreSchedule(gameId),
      );
      boxScore = await boxScoreFuture;
    } catch (exception) {
      errorMessage = exception.message;
    }
  }
}
