/// An extension which adds utilities for [Map]s of all types.
extension MapExtension<K, V> on Map<K, V> {
  /// Returns the value for the given [key] after casting it to `T?`.
  ///
  /// This is useful if you need to read a value from a map, whose value type
  /// is less specific than the type you want to read. If you don't provide
  /// a type for the type parameter [T], the compiler will infer it from the use
  /// site. Often that is the type you want. With this method, you don't have
  /// cast the value to `T` in your code.
  ///
  /// ## Example
  ///
  /// ```dart
  /// void bark(Dog dog) { ... }
  ///
  /// late final Map<String, Animal> map;
  ///
  /// // Get the value with the subscript operator.
  /// bark((map['bo'] as Dog?)!);
  ///
  /// // Get the value with `getAs`.
  /// bark(map.getAs('bo')!);
  /// ```
  ///
  /// Note from the example that you may still need to add a null check
  /// operator if the expected type is non-nullable.
  T? getAs<T>(K key) => this[key] as T?;
}
