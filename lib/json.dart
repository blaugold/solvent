/// An extension which adds utilities to [Map]s which are typically used to
/// represent JSON objects in Dart.
extension JSONMapExtension on Map<String, dynamic> {
  /// Returns the value for the given [key], cast to [T].
  ///
  /// ## Example
  ///
  /// Given a `Person` class:
  ///
  /// ```dart
  /// class Person {
  ///   Person({
  ///     required this.name,
  ///     this.website,
  ///   });
  ///   final String name;
  ///   final Uri? website;
  /// }
  /// ```
  ///
  /// With this method, the `fromJson` function for `Person`:
  /// ```dart
  /// Person fromJson(Map<String, dynamic> json) => Person(
  ///   name: json['name'] as String,
  ///   email: json['website'] == null ? null : Uri.parse(json['website'] as String),
  /// );
  /// ```
  /// can be rewritten like this:
  /// ```dart
  /// Person fromJson(Map<String, dynamic> json) => Person(
  ///   name: json.get('name'),
  ///   email: json.get<String?>('website')?.let(Uri.parse),
  /// );
  /// ```
  T get<T>(String key) => this[key] as T;
}
