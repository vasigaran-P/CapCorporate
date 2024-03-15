// history_page.dart
import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  final TimeOfDay time;

  const HistoryPage({required this.time});

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  List<TimeOfDay> processTimes = []; // Store completed process times

  @override
  void initState() {
    super.initState();
    print('Initializing HistoryPage...');
    // Add initial process time only if the list is empty
    if (processTimes.isEmpty) {
      processTimes.add(widget.time);
    }
  }

  @override
  Widget build(BuildContext context) {
    print('Building HistoryPage...');
    return Scaffold(
      appBar: AppBar(
        title: Text('History Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: processTimes.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Process completed for ${processTimes[index].format(context)}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
