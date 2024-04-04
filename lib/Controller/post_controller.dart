import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:github_facke_api/Api/api_manager.dart';

class PostController extends GetxController{

TextEditingController titleController = TextEditingController();
TextEditingController descriptionController = TextEditingController();
  final isLoading=false.obs;
  bool get _isLoading =>isLoading.value;

  final isError=''.obs;
  String get _isError=>isError.value;

  ApiBase apiBase=ApiBase();

  Future<void> postData ( {required BuildContext context,required String title,required String description,}) async{
    var parameters={
      "title":title,
      "description":description,
      "date":DateTime.now().toString(),
    };
await apiBase.post("https://65e8133d53d564627a8fc5db.mockapi.io/NoteApp",parameters,

  (data) {
    isLoading(false);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Successfull")));

  },
   (error){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(isError.value)));
   });
  }
}