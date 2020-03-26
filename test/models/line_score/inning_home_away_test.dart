import 'dart:convert';

import 'package:baseball/src/models/models.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Parses LSInningHomeAwayModel', () async {
    const contents = '''
{
  "runs": 10,
  "hits": 8,
  "errors": 1,
  "leftOnBase": 7
}
''';
    final dynamic json = jsonDecode(contents);
    final ha = LSInningHomeAwayModel.fromJson(json);

    expect(ha.runs, 10);
    expect(ha.hits, 8);
    expect(ha.errors, 1);
    expect(ha.leftOnBase, 7);
  });
}
