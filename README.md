# digits_to_words_russian

A Flutter/Dart package that converts numbers to their textual representation in Russian. This package handles the complexities of Russian grammar for different number forms and cases.

## Features

- Convert integers to their Russian textual representation
- Support for numbers up to 999,999,999,999 (999 billions maximum)
- Proper handling of Russian grammatical cases for units (один/одна, два/две)
- Correct declension for thousands (тысяча, тысячи, тысяч), millions (миллион, миллиона, миллионов), and billions (миллиард, миллиарда, миллиардов)
- Handles special cases for numbers ending in 11-19 (одиннадцать, двенадцать и т.д.)
- Proper formatting for hundreds, tens, and units
- **NEW:** Ordinal numerals support (первый, второй, третий...) with gender options (masculine, feminine, neuter)
- Perfect for dates, rankings, and positions (1 марта, 21 место и т.д.)
- **NEW:** Date formatting with `dateToWords` method (day case and month format options)

## Getting started

Add the package to your `pubspec.yaml`:

```yaml
dependencies:
  digits_to_words_russian: ^1.1.2
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
  
  // Quantitative numerals (количественные числительные)
  print(parser.toWords(number: 42));        // Output: "сорок два"
  print(parser.toWords(number: 1001));      // Output: "одна тысяча один"
  print(parser.toWords(number: 2021));      // Output: "две тысячи двадцать один"
  print(parser.toWords(number: 1234567));   // Output: "один миллион двести тридцать четыре тысячи пятьсот шестьдесят семь"
  
  // Ordinal numerals (порядковые числительные) - masculine by default
  print(parser.ordinalToWords(number: 1));        // Output: "первый"
  print(parser.ordinalToWords(number: 2));        // Output: "второй"
  print(parser.ordinalToWords(number: 21));       // Output: "двадцать первый"
  print(parser.ordinalToWords(number: 1001));     // Output: "тысяча первый"
  print(parser.ordinalToWords(number: 32));       // Output: "тридцать второй"
  
  // Ordinal numerals with gender (женский и средний род)
  print(parser.ordinalToWords(number: 1, gender: 'f'));  // Output: "первая"
  print(parser.ordinalToWords(number: 1, gender: 'n'));  // Output: "первое"
  print(parser.ordinalToWords(number: 21, gender: 'f')); // Output: "двадцать первая"
  
  // Date formatting with dateToWords method
  print(parser.dateToWords(day: 1, month: 3, year: 2024));  // "первого марта две тысячи двадцать четвёртого"
  print(parser.dateToWords(day: 15, month: 5));  // "пятнадцатого мая"
  print(parser.dateToWords(day: 9, month: 5, year: 1945));  // "девятого мая тысяча девятьсот сорок пятого"
  print(parser.dateToWords(day: 14, month: 7, year: 1789, dayCase: 'nominative'));  // "четырнадцатое июля одна тысяча семьсот восемьдесят девятого"
  
  // Date examples
  print('21 марта: ${parser.ordinalToWords(number: 21)} марта');
  print('1 января: ${parser.ordinalToWords(number: 1)} января');
  print('32-е место: ${parser.ordinalToWords(number: 32, gender: 'n')}-е место');
}
```

## Additional information

This package is for applications that need to display numbers in their full textual form, such as financial applications, legal documents, or educational tools. 

🔗 **GitHub:** https://github.com/zigbug/digits_to_words_russian_public

---

# digits_to_words_russian

Flutter/Dart пакет, который преобразует числа в их текстовое представление на русском языке. Этот пакет учитывает сложности русской грамматики для различных форм чисел и падежей.

## Возможности

- Преобразование целых чисел в их текстовое представление на русском языке
- Поддержка чисел до 999 999 999 999 (до 999 миллиардов включительно)
- Правильная обработка русских грамматических падежей для единиц (один/одна, два/две)
- Корректное склонение для тысяч (тысяча, тысячи, тысяч), миллионов (миллион, миллиона, миллионов) и миллиардов (миллиард, миллиарда, миллиардов)
- Обработка особых случаев для чисел, оканчивающихся на 11-19 (одиннадцать, двенадцать и т.д.)
- Правильное форматирование сотен, десятков и единиц
- **НОВОЕ:** Поддержка порядковых числительных (первый, второй, третий...) с опциями рода (мужской, женский, средний)
- Идеально для дат, мест и позиций (1 марта, 21 место и т.д.)
- **НОВОЕ:** Форматирование дат с методом `dateToWords` (c выбором падежа дня)

## Начало работы

Добавьте пакет в ваш `pubspec.yaml`:

```yaml
dependencies:
  digits_to_words_russian: ^1.1.2
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
  
  // Количественные числительные
  print(parser.toWords(number: 42));        // Вывод: "сорок два"
  print(parser.toWords(number: 1001));      // Вывод: "одна тысяча один"
  print(parser.toWords(number: 2021));      // Вывод: "две тысячи двадцать один"
  print(parser.toWords(number: 1234567));   // Вывод: "один миллион двести тридцать четыре тысячи пятьсот шестьдесят семь"
  
  // Порядковые числительные — мужской род по умолчанию
  print(parser.ordinalToWords(number: 1));        // Вывод: "первый"
  print(parser.ordinalToWords(number: 2));        // Вывод: "второй"
  print(parser.ordinalToWords(number: 21));       // Вывод: "двадцать первый"
  print(parser.ordinalToWords(number: 1001));     // Вывод: "тысяча первый"
  print(parser.ordinalToWords(number: 32));       // Вывод: "тридцать второй"
  
  // Порядковые числительные с указанием рода
  print(parser.ordinalToWords(number: 1, gender: 'f'));  // Вывод: "первая"
  print(parser.ordinalToWords(number: 1, gender: 'n'));  // Вывод: "первое"
  print(parser.ordinalToWords(number: 21, gender: 'f')); // Вывод: "двадцать первая"
  
  // Форматирование дат с методом dateToWords
  print(parser.dateToWords(day: 1, month: 3, year: 2024));  // "первого марта две тысячи двадцать четвёртого"
  print(parser.dateToWords(day: 15, month: 5));  // "пятнадцатого мая"
  print(parser.dateToWords(day: 9, month: 5, year: 1945));  // "девятого мая тысяча девятьсот сорок пятого"
  print(parser.dateToWords(day: 14, month: 7, year: 1789, dayCase: 'nominative'));  // "четырнадцатое июля одна тысяча семьсот восемьдесят девятого"
  
  // Примеры для дат
  print('21 марта: ${parser.ordinalToWords(number: 21)} марта');
  print('1 января: ${parser.ordinalToWords(number: 1)} января');
  print('32-е место: ${parser.ordinalToWords(number: 32, gender: 'n')}-е место');
}
```

## Дополнительная информация

Этот пакет для приложений, которым необходимо отображать числа в полной текстовой форме, таких как финансовые приложения, юридические документы или образовательные инструменты.

🔗 **GitHub:** https://github.com/zigbug/digits_to_words_russian_public

Для вклада или сообщений о проблемах посетите наш репозиторий на GitHub.
