import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../manager/search_cubit/search_cubit.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return TextField(
      controller: controller,
      onChanged: (searchText){
        if (searchText.isNotEmpty) {
          // Trigger the search in SearchCubit when user types
          context.read<SearchCubit>().getSearchData(searchText);
        } else {
          // Clear the search results when the user deletes the text
          context.read<SearchCubit>().clearSearchResults();
        }
      },
      cursorColor: Colors.white,
      decoration: buildInputDecoration(),

    );
  }

  InputDecoration buildInputDecoration() {
    return InputDecoration(
      hintText: 'Search',
      hintStyle: const TextStyle(
        color: Colors.white,
      ),
      suffixIcon: buildIconButton(),
      focusedBorder: buildOutlineInputBorder(),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  IconButton buildIconButton() {
    return IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.search,
          color: Colors.blue,
        ),
      );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Colors.white,
        ),
      );
  }
}
