import 'package:digits_to_words_russian/digits_to_words_russian.dart';

void main() {
  final parser = DigitsToWordsParser();

  print('=== Количественные числительные ===');
  print('42: ${parser.toWords(number: 42)}');
  print('1001: ${parser.toWords(number: 1001)}');
  print('2021: ${parser.toWords(number: 2021)}');
  print('1234567: ${parser.toWords(number: 1234567)}');

  print('\n=== Порядковые числительные (мужской род) ===');
  print('1: ${parser.ordinalToWords(number: 1)}');
  print('2: ${parser.ordinalToWords(number: 2)}');
  print('21: ${parser.ordinalToWords(number: 21)}');
  print('32: ${parser.ordinalToWords(number: 32)}');
  print('100: ${parser.ordinalToWords(number: 100)}');
  print('1001: ${parser.ordinalToWords(number: 1001)}');

  print('\n=== Порядковые числительные (женский род) ===');
  print('1: ${parser.ordinalToWords(number: 1, gender: 'f')}');
  print('2: ${parser.ordinalToWords(number: 2, gender: 'f')}');
  print('21: ${parser.ordinalToWords(number: 21, gender: 'f')}');
  print('32: ${parser.ordinalToWords(number: 32, gender: 'f')}');

  print('\n=== Порядковые числительные (средний род) ===');
  print('1: ${parser.ordinalToWords(number: 1, gender: 'n')}');
  print('2: ${parser.ordinalToWords(number: 2, gender: 'n')}');
  print('21: ${parser.ordinalToWords(number: 21, gender: 'n')}');
  print('32: ${parser.ordinalToWords(number: 32, gender: 'n')}');

  print('\n=== Примеры с местами ===');
  print('1 место: ${parser.ordinalToWords(number: 1, gender: 'n')} место');
  print('2 место: ${parser.ordinalToWords(number: 2, gender: 'n')} место');
  print('3 место: ${parser.ordinalToWords(number: 3, gender: 'n')} место');
  print('21 место: ${parser.ordinalToWords(number: 21, gender: 'n')} место');

  print('\n=== Примеры дат ===');
  print('1 марта 2024: ${parser.dateToWords(day: 1, month: 3, year: 2024)}');
  print(
      '21 декабря 2023: ${parser.dateToWords(day: 21, month: 12, year: 2023)}');
  print('15 мая: ${parser.dateToWords(day: 15, month: 5)}');
  print('9 мая 1945: ${parser.dateToWords(day: 9, month: 5, year: 1945)}');
  print('4 октября 1957: ${parser.dateToWords(day: 4, month: 10, year: 1957)}');
  print('12 апреля 1961: ${parser.dateToWords(day: 12, month: 4, year: 1961)}');
  print('1 января 2000: ${parser.dateToWords(day: 1, month: 1, year: 2000)}');
  print(
      '28 февраля 1800: ${parser.dateToWords(day: 28, month: 2, year: 1800)}');
  print('15 июля 1969: ${parser.dateToWords(day: 15, month: 7, year: 1969)}');
  print(
      '25 декабря 1799: ${parser.dateToWords(day: 25, month: 12, year: 1799)}');
  print(
      '14 ноября 1492: ${parser.dateToWords(day: 14, month: 11, year: 1492)}');
  print('5 июня 1200: ${parser.dateToWords(day: 5, month: 6, year: 1200)}');
  print('10 марта 1300: ${parser.dateToWords(day: 10, month: 3, year: 1300)}');
  print(
      '20 января 25000: ${parser.dateToWords(day: 20, month: 1, year: 25000)}');
  print(
      '7 августа 40000: ${parser.dateToWords(day: 7, month: 8, year: 40000)}');

  print('\n=== Даты с разным форматом ===');
  print(
      '14 июля 1789 (именительный): ${parser.dateToWords(day: 14, month: 7, year: 1789, dayCase: 'nominative')}');
  print(
      '28 марта 1985 (именительный): ${parser.dateToWords(day: 28, month: 3, year: 1985, dayCase: 'nominative')}');
  print(
      '8 марта 1917 (родительный): ${parser.dateToWords(day: 8, month: 3, year: 1917)}');

  print('\n=== Время (timeToWord) ===');
  print('23:56:17: ${parser.timeToWord(time: "23:56:17")}');
  print('4:00: ${parser.timeToWord(hours: 4)}');
  print('1:30: ${parser.timeToWord(hours: 1, minutes: 30)}');
  print('1:02: ${parser.timeToWord(minutes: 1, seconds: 2)}');
  print('0:00: ${parser.timeToWord(hours: 0, minutes: 0)}');
  print('21:05: ${parser.timeToWord(hours: 21, minutes: 5)}');
  print('2:21: ${parser.timeToWord(hours: 2, minutes: 21)}');
  print('3:45: ${parser.timeToWord(hours: 3, minutes: 45)}');
  print('0:01: ${parser.timeToWord(minutes: 1)}');
  print('0:02: ${parser.timeToWord(minutes: 2)}');
  print('0:03: ${parser.timeToWord(minutes: 3)}');
  print('0:11: ${parser.timeToWord(minutes: 11)}');
  print('0:12: ${parser.timeToWord(minutes: 12)}');
  print('0:20: ${parser.timeToWord(minutes: 20)}');
  print('0:21: ${parser.timeToWord(minutes: 21)}');
  print('0:22: ${parser.timeToWord(minutes: 22)}');
  print('0:23: ${parser.timeToWord(minutes: 23)}');
  print('0:00:01: ${parser.timeToWord(seconds: 1)}');
  print('0:00:02: ${parser.timeToWord(seconds: 2)}');
  print('0:00:11: ${parser.timeToWord(seconds: 11)}');
  print('1:01:01: ${parser.timeToWord(hours: 1, minutes: 1, seconds: 1)}');
  print('2:02:02: ${parser.timeToWord(hours: 2, minutes: 2, seconds: 2)}');
  print('12:00:00: ${parser.timeToWord(time: "12:00:00")}');
  print('время по строке: ${parser.timeToWord(time: "12:30")}');
}
