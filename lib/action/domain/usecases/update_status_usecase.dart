import 'package:flutter_pair_programming_lab/action/domain/repositories/action_repository_interface.dart';

class UpdateStatusUsecase {
  final ActionRepositoryInterface repository;

  UpdateStatusUsecase({required this.repository});

  Future<void> call(String id) async {
    return await repository.updateStatus(id);
  }
}