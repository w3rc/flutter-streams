import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:test_streams/stream.dart';

class NumList extends StatefulWidget {
  @override
  _NumListState createState() => _NumListState();
}

class _NumListState extends State<NumList> {
  NumberStream get _ns => GetIt.I<NumberStream>();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<int>>(
      stream: _ns.out,
      builder: (BuildContext context, AsyncSnapshot<List<int>> snapshot) {
        print(snapshot.data.toString());
        if (!snapshot.hasData) {
          return Text('Waiting...');
        }
        return Container(
          child: ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (ctx, index) => Text(
              snapshot.data[index].toString(),
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        );
      },
    );
  }
}
