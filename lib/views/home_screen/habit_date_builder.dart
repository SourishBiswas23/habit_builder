import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HabitDateBuilder extends StatelessWidget {
  const HabitDateBuilder({super.key, required this.scrollController});
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    DateTime currentTime = DateTime.now().add(const Duration(days: 1));
    return Container(
      padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
      width: double.infinity,
      height: 85,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'HABITS',
            style: theme.textTheme.bodyMedium,
          ),
          const SizedBox(width: 30),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              controller: scrollController,
              itemCount: 7,
              itemBuilder: (context, index) {
                currentTime = currentTime.subtract(const Duration(days: 1));
                return Container(
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        DateFormat('E').format(currentTime),
                        style: theme.textTheme.bodySmall,
                      ),
                      Text(
                        DateFormat('dd').format(currentTime),
                        style: theme.textTheme.headlineSmall
                            ?.copyWith(fontSize: 20),
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
