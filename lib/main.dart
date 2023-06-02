import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(StopwatchApp());
}

class StopwatchApp extends StatelessWidget {
  const StopwatchApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stopwatch App',
      theme: ThemeData(primarySwatch: Colors.yellow),
      home: const StopwatchScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class StopwatchScreen extends StatefulWidget {
  const StopwatchScreen({Key? key}) : super(key: key);

  @override
  _StopwatchScreenState createState() => _StopwatchScreenState();
}

class _StopwatchScreenState extends State<StopwatchScreen> {
  bool _isRunning = false;
  int _seconds = 0;
  int _milliseconds = 0;
  Timer? _timer;

  void _startTimer() {
    if (!_isRunning) {
      setState(() {
        _isRunning = true;
      });
      _timer = Timer.periodic(const Duration(milliseconds: 100), (Timer timer) {
        setState(() {
          _milliseconds += 100;
          if (_milliseconds >= 1000) {
            _milliseconds = 0;
            _seconds++;
          }
        });
      });
    }
  }

  void _stopTimer() {
    if (_isRunning) {
      setState(() {
        _isRunning = false;
      });
      _timer?.cancel();
    }
  }

  void _resetTimer() {
    if (!_isRunning) {
      setState(() {
        _seconds = 0;
        _milliseconds = 0;
      });
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Center(child: const Text('Stopwatch App'))),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Seconds:',
                  style: const TextStyle(fontSize: 24, color: Colors.white),
                ),
                const SizedBox(width: 10),
                Text(
                  'Milliseconds:',
                  style: const TextStyle(fontSize: 24, color: Colors.white),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.yellow,
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '$_seconds : ',
                      style: const TextStyle(fontSize: 48, color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '$_milliseconds',
                      style: const TextStyle(fontSize: 28, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: _startTimer,
                  child: const Text('Start'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      vertical: 16.0,
                      horizontal: 24.0,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: _stopTimer,
                  child: const Text('Stop'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      vertical: 16.0,
                      horizontal: 24.0,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: _resetTimer,
                  child: const Text('Reset'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      vertical: 16.0,
                      horizontal: 24.0,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: const Text('Akshay Nishad'),
              accountEmail: const Text('rapuchingboy@GMAIL.com'),
              currentAccountPicture: CircleAvatar(
                child: const Text('JD'),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: const Text('aksbyte'),
              onTap: () {
                // Handle profile tap
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.email),
              title: const Text('Email'),
              subtitle: const Text('rapuchingboy@gmail.com'),
              onTap: () {
                // Handle email tap
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.language),
              title: const Text('Website'),
              subtitle: const Text('www.aksbyte.blogspot.com'),
              onTap: () {
                // Handle website tap
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.add_link_rounded),
              title: const Text('Github'),
              subtitle: const Text('github.com/aksbyte'),
              onTap: () {
                // Handle Instagram link tap
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: const Text('Phone'),
              subtitle: const Text('Not_available'),
              onTap: () {
                // Handle phone tap
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.youtube_searched_for),
              title: const Text('YouTube Channel'),
              subtitle: const Text('youtube.com/channel/aksbyte'),
              onTap: () {
                // Handle YouTube channel tap
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.link),
              title: const Text('Instagram'),
              subtitle: const Text('instagram.com/aksbyte'),
              onTap: () {
                // Handle Instagram link tap
                Navigator.pop(context);
              },
            ),
            Center(child: Padding(
              padding: const EdgeInsets.only(top: 90),
              child: Text('Developed by Aks'),
            )),
            // Add more ListTiles for additional options
          ],
        ),
      ),

    );
  }
}
