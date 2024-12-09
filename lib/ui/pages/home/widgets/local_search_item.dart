import 'package:flutter/material.dart';
import 'package:local_search_app/data/model/location.dart';
import 'package:local_search_app/ui/pages/detail/detail_page.dart';

class LocalSearchItem extends StatelessWidget {
  const LocalSearchItem({
    super.key,
    required this.context,
    required this.item,
  });

  final BuildContext context;
  final Location item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: GestureDetector(
        onTap: () {
          if (item.link.startsWith('https')) {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return DetailPage(item);
              },
            ));
          }
        },
        child: Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[400]!),
              borderRadius: BorderRadius.circular(18),
              color: Colors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.replacedTitle(),
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 2),
              Text(item.category),
              Text(item.roadAddress),
            ],
          ),
        ),
      ),
    );
  }
}
