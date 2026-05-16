library digits_to_words_russian;

import 'dart:core';

import 'exception.dart';

class DigitsToWordsParser {
  final List<List<String>> _digs = [
    ['ноль'],
    ['один', 'одна'],
    ['два', 'две'],
    ['три'],
    ['четыре'],
    ['пять'],
    ['шесть'],
    ['семь'],
    ['восемь'],
    ['девять'],
    ['десять'],
    ['одиннадцать'],
    ['двенадцать'],
    ['тринадцать'],
    ['четырнадцать'],
    ['пятнадцать'],
    ['шестнадцать'],
    ['семнадцать'],
    ['восемнадцать'],
    ['девятнадцать']
  ];
  final List<List<String>> _dec = [
    [''],
    [''],
    ['двадцать'],
    ['тридцать'],
    ['сорок'],
    ['пятьдесят'],
    ['шестьдесят'],
    ['семьдесят'],
    ['восемьдесят'],
    ['девяносто']
  ];

  final List<List<String>> _hund = [
    [''],
    ['сто'],
    ['двести'],
    ['триста'],
    ['четыреста'],
    ['пятьсот'],
    ['шестьсот'],
    ['семьсот'],
    ['восемьсот'],
    ['девятьсот']
  ];
  final List<List<String>> _categories = [
    [''],
    [''],
    ['тысяча', 'тысячи', 'тысяч'],
    ['миллион', 'миллиона', 'миллионов'],
    ['миллиард', 'миллиарда', 'миллиардов']
  ];

  // Порядковые числительные (мужской род по умолчанию)
  final List<List<String>> _ordinalDigs = [
    ['ноль'],
    ['первый', 'первая', 'первое'],
    ['второй', 'вторая', 'второе'],
    ['третий', 'третья', 'третье'],
    ['четвёртый', 'четвёртая', 'четвёртое'],
    ['пятый', 'пятая', 'пятое'],
    ['шестой', 'шестая', 'шестое'],
    ['седьмой', 'седьмая', 'седьмое'],
    ['восьмой', 'восьмая', 'восьмое'],
    ['девятый', 'девятая', 'девятое'],
    ['десятый', 'десятая', 'десятое'],
    ['одиннадцатый', 'одиннадцатая', 'одиннадцатое'],
    ['двенадцатый', 'двенадцатая', 'двенадцатое'],
    ['тринадцатый', 'тринадцатая', 'тринадцатое'],
    ['четырнадцатый', 'четырнадцатая', 'четырнадцатое'],
    ['пятнадцатый', 'пятнадцатая', 'пятнадцатое'],
    ['шестнадцатый', 'шестнадцатая', 'шестнадцатое'],
    ['семнадцатый', 'семнадцатая', 'семнадцатое'],
    ['восемнадцатый', 'восемнадцатая', 'восемнадцатое'],
    ['девятнадцатый', 'девятнадцатая', 'девятнадцатое']
  ];

  final List<List<String>> _ordinalDec = [
    [''],
    [''],
    ['двадцатый', 'двадцатая', 'двадцатое'],
    ['тридцатый', 'тридцатая', 'тридцатое'],
    ['сороковой', 'сороковая', 'сороковое'],
    ['пятидесятый', 'пятидесятая', 'пятидесятое'],
    ['шестидесятый', 'шестидесятая', 'шестидесятое'],
    ['семидесятый', 'семидесятая', 'семидесятое'],
    ['восьмидесятый', 'восьмидесятая', 'восьмидесятое'],
    ['девяностый', 'девяностая', 'девяностое']
  ];

  final List<List<String>> _ordinalHund = [
    [''],
    ['сотый', 'сотая', 'сотое'],
    ['двухсотый', 'двухсотая', 'двухсотое'],
    ['трёхсотый', 'трёхсотая', 'трёхсотое'],
    ['четырёхсотый', 'четырёхсотая', 'четырёхсотое'],
    ['пятисотый', 'пятисотая', 'пятисотое'],
    ['шестисотый', 'шестисотая', 'шестисотое'],
    ['семисотый', 'семисотая', 'семисотое'],
    ['восьмисотый', 'восьмисотая', 'восьмисотое'],
    ['девятисотый', 'девятисотая', 'девятисотое']
  ];

