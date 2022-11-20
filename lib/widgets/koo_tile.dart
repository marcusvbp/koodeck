import 'package:flutter/material.dart';

class KooTile extends StatelessWidget {
  final Widget child;
  const KooTile({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.blueGrey.shade100),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(5),
      clipBehavior: Clip.antiAlias,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 10),
                child: CircleAvatar(
                  child: Icon(Icons.person),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Marcus Vinícius',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.blueGrey),
                    ),
                    Text(
                      '@marcusvbp',
                      style: TextStyle(
                          color: Colors.blueGrey.shade300, fontSize: 12),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.more_vert,
                ),
                iconSize: 16,
              )
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: child,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.all(5),
            clipBehavior: Clip.antiAlias,
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: CircleAvatar(
                      child: Icon(
                        Icons.person,
                        size: 10,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    'Write your comment...',
                    style: TextStyle(
                      color: Colors.grey.shade400,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.add_comment),
                  color: Colors.blueGrey,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.refresh),
                  color: Colors.blueGrey,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.share),
                  color: Colors.blueGrey,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.more_horiz),
                  color: Colors.blueGrey,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
