import 'package:flutter_pair_programming_lab/action/domain/entities/action_entity.dart';

abstract class ActionRepositoryInterface {
  Future<List<ActionEntity>> getActionList();
  Future<void> updateStatus(String id);
}