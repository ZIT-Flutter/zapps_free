// ignore_for_file: sort_child_properties_last, prefer_const_constructors, unused_local_variable, depend_on_referenced_packages

import 'dart:math';

import 'package:flutter/material.dart';

import 'package:zapps/components/constants.dart';
import 'package:zapps/test/sequence_data.dart';

import '../components/screen_utils.dart';

class GameScreenTest extends StatefulWidget {
  List<SequenceCardInfo> sequenceList;

  GameScreenTest({
    Key? key,
    required this.sequenceList,
  }) : super(key: key);

  @override
  State<GameScreenTest> createState() => _GameScreenTestState();
}

class _GameScreenTestState extends State<GameScreenTest> {
  List<int> draggableItems = [1, 2, 3, 4];
  Random random = Random();

  late double cardHeight;
  late double cardWidth;

  @override
  Widget build(BuildContext context) {
    cardHeight = ScreenUtil.screenWidth(context) * 0.2;
    cardWidth = ScreenUtil.screenWidth(context) * 0.15;

    return Scaffold(
      body: Row(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 20, top: 20),
            // color: Colors.amber,
            alignment: Alignment.topLeft,
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back)),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    buildRowWithRandomDragable(),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (int i = 1; i <= 4; i++)
                          dragTargetContainer(i, widget.sequenceList),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  DragTarget<SequenceCardInfo> dragTargetContainer(
      int targetSerial, List<SequenceCardInfo> sequenceList) {
    return DragTarget(
      onAccept: (SequenceCardInfo data) {
        setState(() {
          draggableItems.remove(targetSerial);
        });
        print('Accepted');
      },
      builder: (context, accepted, rejected) {
        return Container(
          margin: EdgeInsets.only(left: 10),
          width: cardWidth,
          height: cardHeight,
          child: Center(
            // sequenceList[targetSerial - 1].imageLocation
            child: accepted.isEmpty
                ? !draggableItems.contains(targetSerial)
                    ?
                    //
                    Container(
                        decoration: cardDecoration,
                        child: imageCard(
                            sequenceList[targetSerial - 1].imageLocation))
                    : Container(
                        decoration: cardDecoration,
                        width: cardWidth,
                        height: cardHeight,
                        child: Container(
                            child: Center(
                                child: Text(
                          '$targetSerial',
                          style: cardTextStyle,
                        ))),
                      )
                : Container(
                    width: cardWidth,
                    height: cardHeight,
                    decoration: getCardDecoration(Colors.greenAccent),
                    child: Center(
                        child: Text(
                      '$targetSerial',
                      style: cardTextStyle,
                    ))),
          ),
        );
      },
      onWillAccept: (SequenceCardInfo? data) {
        print('Drag serial is: ${data?.serial}');
        print('Target serial is: $targetSerial');
        if (data?.serial == targetSerial) {
          print('Yes');
          return true;
        }
        print('No');
        return false;
      },
    );
  }

  ClipRRect imageCard(String imageLocation) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(imageLocation));
  }

  Row buildRowWithRandomDragable() {
    // Shuffle the list of Sequence randomly
    draggableItems.shuffle(random);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: draggableItems.map((number) {
        return dragableCard(widget.sequenceList, number);
      }).toList(),
    );
  }

  Draggable<SequenceCardInfo> dragableCard(
      List<SequenceCardInfo> sequenceList, int serial) {
    return Draggable(
      data: sequenceList[serial - 1],
      child: Container(
        decoration: cardDecoration,
        margin: EdgeInsets.only(left: 10),
        width: cardWidth,
        height: cardHeight,
        child: Center(child: imageCard(sequenceList[serial - 1].imageLocation)),
      ),
      onDraggableCanceled: ((velocity, offset) {}),
      feedback: Container(
        width: cardWidth * 0.9,
        height: cardHeight * 0.9,
        decoration: cardDecoration,
        child: Center(
          child:
              Center(child: imageCard(sequenceList[serial - 1].imageLocation)),
        ),
      ),
    );
  }
}
