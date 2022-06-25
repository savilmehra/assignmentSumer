import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/data.dart';
import '../cubits/cubit_main.dart';
import '../states/main_state.dart';
import '../states/states.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Products> list = [];

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      BlocProvider.of<CubitMain>(context).loadPage();
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MainPage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: _getBody()
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }

  Widget _getBody() {
    return BlocBuilder<CubitMain, MainState>(builder: (context, state) {
      if (state is Loaded) {
        list = state.list;
      }

      return Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    title: Text(list[index].name ?? ""),
                    subtitle: Text(list[index].description ?? ""),
                    trailing: Text(list[index].quantity ?? ""),
                  ),
                );
              }));
    });
  }
}
