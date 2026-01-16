import 'package:flutter_pair_programming_lab/action/domain/entities/action_entity.dart';
import 'package:flutter_pair_programming_lab/action/domain/repositories/action_repository_interface.dart';

class GetActionListUsecase {
  final ActionRepositoryInterface repository;

  GetActionListUsecase({required this.repository});

  Future<List<ActionEntity>> call() async {
    return await repository.getActionList();
  }
}