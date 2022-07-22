import 'package:flutter/material.dart';
import '../data/sp_helper.dart';
import '../data/session.dart';

class SessionScreen extends StatefulWidget {
  const SessionScreen({Key? key}) : super(key: key);

  @override
  State<SessionScreen> createState() => _SessionScreenState();
}

class _SessionScreenState extends State<SessionScreen> {
  List<Session> sessions = [];
  final TextEditingController txtDescription = TextEditingController();
  final TextEditingController txtDuration = TextEditingController();
  final SPHelper helper = SPHelper();

  @override
  void initState() {
    helper.init().then((value) {
      updateScreen();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Training Sessions: '),
      ),
      body: ListView(children: getContent()),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showSessionDialog(context);
        },
      ),
    );
  }

  Future<dynamic> showSessionDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: Text('Insert Training Data'),
              content: SingleChildScrollView(
                child: Column(children: [
                  TextField(
                    controller: txtDescription,
                    decoration: InputDecoration(hintText: 'Description'),
                  ),
                  TextField(
                    controller: txtDuration,
                    decoration: InputDecoration(hintText: 'Duration'),
                  )
                ]),
              ),
              actions: [
                TextButton(
                  child: Text('Cancel'),
                  onPressed: () {
                    Navigator.pop(context);
                    txtDescription.text = '';
                    txtDuration.text = '';
                  },
                ),
                ElevatedButton(
                  child: Text('Save'),
                  onPressed: saveSession,
                )
              ],
            ));
  }

  Future saveSession() async {
    DateTime now = DateTime.now();
    String today = '${now.year}-${now.month}-${now.day}';
    int id = helper.getCounter() + 1;
    Session newSession = Session(
        id, today, txtDescription.text, int.tryParse(txtDuration.text) ?? 0);
    helper.writeSession(newSession).then((_) {
      updateScreen();
      helper.setcounter();
    });
    txtDescription.text = '';
    txtDuration.text = '';
    Navigator.pop(context);
  }

  List<Widget> getContent() {
    List<Widget> tiles = [];
    sessions.forEach((session) {
      tiles.add(Dismissible(
        key: UniqueKey(),
        onDismissed: (_) {
          helper.deletSession(session.id).then((value) => updateScreen());
        },
        child: ListTile(
            title: Text(session.description),
            subtitle:
                Text('${session.date} - duration: ${session.duration} min')),
      ));
    });
    return tiles;
  }

  void updateScreen() {
    sessions = helper.getSessions();
    setState(() {});
  }
}
