import 'package:flutter/material.dart';

class SearchInput extends StatefulWidget {
  final Function(String) onSearch; // Callback for search query updates
  final String initialQuery;

  const SearchInput({
    super.key,
    required this.onSearch,
    this.initialQuery = '',
  });

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialQuery);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: TextField(
        controller: _controller,
        onChanged: (value) {
          widget.onSearch(value);
        },
        decoration: InputDecoration(
          hintText: 'Search a project',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12), // Rounded input box
            borderSide: BorderSide(color: Colors.grey.shade400, width: 2),
          ),
          alignLabelWithHint: true,
          suffixIconColor: Colors.white,
          // prefixIcon: Icon(Icons.search),
          suffixIcon: _controller.text.isNotEmpty
              ? IconButton(
                  color: Colors.black,
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    setState(() {
                      _controller.clear();
                      widget.onSearch(''); // Reset the query
                    });
                  },
                )
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Theme.of(context)
                            .tabBarTheme
                            .labelColor, // Background color of the button
                        borderRadius:
                            BorderRadius.circular(12), // Rounded corners
                      ),
                      child: Icon(Icons.search)),
                ), // Clear button if there's input
        ),
      ),
    );
  }
}
