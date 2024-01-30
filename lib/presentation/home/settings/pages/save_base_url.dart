import 'package:CashierPOS/data/datasources/auth_local_datasource.dart';
import 'package:flutter/material.dart';

class SaveBaseURLPage extends StatefulWidget {
  const SaveBaseURLPage({super.key});

  @override
  State<SaveBaseURLPage> createState() => _SaveBaseURLPageState();
}

class _SaveBaseURLPageState extends State<SaveBaseURLPage> {
  TextEditingController? baseURLController;

  String baseURL = '';

  Future<void> getBaseURL() async {
    baseURL = await AuthLocalDataSource().getBaseURL();
  }

  @override
  void initState() {
    super.initState();

    baseURLController = TextEditingController();
    getBaseURL();
    //delay 2 detik
    Future.delayed(const Duration(seconds: 2), () {
      baseURLController!.text = baseURL;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Save Server Key'),
        centerTitle: true,
      ),
      //textfield untuk input server key
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: baseURLController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Base URL Link',
              ),
            ),
          ),
          //button untuk save server key
          ElevatedButton(
            onPressed: () {
              AuthLocalDataSource().saveBaseURL(baseURLController!.text);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Base URL Link saved'),
                ),
              );
              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}
