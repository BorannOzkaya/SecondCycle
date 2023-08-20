import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  final IconData icon;
  final String title;

  const CategoryWidget({
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          // Kategoriye tıklama işlemleri burada yapılabilir
        },
        child: Column(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Icon(icon, size: 30),
            ),
            SizedBox(height: 4),
            Text(title),
          ],
        ),
      ),
    );
  }
}
