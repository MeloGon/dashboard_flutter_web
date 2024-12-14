import 'package:admin_dashboard/datatables/categories_datasource.dart';
import 'package:admin_dashboard/providers/categories_provider.dart';
import 'package:admin_dashboard/ui/buttons/custom_icon_button.dart';
import 'package:admin_dashboard/ui/cards/white_card.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:admin_dashboard/ui/modals/category_modal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({super.key});

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;

  @override
  void initState() {
    Provider.of<CategoriesProvider>(context, listen: false).getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final categorias =
        Provider.of<CategoriesProvider>(context, listen: true).categories;
    final size = MediaQuery.sizeOf(context);
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        Text(
          'Categorias',
          style: CustomLabels.h1,
        ),
        const SizedBox(height: 10),
        WhiteCard(
          title: 'Categorias titulo',
          child: PaginatedDataTable(
            showEmptyRows: false,
            columns: const [
              DataColumn(label: Text('ID')),
              DataColumn(label: Text('Categoria')),
              DataColumn(label: Text('Creado Por')),
              DataColumn(label: Text('Acciones')),
            ],
            source: CategoriesDatasource(
                categorias: categorias ?? [], context: context),
            header: const Text('Categorias disponibles', maxLines: 2),
            onRowsPerPageChanged: (value) {
              _rowsPerPage = value ?? 10;
              setState(() {});
            },
            rowsPerPage: _rowsPerPage,
            actions: [
              CustomIconButton(
                  onPressed: () {
                    showModalBottomSheet(
                        constraints: BoxConstraints(
                            maxWidth: size.width, maxHeight: size.height),
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (_) => const CategoryModal(
                              category: null,
                            ));
                  },
                  text: 'Crear',
                  icon: Icons.add_outlined)
            ],
          ),
        ),
      ],
    );
  }
}
