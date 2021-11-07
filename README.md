[![pub.dev](https://badgen.net/pub/v/solvent)](https://pub.dev/packages/solvent)
[![CI](https://github.com/blaugold/solvent/actions/workflows/ci.yaml/badge.svg)](https://github.com/blaugold/solvent/actions/workflows/ci.yaml)

A package which enables you to write more readable, succinct Dart code by
building on existing language features.

For an example of what's in this package, take this fictional example of a
function that takes an URL as a string and returns its canonicalized host:

```dart
String? canonicalHost(String url) {
    final uri = Uri.parse(url);
    final host = uri.host;
    return isValidHost(host) ? canonicalizeHost(host) : null;
}
```

With the `let` and `filter` extension methods you can write the same function in a
single line:

```dart
String? canonicalHost(String url) =>
    Uri.parse(url).host.filter(isValidHost)?.let(canonicalizeHost);
```

# Universal extension methods

The extension methods from the `AnyExtension` are available on all values.

## `let`

It's like a `map` method for singulare values.

It's most useful when you want to transform a value multiple times, especially
if any of the steps can return null.

## `filter`

It's like a `where` method for singulare values.

This method takes a predicate function and returns the value if the predicate
returns `true` and `null` if the predicate returns `false`.

## `also`

It takes a function and immediately calls it with the value it was called on.

A common use for this method is to log a value to the console without having to
rearrange the code:

```dart
String doSomethingTo(String value) => value
    .substring(0, value.length / 2)
    .also(print)
    .toUpperCase();
```
