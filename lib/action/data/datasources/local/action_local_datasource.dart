import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_pair_programming_lab/action/data/models/action_model.dart';
import 'package:flutter_pair_programming_lab/action/domain/entities/action_enums.dart';

abstract class ActionLocalDatasourceInterface {
  Future<List<ActionModel>> getActionList();
  Future<void> updateStatus(String id);
}

class ActionLocalDatasourceImpl implements ActionLocalDatasourceInterface {
  List<ActionModel>? _actionList;

  @override
  Future<List<ActionModel>> getActionList() async {
    if (_actionList != null) {
      return _actionList!;
    }

    final jsonString = await rootBundle.loadString(
      'assets/mock/action_list_mock.json',
    );

    final List jsonMap = jsonDecode(jsonString);
    _actionList = jsonMap.map((e) => ActionModel.fromJson(e)).toList();
    return _actionList!;
  }

  @override
  Future<void> updateStatus(String id) async {
    await Future.delayed(const Duration(milliseconds: 300));

    if (_actionList == null) return;

    final index = _actionList!.indexWhere((action) => action.id == id);
    if (index == -1) return;

    _actionList![index] = _actionList![index].copyWith(
      status: _actionList![index].status == ActionStatusEnum.pending
          ? ActionStatusEnum.done
          : ActionStatusEnum.pending,
    );
  }
}
