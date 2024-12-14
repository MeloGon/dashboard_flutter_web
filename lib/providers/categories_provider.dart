import 'package:admin_dashboard/api/cafe_api.dart';
import 'package:admin_dashboard/models/category.dart';
import 'package:admin_dashboard/models/http/categories_response.dart';
import 'package:admin_dashboard/services/notifications_service.dart';
import 'package:flutter/material.dart';

class CategoriesProvider extends ChangeNotifier {
  List<Category>? categories = [];

  getCategories() async {
    await CafeApi.httpGet('/categorias').then(
      (json) {
        final categoriesResp = CategoriesResponse.fromJson(json);
        categories = [...categoriesResp.categorias!];
      },
    ).catchError((e) {});
    // final resp = await CafeApi.httpGet('/categorias');
    // final categoriesResp = CategoriesResponse.fromJson(resp);
    // categories = [...categoriesResp.categorias!];
    notifyListeners();
  }

  Future newCategory(String name) async {
    final data = {'nombre': name};

    try {
      await CafeApi.httpPost('/categorias', data).then((json) {
        final newCategory = Category.fromJson(json);
        categories?.add(newCategory);
        notifyListeners();
      }).catchError((onError) {
        NotificationsService.showSnackbarError(
            'No se pudo guardar la categoria');
      });
    } catch (e) {
      throw 'Error al crear categoria';
    }
  }

  Future updateCategory(String id, String name) async {
    final data = {'nombre': name};

    try {
      await CafeApi.httpPut('/categorias/$id', data).then((json) {
        getCategories();
        //para no consumir el api del get se podria hacer lo siguiente
        // categories = categories?.map((categoria) {
        //   if (categoria.id != id) return categoria;
        //   categoria.nombre = name;
        //   return categoria;
        // }).toList();
      }).catchError((onError) {
        NotificationsService.showSnackbarError(
            'No se pudo actualizar la categoria');
      });
    } catch (e) {
      throw 'Error al actualizar categoria';
    }
  }

  Future deleteCategory(String id) async {
    //Future<bool> deleteCategory(String id) async {
    // try {
    //   await CafeApi.httpDelete('/categorias/$id', {})
    //       .then((json) {
    //         getCategories();
    //       })
    //       .whenComplete(() => true)
    //       .catchError((onError) {});
    // } catch (e) {
    //   print(e);
    //   print('Error al borrar categoria');
    //   return false;
    // }
    // return false;

    try {
      await CafeApi.httpDelete('/categorias/$id', {});
      categories?.removeWhere((categoria) => categoria.id == id);
      notifyListeners();
    } catch (e) {
      print(e);
      print('Error al borrar categoria');
    }
  }
}
