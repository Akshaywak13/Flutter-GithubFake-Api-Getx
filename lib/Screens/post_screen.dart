import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_facke_api/Controller/post_controller.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  PostController postController=Get.put(PostController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Post Api"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          
          child: Column(
            children: [
              TextField(
                controller: postController.titleController,
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
                controller: postController.descriptionController,
                decoration: InputDecoration(
                  hintText: "Enter user Descriptiion",
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
              // TextField(
              //   controller: postController.titleController,
              //   decoration: InputDecoration(
              //     hintText: "Enter user title",
              //     focusedBorder: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(10),
              //       borderSide: BorderSide(
              //         color: Colors.orange,
              //         width: 2
              //       )
              //     ),
              //     enabledBorder: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(10),
              //       borderSide:BorderSide(
              //         color: Colors.blue,width: 2,
              //       )
              //     )
              //   ),
              // ),
              // TextField(
              //   controller: postController.bodyController,
              //   decoration: InputDecoration(
              //     hintText: "Enter user body",
              //     focusedBorder: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(10),
              //       borderSide: BorderSide(
              //         color: Colors.orange,
              //         width: 2
              //       )
              //     ),
              //     enabledBorder: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(10),
              //       borderSide:BorderSide(
              //         color: Colors.blue,width: 2,
              //       )
              //     )
              //   ),
              // ),
              SizedBox(height: 10,),

              TextButton(onPressed: (){
                postController.postData(context: context,  title: postController.titleController.text, description: postController.descriptionController.text,);
              postController.titleController.clear();
              postController.descriptionController.clear();
              },
               child: Text("Save"))
            ],
          ),
        ),
      ),
    );
  }
}