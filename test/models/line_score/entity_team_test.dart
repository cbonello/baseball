import 'dart:convert';

import 'package:baseball/src/models/models.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Parses LSEntityTeamModel', () async {
    const String contents = '''
{
  "id": 147,
  "name": "New York Yankees",
  "link": "/api/v1/teams/147"
}
''';
    final dynamic json = jsonDecode(contents);
    final LSEntityTeamModel team = LSEntityTeamModel.fromJson(json);

    expect(team.id, 147);
    expect(team.name, 'New York Yankees');
    expect(team.link, '/api/v1/teams/147');
  });
}
