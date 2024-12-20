import 'package:jewellery_app/model/model.dart';
import 'package:jewellery_app/view/widgets/addtocart.dart';
import 'package:jewellery_app/view/screens/loginpage.dart';
import 'package:jewellery_app/view/widgets/your_order.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:convert';
import '../view/widgets/homepage.dart';
import 'package:jewellery_app/view/screens/wishlist.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';

// import 'package:jewellery_app/itemList/productlist.dart';

dynamic database;

Future<void> dbConnection() async {
  databaseFactory = databaseFactoryFfiWeb;
  database = await openDatabase(
    join(await getDatabasesPath(), "jewelDB7.db"),
    version: 1,
    onCreate: (db, version) async {
      await db.execute("""Create table categories(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        type TEXT,
        product TEXT
      )""");
      await db.execute('''
      create table WishList(
        wishId INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        imgs TEXT,
        price INT
      )''');
      await db.execute('''
      create table YourOrder(
        oderNo INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        imgs TEXT,
        qty INT,
        amount INT
      )''');
      await db.execute("""CREATE TABLE signup(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        surname TEXT,
        contactno TEXT,
        email TEXT,
        password TEXT,
        repeatpassword TEXT
      )""");
      await db.execute('''
      create table Cart(
        cartId INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        imgs TEXT,
        price INT
      )''');
    },
  );

  // // insert  listOfCatergoies into table
  // for(int i=0;i<listofCategories.length;i++){
  //   insertCategories(listofCategories[i]);
  // }

  final localDB = await database;

  //fetch data from categories table
  List getList = await localDB.query('categories');

  //get data from WishList table
  wishList = await getAllWishes();
  // print(wishList);

  //get data from YourOrder table
  orderList = await getAllOrders();
  // print(orderList);

  //get data from signUp table
  signlist = await getSignUpData();
  // print(signlist);

  //get data from cart table
  cartList = await getAllCarts();

  List<Map<String, dynamic>> productList = [];

  //function to convert string data in list bcz we stored the product entry as TEXT in table
  List<Map<String, dynamic>> convertStringToList(String stringOfList) {
    List<dynamic> decodedList = jsonDecode(stringOfList);
    return List<Map<String, dynamic>>.from(
        decodedList.map((dynamic item) => item as Map<String, dynamic>));
  }

  for (int i = 0; i < getList.length; i++) {
    String stringOfList = getList[i]['product'];
    List<Map<String, dynamic>> dummy = convertStringToList(stringOfList);
    productList.add({
      'id': getList[i]['id'],
      'type': getList[i]['type'],
      'product': dummy,
    });
  }
  categoriesList = productList;
//  print(categoriesList);
}

//insert in categories table
Future<void> insertCategories(Map<String, dynamic> obj) async {
  final localDB = await database;

  await localDB.insert('categories', obj,
      conflictAlgorithm: ConflictAlgorithm.replace);
}

//====================WishList Table=====================
//insert in WishList table
Future<void> insertWish(WishListModel obj) async {
  final localDB = await database;
  // print("insert");
  await localDB.insert('WishList', obj.wishListMap(),
      conflictAlgorithm: ConflictAlgorithm.replace);
  wishList = await getAllWishes();
}

//fetch data from WishList table
Future<List<WishListModel>> getAllWishes() async {
  final localDB = await database;
  List<Map<String, dynamic>> list = await localDB.query('WishList');

  return List.generate(list.length, (idx) {
    return WishListModel(
        wishId: list[idx]['wishId'],
        name: list[idx]['name'],
        imgs: list[idx]['imgs'],
        price: list[idx]['price']);
  });
}

//delete data from WishList table
Future<void> deleteWish(WishListModel obj) async {
  final localDB = await database;
  await localDB.delete('WishList', where: 'wishId=?', whereArgs: [obj.wishId]);
  wishList = await getAllWishes();
}

//=========================YourOrder Table=====================================
//insert in YourOrder Table
Future<void> insertYourOrder(YourOrderModel obj) async {
  final localDB = await database;
//  print("insert");
  await localDB.insert('YourOrder', obj.yourOrderMap(),
      conflictAlgorithm: ConflictAlgorithm.replace);
  orderList = await getAllOrders();
}

//fetch data from YourOrder table
Future<List<YourOrderModel>> getAllOrders() async {
  final localDB = await database;
  List<Map<String, dynamic>> list = await localDB.query('YourOrder');

  return List.generate(list.length, (idx) {
    return YourOrderModel(
        orderNo: list[idx]['orderNo'],
        name: list[idx]['name'],
        imgs: list[idx]['imgs'],
        qty: list[idx]['qty'],
        amount: list[idx]['amount']);
  });
}

//======================signup table================
//insert data in signup table
Future<void> insertSignupData(ModelClass obj) async {
  final localDb = await database;

  await localDb.insert('signup', obj.cardMap(),
      conflictAlgorithm: ConflictAlgorithm.replace);
  signlist = await getSignUpData();
}

//fetchData from signup table
Future<List<ModelClass>> getSignUpData() async {
  final localDb = await database;

  List<Map<String, dynamic>> signuplist = await localDb.query("signup");
  return List.generate(signuplist.length, (i) {
    return ModelClass(
      id: signuplist[i]['id'],
      name: signuplist[i]['name'],
      surname: signuplist[i]['surname'],
      contactno: signuplist[i]['contactno'],
      email: signuplist[i]['email'],
      password: signuplist[i]['password'],
      repeatpassword: signuplist[i]['repeatpassword'],
    );
  });
}

//===================Cart Table=====================
//insert data in Cart table
Future<void> insertCart(AddToCartModel obj) async {
  final localDB = await database;

  await localDB.insert("Cart", obj.addToCartMap(),
      conflictAlgorithm: ConflictAlgorithm.replace);
  cartList = await getAllCarts();
}

//fetch data from Cart Table
Future<List<AddToCartModel>> getAllCarts() async {
  final localDB = await database;
  List<Map<String, dynamic>> list = await localDB.query("Cart");

  return List.generate(list.length, (idx) {
    return AddToCartModel(
        cartId: list[idx]['cartId'],
        name: list[idx]['name'],
        imgs: list[idx]['imgs'],
        price: list[idx]['price']);
  });
}

//delete data from cart
Future<void> deleteCart(AddToCartModel obj) async {
  final localDB = await database;

  await localDB.delete('Cart', where: "cartId=?", whereArgs: [obj.cartId]);
  cartList = await getAllCarts();
}
