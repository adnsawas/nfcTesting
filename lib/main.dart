import 'package:flutter/material.dart';
import 'package:nfc_app/loader.dart';
import 'package:nfc_emulator/nfc_emulator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void _emulateNfcCard(String aid) async {
    print("Hit");
    // Start NFC emulator with AID, cardUid, and optional AES key:
    await NfcEmulator.startNfcEmulator(aid, "cd22c716");
    // Show the loader
    setState(() => _loading = true);
    // Set a timer that stops NFC emulator after 5 seconds
    Future.delayed(Duration(seconds: 5)).then((value) {
      setState(() => _loading = false);
      NfcEmulator.stopNfcEmulator();
    });
  }

  bool _loading = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: MyLoader(
      isLoading: _loading,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Each button should trigger HCE mode with the specified AID and a random UID\n\nThe UID that was specified in the Manifest file is the last one'),
            ElevatedButton(
                onPressed: () => _emulateNfcCard('444B65630001'),
                child: Text('Emulate card with AID=444B65630001')),
            ElevatedButton(
                onPressed: () => _emulateNfcCard('555B65630001'),
                child: Text('Emulate card with AID=555B65630001')),
            ElevatedButton(
                onPressed: () => _emulateNfcCard('666B65630001'),
                child: Text('Emulate card with AID=666B65630001')),
          ],
        ),
      ),
    ),
      ),
    );
  }
}
