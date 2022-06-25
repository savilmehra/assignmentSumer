import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/data.dart';
import '../states/main_state.dart';
import '../states/states.dart';

typedef Item = dynamic Function(dynamic itemData);

class CubitMain extends Cubit<MainState> {
  CubitMain() : super(LoadingState());

  Future<void> loadPage() async {
    var res = await rootBundle.loadString('assets/jsonfiles/data.json');
    final Map? parsed = json.decode(res);
    emit(Loaded(
      list: DataMain.fromJson(parsed as Map<String, dynamic>).products!,
    ));
  }
}
