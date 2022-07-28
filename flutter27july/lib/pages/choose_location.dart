import 'package:flutter/material.dart';
import 'package:flutter27july/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> worldTimes = [
    WorldTime(
        location: 'Paris',
        flag: 'france.png',
        url: 'Europe/Paris',
        isDaytime: true,
        time: ''),
    WorldTime(
        location: 'London',
        flag: 'uk.png',
        url: 'Europe/London',
        isDaytime: true,
        time: ''),
    WorldTime(
        location: 'Berlin',
        flag: 'germany.png',
        url: 'Europe/Berlin',
        isDaytime: true,
        time: ''),
    WorldTime(
        location: 'Moscow',
        flag: 'russia.png',
        url: 'Europe/Moscow',
        isDaytime: true,
        time: ''),
  ];

  void updateTime(index) async {
    WorldTime worldTime = worldTimes[index];
    await worldTime.getTime();
    Navigator.pop(context, {
      'isDayTime': worldTime.isDaytime,
      'time': worldTime.time,
      'location': worldTime.location,
      'flag': worldTime.flag,
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: worldTimes.length,
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
              child: Card(
                child: ListTile(
                  onTap: () {
                    updateTime(index);
                  },
                  title: Text(worldTimes[index].location),
                  leading: CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/${worldTimes[index].flag}'),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
