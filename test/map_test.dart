import 'package:solvent/solvent.dart';
import 'package:test/test.dart';

void main() {
  group('MapExtension', () {
    group('getAs', () {
      final map = <String, Object>{'a': 1};

      test('with nullable use site', () {
        void fn(int? value) => expect(value, 1);
        fn(map.getAs('a'));
      });

      test('with non-nullable use site', () {
        void fn(int value) => expect(value, 1);
        fn(map.getAs('a')!);
      });
    });
  });
}
