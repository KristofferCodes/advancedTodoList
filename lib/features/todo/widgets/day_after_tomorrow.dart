import 'package:advanced_todo_list/features/todo/controllers/todo/todo_provider.dart';
import 'package:advanced_todo_list/features/todo/widgets/todo_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/utils/constants.dart';
import '../../../common/widgets/expansion_tile.dart';
import '../controllers/xpansion_provider.dart';

class DayAfterTomorrowList extends ConsumerWidget {
  const DayAfterTomorrowList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoStateProvider);
    var color = ref.read(todoStateProvider.notifier).getRandomColor();
    String dayAfterTomorrow =
        ref.read(todoStateProvider.notifier).dayAfterTomorrow();

    var tomorrowTasks =
        todos.where((element) => element.date!.contains(dayAfterTomorrow));
    return xpansionTile(
        text: DateTime.now()
            .add(const Duration(days: 2))
            .toString()
            .substring(5, 10),
        text2: "Tomorrow's task as shown here",
        onExpansionChanged: (bool expanded) {
          ref.read(xpansionStateProvider.notifier).setStart(!expanded);
        },
        trailing: ref.watch(xpansionStateProvider)
            ? const Icon(
                AntDesign.circledown,
                color: AppConst.kLight,
              )
            : const Icon(
                AntDesign.closecircleo,
                color: AppConst.kBlueLight,
              ),
        children: [
          for (final todo in tomorrowTasks)
            TodoTile(
              title: todo.title,
              description: todo.description,
              color: color,
              start: todo.startTime,
              end: todo.startTime,
              delete: () {
                ref.read(todoStateProvider.notifier).deleteTodo(todo.id ?? 0);
              },
              editWidget: GestureDetector(
                child: const Icon(MaterialCommunityIcons.circle_edit_outline),
              ),
              switcher: const SizedBox.shrink(),
            )
        ]);
  }
}
