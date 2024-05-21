import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  final IconData icon;
  final String label;
  final bool isSelected; // Added `isSelected` for selection state

  const Category({
    super.key,
    required this.icon,
    required this.label,
    this.isSelected = false, // Default to unselected
  });

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  bool _isSelected = false; // Internal state for selection

  @override
  void initState() {
    super.initState();
    _isSelected = widget.isSelected; // Initialize internal state based on prop
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: _isSelected
            ? Colors.green
            : Colors.grey[200], // Color based on selection
        border: Border.all(
          color: Color.fromARGB(255, 221, 221, 221), // Consistent border color
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          Icon(widget.icon),
          const SizedBox(width: 8.0),
          Text(widget.label),
        ],
      ),
    );
  }

  void toggleSelection() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }
}
