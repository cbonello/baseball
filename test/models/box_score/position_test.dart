import 'dart:convert';

import 'package:baseball/src/models/models.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Parses BSPositionModel', () async {
    const contents = '''
{
  "name": "Shortstop",
  "type": "Infielder",
  "abbreviation": "SS"
}
''';
    final dynamic json = jsonDecode(contents);
    final position = BSPositionModel.fromJson(json);

    expect(position, isNotNull);
    expect(position.name, 'Shortstop');
    expect(position.type, 'Infielder');
    expect(position.abbreviation, 'SS');
  });
}