  /// Converts a cardinal number (quantitative numeral) to Russian text.
  ///
  /// Use this method for regular numbers: quantities, amounts, counts, etc.
  ///
  /// Example:
  /// ```dart
  /// parser.toWords(number: 42)        // "сорок два"
  /// parser.toWords(number: 1001)      // "одна тысяча один"
  /// parser.toWords(number: 2021)      // "две тысячи двадцать один"
  /// ```
  ///
  /// Supports numbers from 0 to 999,999,999,999.
  String toWords({required int number}) {
    if (number > 999999999999) {
      throw DigitsToWordsRussianParserException(
          message: 'число должно быть меньше 1 триллиона');
    }
    if (number == 0) {
      return _digs[0][0];
    }

    List<int> numberMilletimation = [];
    int i = number;
    while (i != 0) {
      int j = i % 1000;
      i = i ~/ 1000;
      numberMilletimation.add(j);
    }

    int category = numberMilletimation.length;
    String digitName = '';

    for (i = category - 1; i >= 0; i--) {
      String part = _decimation(numberMilletimation[i], i + 1);
      if (part.isNotEmpty) {
        if (digitName.isNotEmpty) {
          digitName += ' $part';
        } else {
          digitName = part;
        }
      }
    }

    return digitName;
  }

  String _decimation(int number, int category) {
    String word = '';
    List<int> decs = [];
    int i = number;
    while (i != 0) {
      int j = i % 10;
      i = i ~/ 10;
      decs.add(j);
    }
    while (decs.length != 3) {
      decs.add(0);
    }

    word = _decToString(decs, category);

    return word;
  }

  String _decToString(List<int> decs, int category) {
    String word = '';

    void addWord(String w) {
      if (w.isNotEmpty) {
        if (word.isNotEmpty) {
          word += ' $w';
        } else {
          word = w;
        }
      }
    }

    // название сотен, если есть
    if (decs[2] > 0) {
      addWord(_hund[decs[2]][0]);
      if (decs[1] == 0 && decs[0] == 0 && category > 1) {
        addWord(_categories[category][2]);
      }
    }

    // есть десятки
    if (decs[1] > 0) {
      // если первый десяток (10-19)
      if (decs[1] == 1) {
        addWord(_digs[decs[1] * 10 + decs[0]][0]);
        if (category > 1) {
          addWord(_categories[category][2]);
        }
      }
      // от второго десятка (20+)
      if (decs[1] > 1) {
        // название десятка
        addWord(_dec[decs[1]][0]);
        // если круглый десяток и разряд больше сотни
        if (decs[0] == 0 && category > 1) {
          addWord(_categories[category][2]);
        }
        // единицы для второго десятка
        if (decs[0] > 0) {
          // для единицы и двойки
          if (decs[0] == 1 || decs[0] == 2) {
            // в пределах сотни
            if (category == 1) {
              addWord(_digs[decs[0]][0]);
            }
            // для тысячи
            if (category == 2) {
              addWord(_digs[decs[0]][1]); // одна/две
              addWord(decs[0] == 1
                  ? _categories[category][0]
                  : _categories[category][1]);
            }
            if (category > 2) {
              addWord(_digs[decs[0]][0]); // добавляем цифру ("один"/"два")
              addWord(decs[0] == 1
                  ? _categories[category][0]
                  : _categories[category][1]);
            }
          }
          // для 3 и 4
          if (decs[0] == 3 || decs[0] == 4) {
            addWord(_digs[decs[0]][0]);
            if (category > 1) {
              addWord(_categories[category][1]);
            }
          }
          // для 5 и т.д.
          if (decs[0] > 4) {
            addWord(_digs[decs[0]][0]);
            if (category > 1) {
              addWord(_categories[category][2]);
            }
          }
        }
      }
    }

    // единицы (когда нет десятков)
    if (decs[0] > 0 && decs[1] == 0) {
      if (category == 2) {
        if (decs[0] == 1 || decs[0] == 2) {
          addWord(_digs[decs[0]][1]);
        } else {
          addWord(_digs[decs[0]][0]);
        }
      } else {
        addWord(_digs[decs[0]][0]);
      }

      if (category > 1) {
        if (decs[0] == 1) {
          addWord(_categories[category][0]);
        } else if (decs[0] > 1 && decs[0] < 5) {
          addWord(_categories[category][1]);
        } else {
          addWord(_categories[category][2]);
        }
      }
    }
    return word;
  }

