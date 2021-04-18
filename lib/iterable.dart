/// An element of an ordered collection with it's corresponding index.
class IndexedElement<T> {
  /// Creates an element of an ordered collection with it's corresponding index.
  const IndexedElement(this.index, this.element);

  /// Creates an element of an ordered collection with it's corresponding index
  /// from a [MapEntry].
  static IndexedElement fromMapEntry<T>(MapEntry<int, T> entry) =>
      IndexedElement<T>(entry.key, entry.value);

  /// The index of [element] in the collection.
  final int index;

  /// The element at [index] in the collection.
  final T element;

  /// Returns this `IndexedElement` as a `MapEntry`.
  MapEntry<int, T> toMapEntry() => MapEntry(index, element);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IndexedElement &&
          runtimeType == other.runtimeType &&
          index == other.index &&
          element == other.element;

  @override
  int get hashCode => index.hashCode ^ element.hashCode;

  @override
  String toString() => 'IndexedElement($index: $element)';
}

/// An extension which adds utilities to [Iterable]s.
extension IterableExtension<T> on Iterable<T> {
  /// Returns a new [Iterable] whose elements are the corresponding
  /// [IndexedElement]s of this [Iterable]'s elements.
  Iterable<IndexedElement<T>> indexed() sync* {
    var index = 0;
    for (final value in this) {
      yield IndexedElement(index++, value);
    }
  }

  /// Returns a new [Iterable] whose elements are the result of giving each
  /// element of this [Iterable] and it's index to [f] and replacing it with
  /// the returned value.
  Iterable<R> mapIndexed<R>(R Function(int index, T element) f) sync* {
    for (final element in indexed()) {
      yield f(element.index, element.element);
    }
  }

  /// Returns a new [Iterable] which only contains the elements for which [f]
  /// returns `true` when given the element and it's index.
  Iterable<T> whereIndexed(bool Function(int index, T element) f) sync* {
    for (final element in indexed()) {
      if (f(element.index, element.element)) {
        yield element.element;
      }
    }
  }
}
