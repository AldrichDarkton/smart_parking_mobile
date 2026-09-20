import 'package:flutter/material.dart';

class SearchBox extends StatefulWidget {
  const SearchBox({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SearchBoxState();
  }
}

class _SearchBoxState extends State<SearchBox> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 10,
      children: [
        TextField(
          controller: _searchController,
          onChanged: (value) {
            setState(() {});
          },
          decoration: InputDecoration(
            hintText: 'Search plate number...',
            filled: true,
            fillColor: Colors.white,
            prefixIcon: Icon(
              Icons.search,
              color: Theme.of(context).colorScheme.primary,
            ),

            contentPadding: const EdgeInsets.symmetric(
              vertical: 6,
              horizontal: 12,
            ),

            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.primary,
                width: 1,
              ),
            ),

            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.primary,
                width: 1,
              ),
            ),
          ),
        ),

        AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          reverseDuration: const Duration(milliseconds: 200),
          transitionBuilder: (child, animation) {
            return FadeTransition(
              opacity: animation,
              child: SizeTransition(
                sizeFactor: animation,
                alignment: AlignmentGeometry.directional(0, -1),
                child: child,
              ),
            );
          },
          child: _searchController.text.isNotEmpty
              ? Container(
                  key: const ValueKey('search-result'),
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Theme.of(context).colorScheme.primary,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Text('Search result goes here'),
                )
              : const SizedBox(key: ValueKey('empty-result')),
        ),

        // if (_searchController.text.isNotEmpty)
        //   Container(
        //     width: double.infinity,
        //     padding: const EdgeInsets.all(12),
        //     decoration: BoxDecoration(
        //       color: Colors.white,
        //       border: Border.all(
        //         color: Theme.of(context).colorScheme.primary,
        //         width: 1,
        //       ),
        //       borderRadius: BorderRadius.circular(6),
        //     ),
        //     child: const Text('Search result goes here'),
        //   ),
      ],
    );
  }
}
