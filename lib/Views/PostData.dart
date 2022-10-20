import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:memoryz/Models/PostModel.dart';

class PostData extends StatelessWidget {
  const PostData({required this.post});
  final PostModel post;

  @override
  Widget build(BuildContext context) {

    double width = Get.width;
    
    return Scaffold(

      appBar: AppBar(
        title: const Text("Memoryz"),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: SizedBox(
          width: width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  post.title!,
                  style: Get.theme.textTheme.titleLarge,
                ),

                const SizedBox(height: 5,),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      CupertinoIcons.heart_fill,
                      color: Colors.red,
                    ),

                    const SizedBox(width: 10,),
                    
                    Text(
                      "${post.likes!.toString()} J'aimes",
                      style: Get.theme.textTheme.bodyMedium,
                    ),
                  ],
                ),

                const SizedBox(height: 20,),

                Text(
                  post.desc!,
                  style: Get.theme.textTheme.bodyMedium,
                ),

                const SizedBox(height: 10,),

                const Divider(),

                post.pics!.isEmpty 
                ? const Text("")
                : ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: post.pics!.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: width*0.9,
                      height: width,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Card(
                          child: Image.network(
                            post.pics![index],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                    
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}