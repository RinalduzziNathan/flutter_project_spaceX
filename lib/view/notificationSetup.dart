
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

import '../manager/notification_service.dart';

class NotificationSetup extends StatefulWidget {
  const NotificationSetup({Key? key}) : super(key: key);

  @override
  _NotificationSetupState createState() => _NotificationSetupState();
}

class _NotificationSetupState extends State<NotificationSetup> {

  late bool? notificationSwitch;
  late var prefs;
  var pressed = false;
  Future<bool> initshared () async {
    prefs = await SharedPreferences.getInstance();

    notificationSwitch = prefs.getBool('notif');
    if(notificationSwitch == null){
      notificationSwitch = true;
      await prefs.setBool('notif', true);
    }
    return true;
  }

  @override
   initState()  {
    super.initState();
    tz.initializeTimeZones();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<bool>(
        future: initshared(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
      if (snapshot.hasData) {return Center(
          child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Notifications :"),
              Switch(
                value: notificationSwitch ?? true,
                onChanged: (value) {

                  setState(() {
                    notificationSwitch = value;
                    prefs.setBool('notif', value);
                  });
                },
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: InkWell(
                  onTap: () {
                    NotificationService().cancelAllNotifications();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                        border: Border.all(
                          color: Colors.blueGrey,
                              width: 3,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    height: 40,
                    width: 230,

                    child: const Center(
                      child: Text(
                        "Cancel upcoming notifications ",
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  NotificationService().showNotification(
                      1, "This is just a test",
                      "Time between launches can be long, here it's 5 seconds", 5);
                  setState(() {
                    pressed = true;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: pressed ? Colors.green : Colors.blueAccent,
                      border: Border.all(
                        color: Colors.blueGrey,
                        width: 3,

                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                  height: 40,
                  width: 230,
                  child: Center(
                    child: Text(
                        "Show a test notification"
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
  }
        return  Center(
          child: CircularProgressIndicator());}
      ),
    );
  }
}
