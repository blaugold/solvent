import 'package:solvent/solvent.dart';
import 'package:test/test.dart';

void main() {
  group('identity()', () {
    test('returns the value it is given', () {
      expect(identity('A'), 'A');
    });
  });

  group('ValueExtension', () {
    group('let()', () {
      test('should return the result of giving the target to f', () {
        expect('A'.let((it) => it + 'B'), 'AB');
      });

      test('should be callable on a nullable value', () {
        String? target;
        expect(target?.let(identity), isNull);
      });
    });

    group('also()', () {
      test('should call f with the target before returning it', () {
        expect('A'.also(expectAsync1((it) => expect(it, 'A'))), 'A');
      });

      test('should be callable on a nullable value', () {
        String? target;
        expect(target?.also(identity), isNull);
      });
    });
  });
}
