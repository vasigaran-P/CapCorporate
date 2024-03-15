// // home_page.dart
// import 'package:cap_corporate/pages/HistoryPage.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

//  // Import the HistoryPage widget

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: HomePage(),
//       theme: ThemeData(
//         primaryColor: Colors.blue, // Set the primary color
//         colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.blue), // Set the accent color
//         elevatedButtonTheme: ElevatedButtonThemeData(
//           style: ElevatedButton.styleFrom(
//             foregroundColor: Colors.white,
//             backgroundColor: Colors.blue, // Set the background color for ElevatedButton
//           ),
//         ),
//       ),
//     );
//   }
// }

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   String _response = '';
//   TimeOfDay? _selectedTime;

//   Future<void> fetchDataFromPython() async {
//     if (_selectedTime == null) {
//       setState(() {
//         _response = 'Please select a time first.';
//       });
//       return;
//     }

//     final url = Uri.parse('http://127.0.0.1:5000');
//     final response = await http.post(
//       url,
//       body: {
//         'hour': _selectedTime!.hour.toString(),
//         'minute': _selectedTime!.minute.toString(),
//       },
//     );

//     if (response.statusCode == 200) {
//       setState(() {
//         _response = response.body;
//       });
//     } else {
//       setState(() {
//         _response = 'Failed to fetch data from Python server.';
//       });
//     }
//   }

//   Future<void> _selectTime(BuildContext context) async {
//     final TimeOfDay? picked = await showTimePicker(
//       context: context,
//       initialTime: _selectedTime ?? TimeOfDay.now(),
//     );

//     if (picked != null) {
//       setState(() {
//         _selectedTime = picked;
//       });
//     }
//   }

//   void _showHistory() {
//     if (_selectedTime != null) {
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => HistoryPage(time: _selectedTime!)),
//       );
//     } else {
//       showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: Text('Error'),
//             content: Text('Please select a time first.'),
//             actions: <Widget>[
//               TextButton(
//                 child: Text('OK'),
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//               ),
//             ],
//           );
//         },
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Flutter App'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               onPressed: fetchDataFromPython,
//               child: Text('Analyse'),
//             ),
//             SizedBox(height: 20),
//             Text(
//               _response,
//               style: TextStyle(fontSize: 16, color: Colors.black54), // Set text style
//               textAlign: TextAlign.center,
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () => _selectTime(context),
//               child: Text('Select Time'),
//             ),
//             SizedBox(height: 20),
//             Text(
//               _selectedTime != null ? 'Selected Time: ${_selectedTime!.format(context)}' : 'No time selected',
//               style: TextStyle(fontSize: 16, color: Colors.black54), // Set text style
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _showHistory,
//               child: Text('History'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:cap_corporate/pages/HistoryPage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme: ThemeData(
        primaryColor: Colors.blue,
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.blue),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.blue,
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _response = ''; // Holds the status of the Python program
  TimeOfDay? _selectedTime;

  Future<void> fetchDataFromPython() async {
    if (_selectedTime == null) {
      setState(() {
        _response = 'Please select a time first.';
      });
      return;
    }

    final url = Uri.parse('http://127.0.0.1:5000');
    final response = await http.post(
      url,
      body: {
        'hour': _selectedTime!.hour.toString(),
        'minute': _selectedTime!.minute.toString(),
      },
    );

    if (response.statusCode == 200) {
      setState(() {
        // Update response based on the success or failure of the Python program
        _response =  'Successfully completed' ;
      });
    } else {
      setState(() {
        _response = 'Failed to fetch data from Python server.';
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime ?? TimeOfDay.now(),
    );

    if (picked != null) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  void _showHistory() {
    if (_selectedTime != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HistoryPage(time: _selectedTime!)),
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Please select a time first.'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: fetchDataFromPython,
              child: Text('Analyse'),
            ),
            SizedBox(height: 20),
            Text(
              _response.isNotEmpty ? 'status: $_response' : '',
              style: TextStyle(fontSize: 16, color: Colors.black54), // Set text style
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _selectTime(context),
              child: Text('Select Time'),
            ),
            SizedBox(height: 20),
            Text(
              _selectedTime != null ? 'Selected Time: ${_selectedTime!.format(context)}' : 'No time selected',
              style: TextStyle(fontSize: 16, color: Colors.black54), // Set text style
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _showHistory,
              child: Text('History'),
            ),
          ],
        ),
      ),
    );
  }
}