  /// Converts a number to an ordinal numeral (порядковое числительное) in Russian.
  ///
  /// Use this method for rankings, positions, order numbers, and dates (day of month).
  ///
  /// The gender parameter specifies the grammatical gender:
  /// - `'m'` (masculine) - for masculine nouns: первый, второй, двадцать первый
  /// - `'f'` (feminine) - for feminine nouns: первая, вторая, двадцать первая
  /// - `'n'` (neuter) - for neuter nouns: первое, второе, двадцать первое
  ///
  /// Default gender is masculine (`'m'`).
  ///
  /// Example:
  /// // Masculine (default)
  /// parser.ordinalToWords(number: 1)        // "первый" (1-й этаж)
  /// parser.ordinalToWords(number: 21)       // "двадцать первый" (21-й этаж)
  ///
  /// // Feminine
  /// parser.ordinalToWords(number: 1, gender: 'f')  // "первая" (1-я улица)
  /// parser.ordinalToWords(number: 21, gender: 'f') // "двадцать первая" (21-я улица)
  ///
  /// // Neuter
  /// parser.ordinalToWords(number: 1, gender: 'n')  // "первое" (1-е место)
  /// parser.ordinalToWords(number: 32, gender: 'n') // "тридцать второе" (32-е место)

  String ordinalToWords({required int number, String gender = 'm'}) {
    if (number < 0) {
      throw DigitsToWordsRussianParserException(
          message: 'число должно быть неотрицательным');
    }
    if (number == 0) {
      return _ordinalDigs[0][0];
    }

    List<int> numberMilletimation = [];
    int i = number;
    while (i != 0) {
      int j = i % 1000;
      i = i ~/ 1000;
      numberMilletimation.add(j);
    }

    int category = numberMilletimation.length;
    String result = '';

    for (i = category - 1; i >= 0; i--) {
      String part = _ordinalDecimation(numberMilletimation[i], i + 1, gender);
      if (part.isNotEmpty) {
        if (result.isNotEmpty) {
          result += ' $part';
        } else {
          result = part;
        }
      }
    }

    return result;
  }

  String _ordinalDecimation(int number, int category, String gender) {
    String word = '';
    List<int> decs = [];
    int i = number;

    if (number == 0) {
      return '';
    }

    while (i != 0) {
      int j = i % 10;
      i = i ~/ 10;
      decs.add(j);
    }
    while (decs.length != 3) {
      decs.add(0);
    }

    word = _ordinalDecToString(decs, category, gender);

    return word;
  }

  String _ordinalDecToString(List<int> decs, int category, String gender) {
    String word = '';
    int genderIndex = gender == 'f' ? 1 : (gender == 'n' ? 2 : 0);

    // Для порядковых числительных изменяется только последнее слово
    bool isLastCategory = category == 1;

    void addWord(String w) {
      if (w.isNotEmpty) {
        if (word.isNotEmpty) {
          word += ' $w';
        } else {
          word = w;
        }
      }
    }

    // Сотни
    if (decs[2] > 0) {
      if (isLastCategory) {
        addWord(_ordinalHund[decs[2]][genderIndex]);
      } else {
        // Не последняя категория — используем количественные формы
        if (decs[1] == 0 && decs[0] == 0 && category > 1) {
          addWord(_categories[category][2]);
        } else {
          addWord(_hund[decs[2]][0]);
        }
      }
    }

    // Десятки
    if (decs[1] > 0) {
      if (decs[1] == 1) {
        // teens (10-19)
        if (isLastCategory) {
          addWord(_ordinalDigs[decs[1] * 10 + decs[0]][genderIndex]);
        } else {
          addWord(_digs[decs[1] * 10 + decs[0]][0]);
          if (category > 1) {
            addWord(_categories[category][2]);
          }
        }
      } else if (decs[1] > 1) {
        // от 20
        if (isLastCategory && decs[0] == 0) {
          // Круглое число десятков (20, 30, 40...)
          addWord(_ordinalDec[decs[1]][genderIndex]);
        } else {
          // Десяток + единицы
          addWord(_dec[decs[1]][0]);
          if (decs[0] > 0) {
            if (isLastCategory) {
              addWord(_ordinalDigs[decs[0]][genderIndex]);
            } else {
              // Обработка единиц для не последней категории
              if (decs[0] == 1 || decs[0] == 2) {
                if (category == 1) {
                  addWord(_digs[decs[0]][0]);
                } else if (category == 2) {
                  addWord(_digs[decs[0]][1]);
                  addWord(decs[0] == 1
                      ? _categories[category][0]
                      : _categories[category][1]);
                } else {
                  addWord(_digs[decs[0]][0]); // добавляем цифру ("один"/"два")
                  addWord(decs[0] == 1
                      ? _categories[category][0]
                      : _categories[category][1]);
                }
              } else if (decs[0] == 3 || decs[0] == 4) {
                addWord(_digs[decs[0]][0]);
                if (category > 1) {
                  addWord(_categories[category][1]);
                }
              } else {
                addWord(_digs[decs[0]][0]);
                if (category > 1) {
                  addWord(_categories[category][2]);
                }
              }
            }
          }
        }
      }
    }

    // Единицы (когда нет десятков)
    if (decs[0] > 0 && decs[1] == 0) {
      if (isLastCategory) {
        addWord(_ordinalDigs[decs[0]][genderIndex]);
      } else {
        if (category == 2) {
          if (decs[0] == 1 || decs[0] == 2) {
            addWord(_digs[decs[0]][1]);
          } else {
            addWord(_digs[decs[0]][0]);
          }
        } else {
          addWord(_digs[decs[0]][0]);
        }

        if (category > 1) {
          if (decs[0] == 1) {
            addWord(_categories[category][0]);
          } else if (decs[0] > 1 && decs[0] < 5) {
            addWord(_categories[category][1]);
          } else {
            addWord(_categories[category][2]);
          }
        }
      }
    }

    return word;
  }

