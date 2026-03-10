import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  CategoryItem({super.key});

  final List<String> categories = [
    "Furniture",
    "Medicine",
    "Fashion",
    "Baby",
    "Books",
    "Gaming",
    "Sport",
    "Electronics",
  ];

  IconData getCategoryIcon(String name) {
    switch (name) {
      case "Furniture":
        return Icons.chair;
      case "Medicine":
        return Icons.medication;
      case "Fashion":
        return Icons.checkroom;
      case "Baby":
        return Icons.child_care;
      case "Books":
        return Icons.menu_book;
      case "Gaming":
        return Icons.sports_esports;
      case "Sport":
        return Icons.sports_soccer;
      case "Electronics":
        return Icons.devices;
      default:
        return Icons.category;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: categories.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.8,
      ),
      itemBuilder: (context, index) {
        final category = categories[index];

        return InkWell(
          onTap: () {
            print(category);
          },
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade50,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(
                  getCategoryIcon(category),
                  color: Colors.deepPurple,
                  size: 30,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                category,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
