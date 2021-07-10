import 'package:flutter/material.dart';

class TimeComponent extends StatefulWidget {
  @override
  _TimeComponentState createState() => _TimeComponentState();
}

class _TimeComponentState extends State<TimeComponent> {
  final List<String> _hours = List.generate(25, (index) => index++)
      .map((h) => '${h.toString().padLeft(2, '0')}')
      .toList();

  final List<String> _minutes = List.generate(61, (index) => index++)
      .map((m) => '${m.toString().padLeft(2, '0')}')
      .toList();

  final List<String> _seconds = List.generate(61, (index) => index++)
      .map((s) => '${s.toString().padLeft(2, '0')}')
      .toList();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildBox(_hours),
        _buildBox(_minutes),
        _buildBox(_seconds),
      ],
    );
  }

  Widget _buildBox(List<String> options) {
    return Container(
      width: 100,
      height: 120,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            spreadRadius: 0,
            blurRadius: 10,
            color: Theme.of(context).primaryColor,
            offset: Offset(2, 5),
          )
        ],
      ),
      child: ListWheelScrollView(
        itemExtent: 60,
        perspective: 0.007,
        physics: FixedExtentScrollPhysics(),
        children: options
            .map<Text>((e) => Text(
                  e,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: Colors.white,
                  ),
                ))
            .toList(),
      ),
    );
  }
}
