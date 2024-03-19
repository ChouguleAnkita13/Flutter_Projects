import 'package:jewellery_app/model/model.dart';
import 'package:jewellery_app/screens/loginpage.dart';
import 'package:jewellery_app/screens/your_order.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:convert';
import '../screens/homepage.dart';
import 'package:jewellery_app/screens/wishlist.dart';

// import 'package:jewellery_app/itemList/productlist.dart';

dynamic database;

Future<void> dbConnection() async {
  database = await openDatabase(
    join(await getDatabasesPath(), "jewelDB6.db"),
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
    },
  );

  // insert  listOfCatergoies into table
  // for(int i=0;i<listofCategories.length;i++){
  //   insertCategories(listofCategories[i]);
  // }

  final localDB = await database;

  //fetch data from categories table
  List getList = await localDB.query('categories');

  //fetch data from WishList table
  wishList = await getAllWishes();
  // print(wishList);

  ////fetch data from YourOrder table
  orderList = await getAllOrders();
  // print(orderList);

  //fetch data from signUp table
  signlist = await getSignUpData();
  // print(signlist);

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

//=========================YourOrder Table
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
Future<void> insertSignupData(ModelClass obj) async {
  final localDb = await database;

  await localDb.insert('signup', obj.cardMap(),
      conflictAlgorithm: ConflictAlgorithm.replace);
  signlist = await getSignUpData();
}

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
