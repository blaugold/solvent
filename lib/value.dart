/// A function which simply returns the [value] it is given.
T identity<T>(T value) => value;

/// An extension which adds utilities for values of all types.
extension ValueExtension<T> on T {
  /// Returns the result of giving this value to [f].
  ///
  /// This method is for single values what the `map` method is for collections.
  ///
  /// ## Example
  ///
  /// With this method, this snippet:
  /// ```dart
  /// String? urlString = Platform.environment['url'];
  /// Uri? url = urlString == null ? null : Uri.parse(urlString)
  /// ```
  /// can be rewritten like this:
  /// ```dart
  /// Uri? url = Platform.environment['url']?.let(Uri.parse)
  /// ```
  R let<R>(R Function(T it) f) => f(this);

  /// Returns this value after calling [f] with it.
  ///
  /// ## Example
  ///
  /// With this method, this snippet:
  /// ```dart
  /// final message = 'Hello World';
  /// print(message);
  /// return message;
  /// ```
  /// can be rewritten like this:
  /// ```dart
  /// return 'Hello World'.also(print);
  /// ```
  T also(void Function(T it) f) {
    f(this);
    return this;
  }
}