  /// Преобразует порядковое числительное в именительный падеж (средний род)
  /// Для дат: "первое", "второе", "двадцать первое" и т.д.
  String _ordinalToNominativeNeuter(int number) {
    return ordinalToWords(number: number, gender: 'n');
  }

  /// Converts a date to Russian text format.
  ///
  /// Use this method for formatting dates (day, month, year) in Russian.
  ///
  /// The dayCase parameter controls the grammatical case of the day:
  /// - `genitive` (default) - genitive case: "первого марта" (used most often)
  /// - `nominative` - nominative case (neuter): "первое марта" (less common)
  ///
  /// Month is always in genitive case (января, февраля, марта, etc.) regardless of day case.
  ///
  /// Example:
  /// // Default (genitive case for day)
  /// parser.dateToWords(day: 1, month: 3, year: 2024)
  /// // "первого марта две тысячи двадцать четвёртого"
  ///
  /// parser.dateToWords(day: 15, month: 5)
  /// // "пятнадцатого мая"
  ///
  /// parser.dateToWords(day: 9, month: 5, year: 1945)
  /// // "девятого мая тысяча девятьсот сорок пятого"
  ///
  /// // Nominative case for day (neuter form)
  /// parser.dateToWords(day: 14, month: 7, year: 1789, dayCase: 'nominative')
  /// // "четырнадцатое июля одна тысяча семьсот восемьдесят девятого"

  ///
  /// **Quick reference:**
  /// - `'nominative'` = answering "What date is it?"
  ///   → "**July 14th**" (Четырнадцатое июля)
  ///
  /// - `'genitive'` (default) = answering "On/Of/Until what date?"
  ///   → "**of July 14th**" / "**on July 14th**" (четырнадцатого июля)
  ///
  /// **Examples:**
  /// // Nominative - stating the date itself
  /// dateToWords(day: 14, month: 7, case: 'nominative')
  /// // → "четырнадцатое июля"
  ///
  /// // Genitive - with prepositions or possessive meaning
  /// dateToWords(day: 14, month: 7, case: 'genitive')
  /// // → "четырнадцатого июля"
  /// // Used in phrases like: "until July 14th", "after July 14th", "the event of July 14th"
  dateToWords({
    required int day,
    required int month,
    int? year,
    String dayCase = 'genitive',
  }) {
    if (day < 1 || day > 31) {
      throw DigitsToWordsRussianParserException(
          message: 'день должен быть от 1 до 31');
    }
    if (month < 1 || month > 12) {
      throw DigitsToWordsRussianParserException(
          message: 'месяц должен быть от 1 до 12');
    }

    // Названия месяцев (всегда в родительном падеже для дат)
    final monthsGenitive = [
      '', // индекс 0 не используется
      'января',
      'февраля',
      'марта',
      'апреля',
      'мая',
      'июня',
      'июля',
      'августа',
      'сентября',
      'октября',
      'ноября',
      'декабря'
    ];

    // Формат дня (в зависимости от падежа)
    String dayText;
    switch (dayCase) {
      case 'nominative':
        // Именительный падеж: "двенадцатое", "первое" (средний род)
        dayText = _ordinalToNominativeNeuter(day);
        break;
      case 'genitive':
      default:
        // Родительный падеж: "двенадцатого", "первого"
        dayText = _toGenitiveOrdinal(day);
        break;
    }

    // Формат месяца (всегда в родительном падеже для дат)
    String monthText = monthsGenitive[month];

    String result = '$dayText $monthText';

    // Добавляем год если он указан
    if (year != null) {
      if (year < 0) {
        throw DigitsToWordsRussianParserException(
            message: 'год должен быть положительным');
      }
      result = '$result ${_formatYear(year)}';
    }

    return result.trim();
  }

