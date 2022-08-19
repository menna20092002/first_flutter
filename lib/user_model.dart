class UsersListModel {
  List <UserModel>? UserList;

  UsersListModel.fromJson (Map <String, dynamic > Json){
    UserList =[];
    Json['data'].forEach((element) {
      UserList!.add(UserModel.fromJson(element));

    }) ;
  }
}

class UserModel{
  int? id;
  String? price;
  String? description;
  String? category;
  String? image;

  UserModel.fromJson(Map <String, dynamic > Json){
    this.id = Json['id'];
    this.price = Json['price'];
    this.description = Json['description'];
    this.category = Json['category'];
    this.image = Json['image'];


  }
}
