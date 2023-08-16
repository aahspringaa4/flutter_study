import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MemoScreen extends StatefulWidget {
  const MemoScreen({super.key});

  @override
  State<MemoScreen> createState() => _MemoScreenState();
}

class _MemoScreenState extends State<MemoScreen> {
  final List<String> _memos = []; 
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadMemos(); 
  }

  Future<void> loadMemos() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> loadedMemos = prefs.getStringList('memos') ?? [];
    setState(() {
      _memos.addAll(loadedMemos);
    });
  }

  Future<void> addMemo(String memo) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('memos', _memos);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _memos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_memos[index]),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _textEditingController,
              decoration: const InputDecoration(labelText: '메모 추가'),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _memos.add(_textEditingController.text);
                addMemo(_textEditingController.text);
                _textEditingController.clear();
              });
            },
            child: const Text('SEND'),
          ),
        ],
      ),
    );
  }
}

_saveLocal(List<String> memos, ) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setStringList('memos', memos);
}