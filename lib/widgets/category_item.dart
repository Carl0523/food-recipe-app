import 'package:flutter/material.dart';
import 'package:meal_app/models/category.dart';

class CategoryItem extends StatelessWidget {
  final Category category;
  final void Function() onSelectCategory;

  const CategoryItem({
    super.key,
    required this.category,
    required this.onSelectCategory,
  });

  @override
  Widget build(context) {
    /// Inkwell widget make any widget tappable, in this case, the container
    return InkWell(
      onTap: onSelectCategory,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        // The shadow, border shape, and color decoration
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 10,
              offset: const Offset(0, 5), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          children: [
            // The image of the category
            ClipRRect(
              // Clip the topleft and topright corner
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              child: category.image,
            ),

            // The space between the title and category
            const SizedBox(
              height: 10,
            ),

            // The title of the category
            Text(
              category.title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
