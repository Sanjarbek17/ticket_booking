import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController searchController;
  final Function(String)? onChanged;
  const CustomSearchBar({
    super.key,
    required this.searchController,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 33.0),
      child: SizedBox(
        height: 40,
        child: TextField(
          cursorHeight: 14,
          controller: searchController,
          onChanged: onChanged,
          textAlignVertical: TextAlignVertical.bottom,
          style: const TextStyle(fontSize: 12.0, fontWeight: FontWeight.w500),
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            hintText: 'Search',
            suffixIcon: const Icon(Icons.search, color: Colors.black),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(16.0), borderSide: BorderSide.none),
          ),
        ),
      ),
    );
  }
}
