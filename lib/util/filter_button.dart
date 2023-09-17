import 'package:flutter/material.dart';

class FilterButton extends StatelessWidget {
  final String title;
  final Color color;
  final VoidCallback onPressed;

  const FilterButton({
    required this.title,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: color,
        onPrimary: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      onPressed: onPressed,
      child: Text(title),
    );
  }
}