  /// Форматирует год в текстовом виде с нужным падежом
  String _formatYear(int year) {
    // Для годов добавляем окончание в родительном падеже
    if (year >= 2000 && year <= 2099) {
      // Для 2000-2099: "две тысячи двадцать четвёртого"
      int lastTwoDigits = year % 100;

      if (lastTwoDigits == 0) {
        // 2000 -> двухтысячного
        return 'двухтысячного';
      } else if (lastTwoDigits >= 11 && lastTwoDigits <= 19) {
        // 2011-2019: две тысячи одиннадцатого
        return 'две тысячи ${_toGenitiveOrdinal(lastTwoDigits)}';
      } else {
        // 2001-2099: две тысячи первого, две тысячи двадцать третьего и т.д.
        return 'две тысячи ${_toGenitiveOrdinal(lastTwoDigits)}';
      }
    } else if (year >= 1900 && year <= 1999) {
      // Для 1900-1999: "тысяча девятьсот сорок пятого"
      int lastTwoDigits = year % 100;

      if (lastTwoDigits == 0) {
        return 'тысяча девятисотого';
      } else {
        return 'тысяча девятьсот ${_toGenitiveOrdinal(lastTwoDigits)}';
      }
    } else {
      // Для остальных годов
      int thousands = year ~/ 1000;
      int remainder = year % 1000;

      if (thousands > 0 && remainder == 0) {
        // Круглые тысячи: 40000 -> сорок тысячного
        String thousandsText = toWords(number: thousands);
        return '$thousandsText тысячного';
      } else if (thousands > 0) {
        // Есть и тысячи, и остаток
        String thousandsText =
            thousands == 1 ? 'одна' : toWords(number: thousands);
        String thousandWord = thousands == 1 ? 'тысяча' : 'тысяч';

        // Разбиваем остаток на сотни и последние две цифры
        int hundreds = remainder ~/ 100;
        int lastTwoDigits = remainder % 100;

        if (hundreds > 0 && lastTwoDigits == 0) {
          // Круглые сотни: 1300 -> одна тысяча трёхсотого
          String hundredsText = _toGenitiveOrdinal(hundreds * 100);
          return '$thousandsText $thousandWord $hundredsText';
        } else if (hundreds > 0) {
          // Есть и сотни, и остальные цифры: 1612 -> одна тысяча шестьсот двенадцатого
          String hundredsText = _hund[hundreds][0];
          String lastPart = _toGenitiveOrdinal(lastTwoDigits);
          return '$thousandsText $thousandWord $hundredsText $lastPart';
        } else {
          // Нет сотен: 1024 -> одна тысяча двадцать четвёртого
          String lastPart = _toGenitiveOrdinal(lastTwoDigits);
          return '$thousandsText $thousandWord $lastPart';
        }
      } else {
        // Нет тысяч
        return _toGenitiveOrdinal(remainder);
      }
    }
  }

  /// Преобразует порядковое числительное в родительный падеж (м.р.)
  String _toGenitiveOrdinal(int number) {
    String word = ordinalToWords(number: number, gender: 'm');

    // Особое слово: третий -> третьего
    if (word == 'третий') return 'третьего';
    if (word.endsWith(' третий')) {
      return word.substring(0, word.length - 7) + ' третьего';
    }

    // Для составных числительных склоняем только последнее слово
    // Например: "двадцать первый" -> "двадцать первого"
    List<String> parts = word.split(' ');
    String lastPart = parts.last;
    String newLastPart;

    if (lastPart.endsWith('ый') || lastPart.endsWith('ой')) {
      newLastPart = lastPart.substring(0, lastPart.length - 2) + 'ого';
    } else if (lastPart.endsWith('ий')) {
      newLastPart = lastPart.substring(0, lastPart.length - 2) + 'его';
    } else {
      newLastPart = lastPart;
    }

    if (parts.length > 1) {
      parts[parts.length - 1] = newLastPart;
      return parts.join(' ');
    }
    return newLastPart;
  }
}
