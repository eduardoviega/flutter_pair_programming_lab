import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pair_programming_lab/action/domain/entities/action_entity.dart';
import 'package:flutter_pair_programming_lab/action/domain/entities/action_enums.dart';
import 'package:flutter_pair_programming_lab/action/presentation/cubit/action_cubit.dart';
import 'package:flutter_pair_programming_lab/action/presentation/cubit/action_state.dart';
import 'package:flutter_pair_programming_lab/di/dependency_injection.dart';

class ActionPage extends StatelessWidget {
  const ActionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => injector.get<ActionCubit>()..loadActionList(),
      child: ActionView(),
    );
  }
}

class ActionView extends StatelessWidget {
  const ActionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ActionCubit, ActionState>(
        builder: (context, state) {
          return switch (state) {
            ActionInitial() => const Center(child: Text('Initial State')),
            ActionLoading() => const Center(child: CircularProgressIndicator()),
            ActionSuccess(actionList: final actionList) => ListView.builder(
              itemCount: actionList.length,
              itemBuilder: (context, index) {
                final action = actionList[index];
                return ActionListTile(action: action);
              },
            ),
            ActionEmpty() => const Center(child: Text('No Actions Available')),
            ActionError(message: final message) => Center(
              child: Text('Error: $message'),
            ),
          };
        },
      ),
    );
  }
}

class ActionListTile extends StatelessWidget {
  const ActionListTile({super.key, required this.action});

  final ActionEntity action;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(action.title),
      subtitle: Text(action.description),
      trailing: Checkbox(
        value: action.status == ActionStatusEnum.done,
        onChanged: (_) {
          context.read<ActionCubit>().updateStatus(action.id);
        },
      ),
    );
  }
}
