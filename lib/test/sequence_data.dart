// ignore_for_file: prefer_const_constructors

class SequenceCardInfo {
  int serial;
  String imageLocation;
  SequenceCardInfo({
    required this.serial,
    required this.imageLocation,
  });
}

List<SequenceCardInfo> sequence_1 = [
  SequenceCardInfo(
      serial: 1, imageLocation: 'assets/images/sequence_apple_1.png'),
  SequenceCardInfo(
      serial: 2, imageLocation: 'assets/images/sequence_apple_2.png'),
  SequenceCardInfo(
      serial: 3, imageLocation: 'assets/images/sequence_apple_3.png'),
  SequenceCardInfo(
      serial: 4, imageLocation: 'assets/images/sequence_apple_4.png'),
];
