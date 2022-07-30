import 'package:flutter/material.dart';

class SeperateListByCategory extends StatelessWidget {
  final Iterable<MapEntry<String, Widget>> children;
  final bool reverse;

  SeperateListByCategory({required this.children, this.reverse = true});

  @override
  Widget build(BuildContext context) {
    Map<String, List<Widget>> newMap = {};
    for (var element in children) {
      newMap[element.key] = [...(newMap[element.key] ?? []), element.value];
    }
    List sortedKeys = newMap.keys.toList();
    sortedKeys.sort((a, b) => DateTime.parse(a).compareTo(DateTime.parse(b)));
    return ListView(
      children: (reverse ? sortedKeys.reversed : sortedKeys).map((a) {
        MapEntry<String, List<Widget>> element =
            MapEntry(a.toString().substring(0, 10), newMap[a] ?? []);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    element.key,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
            ),
            ...element.value,
          ],
        );
      }).toList(),
    );
  }
}
