import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:telegramflutter/Screen/custom_widget.dart';
import '../user_provider/user_notifier.dart';
import '../user_provider/user_state.dart';

class MyHomeScrren extends StatelessWidget {
  const MyHomeScrren({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[400],
          title: Row(
            children: [
              Text("Telegram",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),),
              SizedBox(
                width: 50,
              ),
              Icon(Icons.local_post_office,
                color: Colors.orange,),
              SizedBox(
                width: 10,
              ),

              Text("Load User Details",
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.orange
                ),)
            ],
          )
      ),
      backgroundColor: Colors.grey[300],
      body: Consumer(
          builder: (context,ref,child) {
            final state = ref.watch(userProvider);
            if(state.userStatus==UserStatus.loading){
              return CircularProgressIndicator();
            }
            if(state.userStatus==UserStatus.loaded){
              return ListView.builder(
                itemCount: state.userModel!.posts!.length,
                itemBuilder: (context,index){
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: CustomWidget(
                      id: state.userModel!.posts![index].id ?? 0,
                     title:state.userModel!.posts![index].title ?? "",
                      body:state.userModel!.posts![index].body ?? "",
                      userId:state.userModel!.posts![index].userId ?? 0,
                      tags:state.userModel!.posts![index].tags ?? [],
                      reaction:state.userModel!.posts![index].reactions ?? 0,
                    ),
                  );
                  }
                  );
            }
            if(state.userStatus==UserStatus.error){
              return Text(state.error!);

            }
            return SizedBox();
          }
      ),
    );
  }
}
