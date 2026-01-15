# digits_to_words_russian

A Flutter/Dart package that converts numbers to their textual representation in Russian. This package handles the complexities of Russian grammar for different number forms and cases.

## Features

- Convert integers to their Russian textual representation
- Support for numbers up to 999,999,999,999 (less than one trillion)
- Proper handling of Russian grammatical cases for units (один/одна, два/две)
- Correct declension for thousands (тысяча, тысячи, тысяч), millions (миллион, миллиона, миллионов), and billions (миллиард, миллиарда, миллиардов)
- Handles special cases for numbers ending in 11-19 (одиннадцать, двенадцать, etc.)
- Proper formatting for hundreds, tens, and units

## Getting started

Add the package to your `pubspec.yaml`:

```yaml
dependencies:
  digits_to_words_russian: ^1.1.1
```

Then run `flutter pub get` or `dart pub get`.

Import the package in your Dart code:

```dart
import 'package:digits_to_words_russian/digits_to_words_russian.dart';
```

## Usage

```dart
import 'package:digits_to_words_russian/digits_to_words_russian.dart';

void main() {
  final parser = DigitsToWordsParser();
  
  print(parser.toWords(number: 42));        // Output: "сорок два"
  print(parser.toWords(number: 1001));      // Output: "одна тысяча один"
  print(parser.toWords(number: 2021));      // Output: "две тысячи двадцать один"
  print(parser.toWords(number: 1234567));   // Output: "один миллион двести тридцать четыре тысячи пятьсот шестьдесят семь"
}
```

## Additional information

This package is ideal for applications that need to display numbers in their full textual form, such as financial applications, legal documents, or educational tools. 

For contributions or issues, please visit our GitHub repository.

---

# digits_to_words_russian

Flutter/Dart пакет, который преобразует числа в их текстовое представление на русском языке. Этот пакет учитывает сложности русской грамматики для различных форм чисел и падежей.

## Возможности

- Преобразование целых чисел в их текстовое представление на русском языке
- Поддержка чисел до 999 999 999 999 (менее одного триллиона)
- Правильная обработка русских грамматических падежей для единиц (один/одна, два/две)
- Корректное склонение для тысяч (тысяча, тысячи, тысяч), миллионов (миллион, миллиона, миллионов) и миллиардов (миллиард, миллиарда, миллиардов)
- Обработка особых случаев для чисел, оканчивающихся на 11-19 (одиннадцать, двенадцать и т.д.)
- Правильное форматирование сотен, десятков и единиц

## Начало работы

Добавьте пакет в ваш `pubspec.yaml`:

```yaml
dependencies:
  digits_to_words_russian: ^1.1.1
```

Затем выполните `flutter pub get` или `dart pub get`.

Импортируйте пакет в ваш Dart код:

```dart
import 'package:digits_to_words_russian/digits_to_words_russian.dart';
```

## Использование

```dart
import 'package:digits_to_words_russian/digits_to_words_russian.dart';

void main() {
  final parser = DigitsToWordsParser();
  
  print(parser.toWords(number: 42));        // Вывод: "сорок два"
  print(parser.toWords(number: 1001));      // Вывод: "одна тысяча один"
  print(parser.toWords(number: 2021));      // Вывод: "две тысячи двадцать один"
  print(parser.toWords(number: 1234567));   // Вывод: "один миллион двести тридцать четыре тысячи пятьсот шестьдесят семь"
}
```

## Дополнительная информация

Этот пакет идеально подходит для приложений, которым необходимо отображать числа в полной текстовой форме, таких как финансовые приложения, юридические документы или образовательные инструменты.

Для вклада или сообщений о проблемах посетите наш репозиторий на GitHub.
