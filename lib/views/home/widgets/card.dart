import 'package:flutter/material.dart';

class ListCard extends StatelessWidget {
  const ListCard({
    Key? key,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.user,
    required this.starCount,
  }) : super(key: key);
  final String title;
  final String description;
  final String imageUrl;
  final String user;
  final String starCount;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          backgroundColor: Colors.amberAccent,
          backgroundImage: NetworkImage(imageUrl),
        ),
        title: Text(
          title,
        ),
        subtitle: Text(
          description,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
        trailing: Column(
          children: [
            Text(starCount),
            const Icon(
              Icons.star,
              color: Colors.orangeAccent,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 6,
              child: Text(
                user,
                overflow: TextOverflow.fade,
                maxLines: 1,
              ),
            )
          ],
        ),
      ),
    );
  }
}
