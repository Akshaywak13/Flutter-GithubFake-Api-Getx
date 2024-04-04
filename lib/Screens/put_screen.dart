import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_facke_api/Controller/delete_controller.dart';
import 'package:github_facke_api/Controller/put_contoller.dart';
import 'package:github_facke_api/Screens/delete_screen.dart';

class PutScreen extends StatefulWidget {
  const PutScreen({super.key});

  @override
  State<PutScreen> createState() => _PutScreenState();
}

class _PutScreenState extends State<PutScreen> {
  PutController putController =Get.put(PutController());
  DeleteController deleteController=Get.put(DeleteController());
  @override
  Widget build(BuildContext context) {

    return  SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text("Put api"),
        ),
        body: Column(
          children: [
              TextField(
                controller: putController.iddetalisController,
                decoration: InputDecoration(
                  hintText: "Enter user id",
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
            TextField(
                controller: putController.titleDetailController,
                decoration: InputDecoration(
                  hintText: "Enter user Titel",
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
              TextField(
                controller: putController.descriptionDetailsController,
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
                putController.putData(context: context, id:putController.iddetalisController.text, title:putController.titleDetailController.text, description: putController.descriptionDetailsController.text);
              },
              child: Text("Save")),
              SizedBox(height: 20,),
              TextButton(onPressed: (){
                Get.to(()=>DeleteScreen());
              },
               child: Text("Delete"))
          ],
        ),
      ),
    );
  }
}