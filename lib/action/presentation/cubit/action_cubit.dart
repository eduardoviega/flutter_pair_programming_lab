import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pair_programming_lab/action/domain/usecases/get_action_list_usecase.dart';
import 'package:flutter_pair_programming_lab/action/domain/usecases/update_status_usecase.dart';
import 'package:flutter_pair_programming_lab/action/presentation/cubit/action_state.dart';

class ActionCubit extends Cubit<ActionState> {
  final GetActionListUsecase getActionListUsecase;
  final UpdateStatusUsecase updateStatusUsecase;

  ActionCubit({
    required this.getActionListUsecase,
    required this.updateStatusUsecase,
  }) : super(ActionInitial());

  Future<void> loadActionList() async {
    emit(ActionLoading());

    try {
      final actionList = await getActionListUsecase();

      if (actionList.isEmpty) {
        emit(ActionEmpty());
      } else {
        emit(ActionSuccess(actionList: actionList));
      }
    } on Exception catch (e) {
      emit(ActionError(message: e.toString()));
    }
  }

  Future<void> updateStatus(String id) async {
    try {
      await updateStatusUsecase(id);
      await loadActionList();
    } on Exception catch (e) {
      emit(ActionError(message: e.toString()));
    }
  }
}
