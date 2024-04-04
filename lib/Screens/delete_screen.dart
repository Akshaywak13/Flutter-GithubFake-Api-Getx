import 'package:flutter/material.dart';
import 'package:github_facke_api/Controller/delete_controller.dart';

class DeleteScreen extends StatefulWidget {
  const DeleteScreen({super.key});

  @override
  State<DeleteScreen> createState() => _DeleteScreenState();
}

class _DeleteScreenState extends State<DeleteScreen> {
  @override
  Widget build(BuildContext context) {
    DeleteController deletecontra=DeleteController();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Text("Delete id "),
        ),
        body: Column(
          children: [
               TextField(
                controller: deletecontra.deleteContra,
                decoration: InputDecoration(
                  hintText: "Enter user description",
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.orange,
                      width: 2
                    )
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:BorderSide(
                      color: Colors.blue,width: 2,
                    )
                  )
                ),
              ),
              SizedBox(height: 20,),
              TextButton(onPressed: (){
                deletecontra.deleteData(context: context, id: deletecontra.deleteContra.text);
              },
              child: Text("delete")),
          ],
        ),
      ),
    );
  }
}