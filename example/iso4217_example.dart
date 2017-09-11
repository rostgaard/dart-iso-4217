// Copyright (c) 2017, Kim Rostgaard Schomacker. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:convert';
import 'dart:io';
import 'package:iso4217/iso4217.dart';
import 'package:xml/xml.dart' as xml;

main() {
  xml.XmlDocument document =
      xml.parse(new File('list_one.xml').readAsStringSync());

  print(currencyFromXml(document).map((c) => c.numericCode).join(', '));
}
