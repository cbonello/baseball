import 'dart:convert';

import 'package:baseball/src/models/models.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Parses LSEntityPlayerModel', () async {
    const contents = '''
{
  "id": 544369,
  "fullName": "Didi Gregorius",
  "link": "/api/v1/people/544369"
}
''';
    final dynamic json = jsonDecode(contents);
    final player = LSEntityPlayerModel.fromJson(json);

    expect(player.id, 544369);
    expect(player.fullName, 'Didi Gregorius');
    expect(player.link, '/api/v1/people/544369');
  });
}
