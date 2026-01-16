import 'package:flutter_pair_programming_lab/action/data/datasources/local/action_local_datasource.dart';
import 'package:flutter_pair_programming_lab/action/data/models/action_model.dart';
import 'package:flutter_pair_programming_lab/action/domain/entities/action_entity.dart';
import 'package:flutter_pair_programming_lab/action/domain/repositories/action_repository_interface.dart';

class ActionRepositoryImpl implements ActionRepositoryInterface {
  final ActionLocalDatasourceInterface localDatasource;

  ActionRepositoryImpl({required this.localDatasource});

  @override
  Future<List<ActionEntity>> getActionList() async {
    final data = await localDatasource.getActionList();
    return ActionModel.toEntityList(data);
  }

  @override
  Future<void> updateStatus(String id) async {
    return await localDatasource.updateStatus(id);
  }
}