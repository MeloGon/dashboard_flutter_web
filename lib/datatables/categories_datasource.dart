import 'package:admin_dashboard/models/category.dart';
import 'package:admin_dashboard/providers/categories_provider.dart';
import 'package:admin_dashboard/ui/modals/category_modal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoriesDatasource extends DataTableSource {
  final List<Category> categorias;
  final BuildContext context;

  CategoriesDatasource({required this.categorias, required this.context});
  @override
  DataRow? getRow(int index) {
    final category = categorias[index];
    return DataRow.byIndex(index: index, cells: [
      DataCell(Text('${category.id}')),
      DataCell(Text('${category.nombre}')),
      DataCell(Text('${category.usuario?.nombre}')),
      DataCell(Row(
        children: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                    constraints: BoxConstraints(
                        maxWidth: MediaQuery.sizeOf(context).width,
                        maxHeight: MediaQuery.sizeOf(context).height),
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (_) => CategoryModal(
                          category: category,
                        ));
              },
              icon: const Icon(Icons.edit_outlined)),
          IconButton(
              onPressed: () {
                final dialog = AlertDialog(
                  title: const Text('Estas seguro de borrarlo ?'),
                  content: Text(
                    'Borrar definitivamente ${category.nombre}',
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('No')),
                    TextButton(
                        onPressed: () async {
                          await Provider.of<CategoriesProvider>(context,
                                  listen: false)
                              .deleteCategory(category.id!);

                          Navigator.pop(context);
                        },
                        child: const Text('Si,borrar'))
                  ],
                );
                showDialog(context: context, builder: (_) => dialog);
              },
              icon: Icon(
                Icons.delete_outline,
                color: Colors.red.withOpacity(.8),
              )),
        ],
      )),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => categorias.length;

  @override
  int get selectedRowCount => 0;
}
