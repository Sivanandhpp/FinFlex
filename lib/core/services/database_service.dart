import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:finflex/core/globalvalues/user_data.dart';
import 'package:finflex/core/services/error_handler.dart';
import '../../main.dart';

class DatabaseService {
  ErrorHandler errHandler = ErrorHandler();

  Future<UserData> getDatabaseUser(String uid) async {
    await dbReference.child('users/$uid').once().then(
          (value) => userData.snapshotToClass(uid, value.snapshot),
        );
    return userData;
  }

  setDatabaseUser(
      String uid,
      String name,
      String email,
      String phoneNo,
      String password,
      String accountCreationDate,
      String role,
      String profile,
      String status,
      double balance) {
    final userReferance = dbReference.child('users/$uid');

    userReferance.set({
      'name': name,
      'email': email,
      'phone': phoneNo,
      'password': password,
      'date': accountCreationDate,
      'role': role,
      'profile': profile,
      'status': status,
      'balance': balance
    });
  }

  Future<void> updateDatabaseUser(
      String key, String value, String uid, BuildContext context) async {
    try {
      final userReferance = dbReference.child('users/$uid');

      userReferance.update({key: value});
    } catch (e) {
      errHandler.fromErrorCode(e, context);
    }
  }

  Future<void> addNotification(String title, String content, String url,
      String fileExt, DateTime now, BuildContext context) async {
    try {
      String notiRef =
          "${now.year}${now.month.toString().padLeft(2, "0")}${now.day.toString().padLeft(2, "0")}${now.hour.toString().padLeft(2, "0")}${now.minute.toString().padLeft(2, "0")}${now.second.toString().padLeft(2, "0")}";
      String time =
          "${now.hour.toString().padLeft(2, "0")}:${now.minute.toString().padLeft(2, "0")}:${now.second.toString().padLeft(2, "0")}";
      String date =
          "${now.day.toString().padLeft(2, "0")}/${now.month.toString().padLeft(2, "0")}/${now.year}";

      final notificationReferance = dbReference.child('notifications/$notiRef');
      notificationReferance.set({
        'date': date,
        'time': time,
        'title': title,
        'content': content,
        'url': url,
        'extension': fileExt
      });
    } catch (e) {
      errHandler.fromErrorCode(e, context);
    }
  }

  Future<void> addQuery(
      String subject, String query, BuildContext context) async {
    try {
      DateTime now = DateTime.now();
      String queryRef =
          "${now.year}${now.month.toString().padLeft(2, "0")}${now.day.toString().padLeft(2, "0")}${now.hour.toString().padLeft(2, "0")}${now.minute.toString().padLeft(2, "0")}${now.second.toString().padLeft(2, "0")}";
      String timequery =
          "${now.hour.toString().padLeft(2, "0")}:${now.minute.toString().padLeft(2, "0")}:${now.second.toString().padLeft(2, "0")}";
      String datequery =
          "${now.day.toString().padLeft(2, "0")}/${now.month.toString().padLeft(2, "0")}/${now.year}";
      dbReference.child('queries/$queryRef').set({
        'subject': subject,
        'query': query,
        'uid': userData.userid,
        'name': userData.name,
        // 'date': userData.accountCreationDate,
        'phone': userData.phoneNo,
        'datequery': datequery,
        'timequery': timequery,
      });
    } catch (e) {
      errHandler.fromErrorCode(e, context);
    }
  }

  Future<void> addMoney(
      double amount, String receiverUid, BuildContext context) async {
    try {
      //Main
      DateTime now = DateTime.now();
      final mainTransactionRef = dbReference.child(
          "transactions/${now.year}${now.month.toString().padLeft(2, "0")}${now.day.toString().padLeft(2, "0")}${now.hour.toString().padLeft(2, "0")}${now.minute.toString().padLeft(2, "0")}${now.second.toString().padLeft(2, "0")}");
      String timeAddMoney =
          "${now.hour.toString().padLeft(2, "0")}:${now.minute.toString().padLeft(2, "0")}:${now.second.toString().padLeft(2, "0")}";
      String dateAddMoney =
          "${now.day.toString().padLeft(2, "0")}/${now.month.toString().padLeft(2, "0")}/${now.year}";

      mainTransactionRef.set({
        'name': userData.name,
        'data': dateAddMoney,
        'date': timeAddMoney,
        'receiverUid': receiverUid,
        'senderUid': userData.userid,
        'amount': amount,
      });

      //Sender
      DataSnapshot senderBalance =
          await dbReference.child("users/${userData.userid}/balance").get();
      String senderBalanceDB = senderBalance.value.toString();

      dbReference
          .child('users/${userData.userid}/balance')
          .set(double.parse(senderBalanceDB) - amount);

      final senderTransactionRef =
          dbReference.child('users/${userData.userid}/transactions');
      senderTransactionRef
          .child(
              "${now.year}${now.month.toString().padLeft(2, "0")}${now.day.toString().padLeft(2, "0")}${now.hour.toString().padLeft(2, "0")}${now.minute.toString().padLeft(2, "0")}${now.second.toString().padLeft(2, "0")}")
          .set({
        'name': userData.name,
        'date': dateAddMoney,
        'time': timeAddMoney,
        'sent': true,
        'receiverUid': receiverUid,
        'senderUid': userData.userid,
        'amount': amount,
      });

      //Receiver
      DataSnapshot receiverBalance =
          await dbReference.child("users/$receiverUid/balance").get();
      String receiverBalanceDB = receiverBalance.value.toString();

      dbReference
          .child('users/$receiverUid/balance')
          .set(double.parse(receiverBalanceDB) + amount);

      final receiverTransactionRef =
          dbReference.child('users/$receiverUid/transactions');
      receiverTransactionRef
          .child(
              "${now.year}${now.month.toString().padLeft(2, "0")}${now.day.toString().padLeft(2, "0")}${now.hour.toString().padLeft(2, "0")}${now.minute.toString().padLeft(2, "0")}${now.second.toString().padLeft(2, "0")}")
          .set({
        'name': userData.name,
        'data': dateAddMoney,
        'date': timeAddMoney,
        'sent': false,
        'receiverUid': receiverUid,
        'senderUid': userData.userid,
        'amount': amount,
      });
    } catch (e) {
      errHandler.fromErrorCode(e, context);
    }
  }
}
