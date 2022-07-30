import 'package:flutter/material.dart';

class SeperateListByCategory extends StatelessWidget {
  final Iterable<MapEntry<String, Widget>> children;

  SeperateListByCategory({required this.children});

  @override
  Widget build(BuildContext context) {
    Map<String, List<Widget>> newChildren = {};
    for (var element in children) {
      newChildren[element.key] = [
        ...(newChildren[element.key] ?? []),
        element.value
      ];
    }

    return ListView(
      children: newChildren.entries
          .map(
            (element) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        element.key,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(fontWeight: FontWeight.bold,),
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
            ),
          )
          .toList(),
    );
  }
}
