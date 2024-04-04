import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_facke_api/Api/api_manager.dart';

class PutController extends GetxController {
TextEditingController iddetalisController = TextEditingController();
TextEditingController titleDetailController = TextEditingController();
TextEditingController descriptionDetailsController = TextEditingController();


  final isLoading = false.obs;
  bool get _isLoading => isLoading.value;

  final isError = ''.obs;
  String get _isError => isError.value;

  ApiBase apiBase = ApiBase();

  Future<void> putData(
      {required BuildContext context,
      required String id,
      required String title,
      required String description}) async {
    var parameters = {"title": title, "description": description};
    await apiBase.put(
        "https://65e8133d53d564627a8fc5db.mockapi.io/NoteApp/$id", parameters,
        (data) {
      isLoading(false);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Update Successfull"),
        backgroundColor: Colors.green,
      ));
    }, (error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(isError.value),
        backgroundColor: Colors.red,
      ));
    });
  }
}
