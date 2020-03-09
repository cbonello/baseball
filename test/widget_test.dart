import 'dart:convert';

import 'package:baseball/src/screens/home.dart';
import 'package:baseball/src/services/mlb_api_client.dart';
import 'package:baseball/src/services/web_client.dart';
import 'package:baseball/src/stores/stores.dart';
import 'package:baseball/src/utils/keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:mockito/mockito.dart';

class MockWebClient extends Mock implements WebClient {}

void main() {
  group('Display home screen', () {
    testWidgets('Display calendar dialog', (WidgetTester tester) async {
      TestWidgetsFlutterBinding.ensureInitialized();

      // Copy of 'test/support/schedule.json'.
      const String content = '''
{
  "dates": [{
    "games": [{
      "gamePk": 599337,
      "gameDate": "2019-10-04T18:05:00Z",
      "status": {
        "detailedState": "Final"
      },
      "teams": {
        "away": {
          "leagueRecord": {
            "wins": 0,
            "losses": 1
          },
          "score": 2,
          "team": {
            "name": "Tampa Bay Rays"
          },
          "isWinner": false
        },
        "home": {
          "leagueRecord": {
            "wins": 1,
            "losses": 0
          },
          "score": 6,
          "team": {
            "name": "Houston Astros"
          },
          "isWinner": true
        }
      },
      "venue": {
        "name": "Minute Maid Park"
      }
    }, {
      "gamePk": 599353,
      "gameDate": "2019-10-04T20:37:00Z",
      "status": {
        "detailedState": "Final"
      },
      "teams": {
        "away": {
          "leagueRecord": {
            "wins": 1,
            "losses": 1
          },
          "score": 0,
          "team": {
            "name": "St. Louis Cardinals"
          },
          "isWinner": false
        },
        "home": {
          "leagueRecord": {
            "wins": 1,
            "losses": 1
          },
          "score": 3,
          "team": {
            "name": "Atlanta Braves"
          },
          "isWinner": true
        }
      },
      "venue": {
        "name": "SunTrust Park"
      }
    }, {
      "gamePk": 599342,
      "gameDate": "2019-10-04T23:07:00Z",
      "status": {
        "detailedState": "Final"
      },
      "teams": {
        "away": {
          "leagueRecord": {
            "wins": 0,
            "losses": 1
          },
          "score": 4,
          "team": {
            "name": "Minnesota Twins"
          },
          "isWinner": false
        },
        "home": {
          "leagueRecord": {
            "wins": 1,
            "losses": 0
          },
          "score": 10,
          "team": {
            "name": "New York Yankees"
          },
          "isWinner": true
        }
      },
      "venue": {
        "name": "Yankee Stadium"
      }
    }, {
      "gamePk": 599348,
      "gameDate": "2019-10-05T01:37:00Z",
      "status": {
        "detailedState": "Final"
      },
      "teams": {
        "away": {
          "leagueRecord": {
            "wins": 1,
            "losses": 1
          },
          "score": 4,
          "team": {
            "name": "Washington Nationals"
          },
          "isWinner": true
        },
        "home": {
          "leagueRecord": {
            "wins": 1,
            "losses": 1
          },
          "score": 2,
          "team": {
            "name": "Los Angeles Dodgers"
          },
          "isWinner": false
        }
      },
      "venue": {
        "name": "Dodger Stadium"
      }
    }]
  }, {
    "games": [{
      "gamePk": 599343,
      "gameDate": "2019-10-05T21:07:00Z",
      "status": {
        "detailedState": "Final"
      },
      "teams": {
        "away": {
          "leagueRecord": {
            "wins": 0,
            "losses": 2
          },
          "score": 2,
          "team": {
            "name": "Minnesota Twins"
          },
          "isWinner": false
        },
        "home": {
          "leagueRecord": {
            "wins": 2,
            "losses": 0
          },
          "score": 8,
          "team": {
            "name": "New York Yankees"
          },
          "isWinner": true
        }
      },
      "venue": {
        "name": "Yankee Stadium"
      }
    }, {
      "gamePk": 599338,
      "gameDate": "2019-10-06T01:07:00Z",
      "status": {
        "detailedState": "Final"
      },
      "teams": {
        "away": {
          "leagueRecord": {
            "wins": 0,
            "losses": 2
          },
          "score": 1,
          "team": {
            "name": "Tampa Bay Rays"
          },
          "isWinner": false
        },
        "home": {
          "leagueRecord": {
            "wins": 2,
            "losses": 0
          },
          "score": 3,
          "team": {
            "name": "Houston Astros"
          },
          "isWinner": true
        }
      },
      "venue": {
        "name": "Minute Maid Park"
      }
    }]
  }, {
    "games": [{
      "gamePk": 599354,
      "gameDate": "2019-10-06T20:10:00Z",
      "status": {
        "detailedState": "Final"
      },
      "teams": {
        "away": {
          "leagueRecord": {
            "wins": 2,
            "losses": 1
          },
          "score": 3,
          "team": {
            "name": "Atlanta Braves"
          },
          "isWinner": true
        },
        "home": {
          "leagueRecord": {
            "wins": 1,
            "losses": 2
          },
          "score": 1,
          "team": {
            "name": "St. Louis Cardinals"
          },
          "isWinner": false
        }
      },
      "venue": {
        "name": "Busch Stadium"
      }
    }, {
      "gamePk": 599349,
      "gameDate": "2019-10-06T23:45:00Z",
      "status": {
        "detailedState": "Final"
      },
      "teams": {
        "away": {
          "leagueRecord": {
            "wins": 2,
            "losses": 1
          },
          "score": 10,
          "team": {
            "name": "Los Angeles Dodgers"
          },
          "isWinner": true
        },
        "home": {
          "leagueRecord": {
            "wins": 1,
            "losses": 2
          },
          "score": 4,
          "team": {
            "name": "Washington Nationals"
          },
          "isWinner": false
        }
      },
      "venue": {
        "name": "Nationals Park"
      }
    }]
  }]
}
''';
      final Map<String, dynamic> json = jsonDecode(content);

      final WebClient webClient = MockWebClient();
      when(webClient.get(any)).thenAnswer((_) {
        return Future<dynamic>.value(json);
      });
      final MLBApiClient mlbApi = MLBApiClient(webClient);

      await tester.pumpWidget(Provider<ScheduleStore>(
        create: (BuildContext _) => ScheduleStore(mlbApiClient: mlbApi),
        child: MaterialApp(home: HomeScreen()),
      ));

      final Finder calendar = find.byKey(AppWidgetKeys.keys['calendar']);
      await tester.tap(calendar);
      await tester.pumpAndSettle();
    });
  });
}
