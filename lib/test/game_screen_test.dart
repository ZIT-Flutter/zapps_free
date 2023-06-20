// ignore_for_file: sort_child_properties_last, prefer_const_constructors, unused_local_variable

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:zapps/test/sequence_data.dart';

class GameScreenTest extends StatefulWidget {
  const GameScreenTest({super.key});

  @override
  State<GameScreenTest> createState() => _GameScreenTestState();
}

class _GameScreenTestState extends State<GameScreenTest> {
  List<int> draggableItems = [1, 2, 3, 4];
  Random random = Random();

  Color defaultTargetColor = Colors.red;

  @override
  Widget build(BuildContext context) {
    // List draggableItemsnew = draggableItems.shuffle(random);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buildRowWithRandomDragabe(),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                dragTargetContainer(1),
                dragTargetContainer(2),
                dragTargetContainer(3),
                dragTargetContainer(4),
              ],
            ),
          ],
        ),
      ),
    );
  }

  DragTarget<SequenceCardInfo> dragTargetContainer(int targetSerial) {
    return DragTarget(
      onAccept: (SequenceCardInfo data) {
        setState(() {
          draggableItems.remove(targetSerial);
        });
        print('Success');
      },
      builder: (context, accepted, rejected) {
        return Container(
          margin: EdgeInsets.only(left: 10),
          width: 100,
          height: 100,
          color: accepted.isEmpty
              ? !draggableItems.contains(targetSerial)
                  ? sequence_1[targetSerial - 1].color
                  : Colors.red
              : Colors.grey.shade200,
          child: Center(child: Text('$targetSerial')),
        );
      },
      onWillAccept: (SequenceCardInfo? data) {
        print('Drag serial is: ${data?.serial}');
        print('Target serial is: $targetSerial');
        if (data?.serial == targetSerial) {
          print('Success');
          return true;
        }
        print('Failed');
        return false;
      },
    );
  }

  Row buildRowWithRandomDragabe() {
    // Shuffle the list of numbers randomly
    draggableItems.shuffle(random);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: draggableItems.map((number) {
        return dragableContainer(number);
      }).toList(),
    );
  }

  Draggable<SequenceCardInfo> dragableContainer(int index) {
    return Draggable(
      data: sequence_1[index - 1],
      child: Container(
        margin: EdgeInsets.only(left: 10),
        width: 100,
        height: 100,
        color: Colors.orangeAccent,
        child: Center(
          child: Text('${sequence_1[index - 1].serial}'),
        ),
      ),
      onDraggableCanceled: ((velocity, offset) {}),
      feedback: Container(
        width: 100,
        height: 100,
        color: Colors.orangeAccent.withOpacity(0.5),
        child: Center(
          child: Text(
            '${sequence_1[index - 1].serial}',
            style: TextStyle(
              color: Colors.white,
              decoration: TextDecoration.none,
              fontSize: 18.0,
            ),
          ),
        ),
      ),
    );
  }
}
