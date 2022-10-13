import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:restapi/models/rest.dart';
import 'package:restapi/services/remote_services.dart';

//ignore_for_file:prefer_const_constructors

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Rest>? posts;

  var isBool = false;

  @override
  void initState() {
    super.initState();
    getPost();
  }

  getPost() async {
    posts = await RemoteService().getPosts();
    if (posts != null) {
      setState(() {
        isBool = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RestApi"),
      ),
      body: Visibility(
        visible: isBool,
        child: ListView.builder(
            itemCount: posts?.length,
            itemBuilder: (context, index) {
              return Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      posts![index].title,
                      maxLines:2 ,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      posts![index].body?? '',
                      maxLines:2 ,
                      overflow: TextOverflow.ellipsis,
                      // style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              );
            }),
        replacement: const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
