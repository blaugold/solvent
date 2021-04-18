import 'package:test/test.dart';
import 'package:solvent/solvent.dart';

void main() {
  group('JSONMapExtension', () {
    group('get()', () {
      test('returns the value of the given key cast to T', () {
        final json = <String, dynamic>{'A': 'B'};
        expect(json.get<String>('A'), 'B');
      });
    });
  });
}
