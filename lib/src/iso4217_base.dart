// Copyright (c) 2017, Kim Rostgaard Schomacker. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
import 'package:xml/xml.dart' as xml;

Iterable<Currency> currencyFromXml(xml.XmlDocument doc) =>
    doc.findAllElements('CcyNtry').map((final xml.XmlElement element) {
      String tryElement(final String nodeName, String defaultValue) {
        Iterable<xml.XmlElement> nodes = element.findElements(nodeName);
        if (nodes.isEmpty) {
          return defaultValue;
        } else {
          return nodes.first.text;
        }
      }

      try {
        final String country = tryElement('CtryNm', 'N.A.');
        final String currencyName = tryElement('CcyNm', 'N.A.');
        final String alphabeticCode = tryElement('Ccy', 'N.A.');
        final String numericCode = tryElement('CcyNbr', 'N.A.');
        final String minorUnitS = tryElement('CcyMnrUnts', 'N.A.');

        final int minorUnit = minorUnitS == "N.A." ? 0 : int.parse(minorUnitS);

        return new Currency(
            alphabeticCode, currencyName, country, minorUnit, numericCode);
      } catch (e, s) {
        print(element);
      }
    }).where((c) => c != null);

abstract class _key {
  static const alphabeticCode = 'AlphabeticCode';
  static const currencyName = 'Currency';
  static const entity = 'Entity';
  static const minorUnit = 'MinorUnit';
  static const numericCode = 'NumericCode';
}

/// Main currency class. Model class that represents a currency with the
/// required ISO 4217 information.
class Currency {
  /// The shorthand ISO 3166-1 alpha-3 code for the currency country.
  /// Example: DKK
  final String alphabeticCode;

  /// English name for currency. Example: Euro
  final String currencyName;

  /// Name of the country of the currency in upper-case. Example: BRAZIL
  final String country;

  /// Number of digits after decimal point. Example: 2
  final int minorUnit;

  /// The numeric code of the currency. Consists of three digit characters.
  /// Example: 072
  final String numericCode;

  /// Default constructor.
  const Currency(this.alphabeticCode, this.currencyName, this.country,
      this.minorUnit, this.numericCode);
}
