import 'package:aws_simple_frontend/calculate_request_model.dart';
import 'package:aws_simple_frontend/calculate_response_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Simple AWS Service',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: const MyHomePage(title: 'Flutter Simple AWS Service'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  // TODO: Add URL for Lambda Service (with valid zone, if yours is not us-east-1)
  String lambdaUrl = 'https://XXXXXXXXXXXXXXX.execute-api.us-east-1.amazonaws.com/dev/add-one';

  final http.Client client = http.Client();

  Future<void> _incrementCounter() async {
    var request = CalculateRequestModel(value: _counter);
    final response = await client.post(
      Uri.parse(lambdaUrl),
      body: CalculateRequestModel.toJsonString(request),
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Content-Type": "application/json",
      },
    );
    var next = CalculateResponseModel.fromJsonString(response.body).value;

    setState(() {
      _counter = next;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
