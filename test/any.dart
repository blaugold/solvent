import 'package:solvent/solvent.dart';
import 'package:test/test.dart';

void main() {
  group('AnyExtension', () {
    group('let()', () {
      test('should return the result of giving the target to f', () {
        expect('A'.let((it) => it + 'B'), 'AB');
      });

      test('should be callable on a nullable value', () {
        String? target;
        expect(target?.let((it) => it), isNull);
      });
    });

    group('filter', () {
      test('returns value if predicate returns true', () {
        expect('a'.filter((it) => true), 'a');
      });

      test('returns null if predicate returns false', () {
        expect('a'.filter((it) => false), isNull);
      });
    });

    group('also()', () {
      test('should call f with the target before returning it', () {
        expect('A'.also(expectAsync1((it) => expect(it, 'A'))), 'A');
      });

      test('should be callable on a nullable value', () {
        String? target;
        expect(target?.also((it) => it), isNull);
      });
    });
  });
}
