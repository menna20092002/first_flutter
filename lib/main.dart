import 'package:dio/dio.dart';
import 'package:first_flutter/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Dio dio = Dio();
  String url = 'https://fakestoreapi.com/products';

  UsersListModel

  ?

  usersListModel

  ;

  Future <UsersListModel> getData() async {
    Response response = await dio.get(url);
    usersListModel = UsersListModel.fromJson(response.data);
    return usersListModel
    !;


  }

  @override
  void initState() {
    super.initState();
    getData();
  }


  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      appBar: AppBar(
        title: const Text('API'),
      ),

      body: FutureBuilder<UsersListModel>(
        future: getData(),
        builder: ((context, snapshot) {
          return snapshot.hasData
              ? ListView.builder(
            itemCount: usersListModel!.UserList!.length,
            itemBuilder: (context, index) {
              return ListTile(
                  trailing:
                  Text(usersListModel!.UserList![index].id.toString()),leading
                  :
              CircleAvatar
              (radius:30,
              backgroundImage:
              NetworkImage
              (
              usersListModel!.UserList![index].image!
              ),
              ),

              subtitle
                  :
              Text
              (
              usersListModel!.UserList![index].price!),
              title:
              Text
              ('${usersListModel!.UserList![index].description}${usersListModel!.UserList![index].category}'
              )
              ,
              );

            },

          )
              : snapshot.hasError
              ? Text(' Sorry, Something went wrong')
              : Center(child: CupertinoActivityIndicator());
        }),
      ),


    );
  }
}
