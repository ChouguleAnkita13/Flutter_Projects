class WishListModel{
  int? wishId;
  final String name;
  final String imgs;
  final int price;

  WishListModel({this.wishId,required this.name,required this.imgs,required this.price});

  Map<String,dynamic> wishListMap(){
    return {
      'name':name,
      'imgs':imgs,
      'price':price
    };
  }
    @override
  String toString(){
    return '{wishId:$wishId,name:$name,imgs:$imgs,price:$price}';
  }
}
//==================================
class AddToCartModel{
  int? cartId;
  final String name;
  final String imgs;
  final int price;

  AddToCartModel({this.cartId,required this.name,required this.imgs,required this.price});
   Map<String,dynamic> addToCartMap(){
    return {
      'name':name,
      'imgs':imgs,
      'price':price
    };
  }
    @override
  String toString(){
    return '{wishId:$cartId,name:$name,imgs:$imgs,price:$price}';
  }

}

class YourOrderModel{
  int? orderNo;
  final String name;
  final String imgs;
  final int qty;
  final int amount;

  YourOrderModel({this.orderNo,required this.name,required this.imgs,required this.qty,required this.amount});

  Map<String,dynamic> yourOrderMap(){
    return {
      'name':name,
      'imgs':imgs,
      'qty':qty,
      'amount':amount
    };
  }
  @override
  String toString(){
    return '{orderNo:$orderNo,name:$name,imgs:$imgs,qty:$qty,amount:$amount}';
  }
}
//==========================
class ModelClass{
  int? id;
  String name;
  String surname;
  String contactno;
  String email;
  String password;
  String repeatpassword;

  ModelClass({
    this.id,
    required this.name,
    required this.surname,
    required this.contactno,
    required this.email,
    required this.password,
    required this.repeatpassword
  });

Map<String,dynamic> cardMap(){
    return {
      'id':id,
      'name':name,
      'surname':surname,
      'contactno':contactno,
      'email':email,
      'password':password,
      'repeatpassword':repeatpassword
    };
 }

 @override
  String toString(){
    return '''{'id':$id,
      'name':$name,
      'surname':$surname,
      'contactno':$contactno,
      'email':$email,
      'password':$password,
      'repeatpassword':$repeatpassword}''';
  }
}