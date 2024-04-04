import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_facke_api/Api/api_manager.dart';
import 'package:github_facke_api/Models/github_model.dart';

class GitController extends GetxController{

  final isLoading=false.obs;
  bool get  _isLoading => isLoading.value;

  final isError=''.obs;
  String get _isError => isError.value;

  ApiBase apiBase=ApiBase();

  final _githubModel = <GithubModel>[].obs; // Use a list for GithubModel
  List<GithubModel> get githubModel => _githubModel;

  Future<void> getData({required BuildContext context}) async {
    isLoading(true);

    await apiBase.get("https://api.github.com/users",
        (data) {
      isLoading(false);
      print("API Response:$data");
      _githubModel.assignAll((data as List)
          .map((item) => GithubModel.fromJson(item))
          .toList()); // Corrected data mapping
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.green,
          content: Text("Successful"),
        ),
      );
    }, (error) {
      isLoading(false);
      print("API Error: $error");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text("Error"),
        ),
      );
    });
  }
}