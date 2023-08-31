import 'package:advanced_todo_list/features/todo/widgets/todo_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../controllers/todo/todo_provider.dart';

class TodaysTask extends ConsumerWidget {
  const TodaysTask({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listData = ref.watch(todoStateProvider);
    String today = ref.read(todoStateProvider.notifier).getToday();
    var todayList = listData
        .where((element) =>
            element.isCompleted == 0 && element.date!.contains(today))
        .toList();

    return ListView.builder(
        itemCount: todayList.length,
        itemBuilder: (context, index) {
          final data = todayList[index];
          bool isCompleted =
              ref.read(todoStateProvider.notifier).getStatus(data);
          dynamic color = ref.read(todoStateProvider.notifier).getRandomColor();
          return TodoTile(
            delete: () {
              ref.read(todoStateProvider.notifier).deleteTodo(data.id ?? 0);
            },
            editWidget: GestureDetector(
              onTap: () {},
              child: Icon(MaterialCommunityIcons.circle_edit_outline),
            ),
            title: data.title,
            description: data.description,
            start: data.startTime,
            end: data.endTime,
            color: color,
            switcher: Switch(value: isCompleted, onChanged: (value) {}),
          );
        });
  }
}
