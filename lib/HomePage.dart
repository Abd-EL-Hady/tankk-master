import 'package:flutter/material.dart';

import 'CamPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String led = 'Off';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
            preferredSize:
            const Size.fromHeight(80.0), // here the desired height
            child: AppBar(
              backgroundColor: Colors.red,
              title: const Center(
                  child: Text(
                    'Control Page',
                    style: TextStyle(fontSize: 50),
                  )),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(20),
                ),
              ),
            )),
        body: Container(
            height: 11000,
            color: Colors.white,
            child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0),
                    )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: const BorderSide(color: Colors.black),
                              )),
                          backgroundColor:
                          MaterialStateProperty.all(Colors.red),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CamPage()),
                          );
                        },
                        child: const Text(
                          'Camera Page',
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        )),
                  ],
                ))));
  }
}
