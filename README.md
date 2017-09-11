# Dart ISO 4217 currency code library

A library for ISO 4217 currency codes.

## Usage

A simple usage example:

    main() {
      xml.XmlDocument document =
          xml.parse(new File('list_one.xml').readAsStringSync());

      print(currencyFromXml(document).map((c) => c.numericCode).join(', '));
    }

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/rostgaard/dart-iso-4217/issues
