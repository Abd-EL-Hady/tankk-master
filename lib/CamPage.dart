import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CamPage extends StatefulWidget {
  const CamPage({Key? key}) : super(key: key);

  @override
  State<CamPage> createState() => _CamPageState();
}

String up = "0";

class _CamPageState extends State<CamPage> {
  String led = 'Off';
  String sound = 'Not detected';
  String up = 'off';
  String right = 'off';
  String left = 'off';
  String down = 'off';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.redAccent.shade200,
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 9),
                child: IconButton(
                  icon: const Icon(Icons.flashlight_on_rounded),
                  onPressed: () async {
                    Firebase.initializeApp();
                    DatabaseReference myRef = FirebaseDatabase.instance.ref();
                    final snapshot = await myRef.child("car/led").get();
                    Object? newvalue = snapshot.value;
                    print(newvalue);
                    if (newvalue == "0") {
                      newvalue = "1";
                    } else {
                      newvalue = "0";
                    }
                    await myRef.set({
                      "car": {"led": newvalue}
                    });
                  },
                ),
              )
            ],
            title: const Text('Camera', textAlign: TextAlign.center),

              ),

        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.red,
                Colors.blue,
              ],
            )


          ),
          child: Center(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                  width: 300,
                  child: Text(
                    'Sound is $sound',
                    style: const TextStyle(fontSize: 25),
                  ),
                ),
                Container(
                  height: 250,
                  width: 300,
                  color: Colors.black,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                      splashColor: Colors.orange,
                      borderRadius: BorderRadius.circular(25),
                      onLongPress: () async {
                        Firebase.initializeApp();
                        DatabaseReference myRef = FirebaseDatabase.instance.ref();
                        final snapshot = await myRef.child("car/up").get();
                        Object? newvalue = snapshot.value;
                        print(newvalue);
                        if (newvalue == "0") {
                          newvalue = "1";
                        } else {
                          newvalue = "0";
                        }
                        await myRef.set({
                          "car": {"up": newvalue}
                        });
                      },
                      highlightColor: Colors.red,
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        alignment: Alignment.center,
                        child: const Icon(
                          Icons.arrow_upward,
                          color: Colors.black,
                        ),
                      )),
                ),
                Row(
                  mainAxisAlignment: (MainAxisAlignment.center),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                          splashColor: Colors.orange,
                          borderRadius: BorderRadius.circular(25),
                          onLongPress: () {},
                          highlightColor: Colors.red,
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            alignment: Alignment.center,
                            child: const Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                            ),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                          splashColor: Colors.orange,
                          borderRadius: BorderRadius.circular(25),
                          onLongPress: () {},
                          highlightColor: Colors.red,
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            alignment: Alignment.center,
                            child: const Icon(
                              Icons.arrow_forward,
                              color: Colors.black,
                            ),
                          )),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                      splashColor: Colors.orange,
                      borderRadius: BorderRadius.circular(25),
                      onLongPress: () {},
                      highlightColor: Colors.red,
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        alignment: Alignment.center,
                        child: const Icon(
                          Icons.arrow_downward_outlined,
                          color: Colors.black,
                        ),
                      )),
                ),
                Row(
                  children: [
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          alignment: Alignment.center,
                          primary: Colors.red,
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(20),
                        ),
                        onPressed: () {},
                        child: const Icon(Icons.stop),
                      ),
                    )
                  ],
                )
              ],
            ),
          )),
        ));
  }
}
