import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_facke_api/Api/api_manager.dart';

class DeleteController extends GetxController{
  TextEditingController deleteContra=TextEditingController();

final isLoading =false.obs;
bool get _isLoading => isLoading.value;

final isError=''.obs;
String  get _isError=>isError.value;

ApiBase apiBase=ApiBase();

Future<void> deleteData({required BuildContext context , required String id})async{

  await apiBase.delete("https://65e8133d53d564627a8fc5db.mockapi.io/NoteApp/$id", 
  (data) {
    isLoading(false);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Successfull")));
  }, 
  (error) {
    isLoading(false);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(isError.value)));
  });
}
}