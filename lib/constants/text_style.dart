import 'package:flutter/material.dart';

const regular = 'poppins';
const bold = 'poppins_bold';

ourTextStyle({
  family = regular,
  double? size = 14.0,
  color = Colors.white,
}) {
  TextStyle(
    fontFamily: family,
    fontSize: size,
    color: color,
    letterSpacing: 1.2,
  );
}
