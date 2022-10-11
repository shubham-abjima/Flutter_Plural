import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:speechtotext/drawer.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  String _lastWords = '';

  @override
  void initState() {
    super.initState();
    _initSpeech();
  }

  /// This has to happen only once per app
  void _initSpeech() async {
    _speechEnabled = await _speechToText.initialize();
    setState(() {});
  }

  /// Each time to start a speech recognition session
  void _startListening() async {
    await _speechToText.listen(onResult: _onSpeechResult);
    setState(() {});
  }

  /// Manually stop the active speech recognition session
  /// Note that there are also timeouts that each platform enforces
  /// and the SpeechToText plugin supports setting timeouts on the
  /// listen method.
  void _stopListening() async {
    await _speechToText.stop();
    setState(() {});
  }

  /// This is the callback that the SpeechToText plugin calls when
  /// the platform returns recognized words.
  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      _lastWords = result.recognizedWords;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: Center(
            child: Text(
              'Speech Recognition App',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
            ),
          ),
          backgroundColor: Color.fromARGB(255, 57, 56, 56),
        ),
        drawer: MyDrawer(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(15),
                child: Container(
                  child: const Text(
                    'Recognized Words:',
                    style: TextStyle(fontSize: 25.0),
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    child: Text(
                      // If listening is active show the recognized words
                      _speechToText.isListening
                          ? '$_lastWords'
                          // If listening isn't active but could be tell the user
                          // how to start it, otherwise indicate that speech
                          // recognition is not yet ready or not supported on
                          // the target device
                          : _speechEnabled
                              ? 'Tap the microphone to start listening...'
                              : 'Speech not available',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: AvatarGlow(
          animate: _speechEnabled,
          glowColor: Color.fromARGB(255, 57, 56, 56),
          endRadius: 50,
          duration: const Duration(microseconds: 200),
          repeatPauseDuration: const Duration(milliseconds: 2),
          repeat: true,
          child: FloatingActionButton(
            backgroundColor: const Color.fromARGB(255, 57, 56, 56),
            onPressed:
                // If not yet listening for speech start, otherwise stop
                _speechToText.isNotListening ? _startListening : _stopListening,
            tooltip: 'Listen',
            child:
                Icon(_speechToText.isNotListening ? Icons.mic_off : Icons.mic),
          ),
        ),
      ),
    );
  }
}
