import 'package:flutter_pair_programming_lab/action/domain/entities/action_entity.dart';

sealed class ActionState {}

final class ActionInitial extends ActionState {}

final class ActionLoading extends ActionState {}

final class ActionSuccess extends ActionState {
  final List<ActionEntity> actionList;

  ActionSuccess({required this.actionList});
}

final class ActionEmpty extends ActionState {}

final class ActionError extends ActionState {
  final String message;

  ActionError({required this.message});
}