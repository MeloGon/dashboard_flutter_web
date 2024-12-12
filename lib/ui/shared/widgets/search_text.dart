import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:flutter/material.dart';

class SearchText extends StatelessWidget {
  const SearchText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: buildboxDecoration(),
      child: TextField(
        decoration: CustomInputs.searchInputDecoration(
            hint: 'Buscar', icon: Icons.search_outlined),
      ),
    );
  }

  BoxDecoration buildboxDecoration() => BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.grey.withOpacity(.1));
}
