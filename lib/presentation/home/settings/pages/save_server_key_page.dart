import 'package:CashierPOS/core/components/spaces.dart';
import 'package:CashierPOS/data/datasources/auth_local_datasource.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SaveServerKeyPage extends StatefulWidget {
  const SaveServerKeyPage({super.key});

  @override
  State<SaveServerKeyPage> createState() => _SaveServerKeyPageState();
}

class _SaveServerKeyPageState extends State<SaveServerKeyPage> {
  TextEditingController? serverKeyController;
  TextEditingController? baseURLController;

  String serverKey = '';
  String baseURL = '';

  Future<void> fetchData() async {
    serverKey = await AuthLocalDataSource().getMitransServerKey();
    baseURL = await AuthLocalDataSource().getBaseURL();

    // delay 2 seconds
    await Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          serverKeyController?.text = serverKey;
          baseURLController?.text = baseURL;
        });
      }
    });
  }
  // Future<void> getServerKey() async {
  //   serverKey = await AuthLocalDataSource().getMitransServerKey();
  // }

  // Future<void> getBaseURL() async {
  //   baseURL = await AuthLocalDataSource().getBaseURL();
  // }

  @override
  void initState() {
    super.initState();
    serverKeyController = TextEditingController();
    baseURLController = TextEditingController();
    fetchData();
    // getServerKey();
    // getBaseURL();
    //delay 2 detik
    // Future.delayed(const Duration(seconds: 2), () {
    //   serverKeyController!.text = serverKey;
    //   baseURLController!.text = baseURL;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Save Key'),
        centerTitle: true,
      ),
      //textfield untuk input server key
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: serverKeyController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Server Key',
              ),
            ),
          ),
          //button untuk save server key
          ElevatedButton(
            onPressed: () {
              print('Save Server Key Pressed');
              print(serverKeyController?.text);
              if (serverKeyController?.text != null) {
                AuthLocalDataSource()
                    .saveMidtransServerKey(serverKeyController!.text);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Server Key saved'),
                  ),
                );
              }
              Navigator.pop(context);
            },
            child: const Text('Save Server Key'),
          ),
          SpaceHeight(20),
          // Divider(
          //   height: 20,
          // ),
          // Padding(
          //   padding: const EdgeInsets.all(20.0),
          //   child: TextField(
          //     controller: baseURLController,
          //     decoration: const InputDecoration(
          //       border: OutlineInputBorder(),
          //       labelText: 'Base URL Links',
          //     ),
          //   ),
          // ),

          // ElevatedButton(
          //   onPressed: () {
          //     print('Save Baseurl Key Pressed');
          //     print(baseURLController?.text);
          //     if (baseURLController?.text != null) {
          //       AuthLocalDataSource().saveBaseURL(baseURLController!.text);
          //       print('Save Baseurl Key Saved');
          //       ScaffoldMessenger.of(context).showSnackBar(
          //         const SnackBar(
          //           content: Text('Base URL Link saved'),
          //         ),
          //       );
          //     }
          //     Navigator.pop(context);
          //   },
          //   child: const Text('Save Base URL Link'),
          // ),
        ],
      ),
    );
  }
}
