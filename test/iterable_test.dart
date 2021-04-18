import 'package:solvent/solvent.dart';
import 'package:test/test.dart';

void main() {
  group('IndexedElement', () {
    test('overrides equals operator', () {
      expect(IndexedElement(0, 'A'), IndexedElement(0, 'A'));
      expect(IndexedElement(1, 'A'), isNot(IndexedElement(0, 'A')));
      expect(IndexedElement(0, 'B'), isNot(IndexedElement(0, 'A')));
    });

    test('overrides hashCode', () {
      expect(IndexedElement(0, 'A').hashCode, IndexedElement(0, 'A').hashCode);
      expect(
        IndexedElement(1, 'A').hashCode,
        isNot(IndexedElement(0, 'A').hashCode),
      );
      expect(
        IndexedElement(0, 'B').hashCode,
        isNot(IndexedElement(0, 'A').hashCode),
      );
    });

    test('overrides toString', () {
      expect(IndexedElement(0, 'A').toString(), 'IndexedElement(0: A)');
    });
  });

  group('IterableExtension', () {
    group('indexed()', () {
      test('maps each element to the corresponding IndexedElement', () {
        expect(
          ['A', 'B', 'C'].indexed(),
          [
            IndexedElement(0, 'A'),
            IndexedElement(1, 'B'),
            IndexedElement(2, 'C'),
          ],
        );
      });
    });

    group('mapIndexed()', () {
      test("maps each element by giving it and it's element to f", () {
        expect(
          ['A', 'B', 'C'].mapIndexed((index, element) => '$index:$element'),
          ['0:A', '1:B', '2:C'],
        );
      });
    });

    group('whereIndexed()', () {
      test("filters elements by giving it and it's element to f", () {
        expect(
          ['A', 'B', 'C']
              .whereIndexed((index, element) => element == 'A' || index == 1),
          ['A', 'B'],
        );
      });
    });
  });
}
