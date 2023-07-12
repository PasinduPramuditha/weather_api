import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onSubmitted;

  const Search({
    Key? key,
    required this.controller,
    required this.onSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          // border: Border.all(color: Colors.blue),
          borderRadius: BorderRadius.circular(0),
          gradient: const LinearGradient(
            colors: [
              Color.fromARGB(139, 255, 255, 255),
              Color.fromARGB(0, 255, 255, 255),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: controller,
          decoration: const InputDecoration(
              hintText: 'Search here..',
              hintStyle: TextStyle(),
              prefixIcon: Icon(
                Icons.search,
              ),
              border: OutlineInputBorder(
                  // style when not clicked

                  ),
              focusedBorder: OutlineInputBorder(
                // style when clicked
                borderRadius: BorderRadius.all(Radius.circular(10)),
              )),
          onSubmitted: onSubmitted,
          onTapOutside: (event) => FocusScope.of(context).unfocus(),
        ),
      ),
    );
  }
}
