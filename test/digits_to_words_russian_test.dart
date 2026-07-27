import 'package:digits_to_words_russian/exception.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:digits_to_words_russian/digits_to_words_russian.dart';

void main() {
  final parser = DigitsToWordsParser();

  group('timeToWord', () {
    // --- Time string format parsing ---

    test('full time string HH:MM:SS', () {
      expect(
        parser.timeToWord(time: '23:56:17'),
        'двадцать три часа пятьдесят шесть минут семнадцать секунд',
      );
    });

    test('time string HH:MM (no seconds)', () {
      expect(
        parser.timeToWord(time: '12:30'),
        'двенадцать часов тридцать минут',
      );
    });

    test('midnight HH:MM:SS', () {
      expect(
        parser.timeToWord(time: '00:00:00'),
        'ноль часов ноль минут ноль секунд',
      );
    });

    test('noon HH:MM:SS', () {
      expect(
        parser.timeToWord(time: '12:00:00'),
        'двенадцать часов ноль минут ноль секунд',
      );
    });

    // --- Individual parameters ---

    test('only hours', () {
      expect(parser.timeToWord(hours: 4), 'четыре часа');
    });

    test('only hours — 1 час', () {
      expect(parser.timeToWord(hours: 1), 'один час');
    });

    test('only hours — 2 часа', () {
      expect(parser.timeToWord(hours: 2), 'два часа');
    });

    test('only hours — 21 час', () {
      expect(parser.timeToWord(hours: 21), 'двадцать один час');
    });

    test('only hours — 22 часа', () {
      expect(parser.timeToWord(hours: 22), 'двадцать два часа');
    });

    test('only minutes — feminine forms', () {
      expect(parser.timeToWord(minutes: 1), 'одна минута');
    });

    test('only minutes — 2 две минуты', () {
      expect(parser.timeToWord(minutes: 2), 'две минуты');
    });

    test('only minutes — 3 минуты', () {
      expect(parser.timeToWord(minutes: 3), 'три минуты');
    });

    test('only minutes — 11 минут (teens)', () {
      expect(parser.timeToWord(minutes: 11), 'одиннадцать минут');
    });

    test('only minutes — 12 минут (teens)', () {
      expect(parser.timeToWord(minutes: 12), 'двенадцать минут');
    });

    test('only minutes — 20 минут', () {
      expect(parser.timeToWord(minutes: 20), 'двадцать минут');
    });

    test('only minutes — 21 минута', () {
      expect(parser.timeToWord(minutes: 21), 'двадцать одна минута');
    });

    test('only minutes — 22 минуты', () {
      expect(parser.timeToWord(minutes: 22), 'двадцать две минуты');
    });

    test('only minutes — 23 минуты', () {
      expect(parser.timeToWord(minutes: 23), 'двадцать три минуты');
    });

    test('only seconds — feminine forms', () {
      expect(parser.timeToWord(seconds: 1), 'одна секунда');
    });

    test('only seconds — 2 секунды', () {
      expect(parser.timeToWord(seconds: 2), 'две секунды');
    });

    test('only seconds — 11 секунд', () {
      expect(parser.timeToWord(seconds: 11), 'одиннадцать секунд');
    });

    // --- Combined parameters ---

    test('hours + minutes', () {
      expect(
        parser.timeToWord(hours: 1, minutes: 30),
        'один час тридцать минут',
      );
    });

    test('hours + minutes + seconds', () {
      expect(
        parser.timeToWord(hours: 1, minutes: 1, seconds: 1),
        'один час одна минута одна секунда',
      );
    });

    test('hours 2 + minutes 2 + seconds 2', () {
      expect(
        parser.timeToWord(hours: 2, minutes: 2, seconds: 2),
        'два часа две минуты две секунды',
      );
    });

    test('minutes + seconds (no hours)', () {
      expect(
        parser.timeToWord(minutes: 1, seconds: 2),
        'одна минута две секунды',
      );
    });

    test('zero hours with minutes', () {
      expect(
        parser.timeToWord(hours: 0, minutes: 0),
        'ноль часов ноль минут',
      );
    });

    // --- Validation tests ---

    test('throws on invalid time string format', () {
      expect(
        () => parser.timeToWord(time: 'abc'),
        throwsA(isA<DigitsToWordsRussianParserException>()),
      );
    });

    test('throws on no parameters', () {
      expect(
        () => parser.timeToWord(),
        throwsA(isA<DigitsToWordsRussianParserException>()),
      );
    });

    test('throws on hours out of range', () {
      expect(
        () => parser.timeToWord(hours: 24),
        throwsA(isA<DigitsToWordsRussianParserException>()),
      );
    });

    test('throws on minutes out of range', () {
      expect(
        () => parser.timeToWord(minutes: 60),
        throwsA(isA<DigitsToWordsRussianParserException>()),
      );
    });

    test('throws on seconds out of range', () {
      expect(
        () => parser.timeToWord(seconds: 60),
        throwsA(isA<DigitsToWordsRussianParserException>()),
      );
    });
  });
}
