// ignore_for_file: prefer_const_constructors

import 'dart:ui';

class SequenceCardInfo {
  int serial;
  Color color;
  SequenceCardInfo({
    required this.serial,
    required this.color,
  });
}

List<SequenceCardInfo> sequence_1 = [
  SequenceCardInfo(serial: 1, color: Color.fromARGB(234, 3, 241, 43)),
  SequenceCardInfo(serial: 2, color: Color.fromARGB(234, 17, 107, 241)),
  SequenceCardInfo(serial: 3, color: Color.fromARGB(234, 140, 36, 238)),
  SequenceCardInfo(serial: 4, color: Color.fromARGB(234, 8, 243, 231)),
];
