import 'dart:ui';

import 'package:receipt_manager/utilities/mat_color_generator.dart';

const darkBackgroundColor = Color.fromRGBO(29, 40, 57, 1.0);
const backgroundColor = Color.fromRGBO(37, 49, 70, 1.0);
const accentColor = Color.fromRGBO(79, 116, 181, 1.0);
const textColor = Color.fromRGBO(135, 169, 227, 1.0);
const primarySwatch = Color.fromRGBO(115, 161, 248, 1.0);

final primarySwatchMaterial = MatColorGenerator.generateMaterialColor(primarySwatch);

// input forms
const border = accentColor;
const border_focused = primarySwatch;
const border_error = Color.fromRGBO(180, 17, 67, 1.0);
const border_focused_error = Color.fromRGBO(206, 18, 76, 1.0);
const border_disabled = Color.fromRGBO(122, 140, 175, 1.0);
