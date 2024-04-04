import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_facke_api/Controller/get_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GitController controller = Get.put(GitController());

  @override
  void initState() {
    controller.getData(context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("GitHub API"),
      ),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: controller.githubModel.length,
                itemBuilder: (context, index) {
                  final user = controller.githubModel[index];
                  return Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(user.avatarUrl ?? ""),
                          ),
                          title: Text("ID: ${user.id}"),
                          subtitle: Text("Login: ${user.login}"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Node ID: ${user.nodeId}"),
                        ),
                        // Add more fields as needed
                      ],
                    ),
                  );
                },
              ),
      ),

    );
  }
}
