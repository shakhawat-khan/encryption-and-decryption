import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:encrypt/encrypt.dart' as encrypt;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Check(),
    );
  }
}

class Check extends StatelessWidget {
  const Check({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('encode decode'),
      ),
      body: ListView(
        children: [
          ElevatedButton(
              onPressed: () {
                const farnetkey =
                    '7lCHayzPMMV1S_0AmHpsbytup52kQaEienBwLOMBeSo=';

                const inputtext =
                    'gAAAAABk546UjoEPJkGbQE9l9mssvXR2ctc4Wf6TZ-vB2uVOql66qrWi0cA_GnFjmBqmlNorzFhEQKE5nXHB7ifAgB8OWKBJ9AuTyCY-UR4_vJHoAfnxzMCLa0RJOh4TXd9oe9aA_YJFnz56sxWnbqMRcV5PdOAEww==';

                final key = encrypt.Key.fromBase64(farnetkey);

                final b64key =
                    encrypt.Key.fromBase64(base64Url.encode(key.bytes));

                final fernet = encrypt.Fernet(b64key);

                final encrypter = encrypt.Encrypter(fernet);

                final encrypted = encrypter.decrypt64(inputtext);

                print(encrypted);
              },
              child: const Text('press'))
        ],
      ),
    );
  }
}
