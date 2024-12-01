
import 'package:finflex/core/services/database_service.dart';
import 'package:finflex/core/services/sharedpref_service.dart';

class UserData {
  late String name,
      email,
      phoneNo,
      password,
      accountCreationDate,
      role,
      userid,
      profile,
      status;
  late double balance;
  SharedPreferencesService spService = SharedPreferencesService();
  DatabaseService dbService = DatabaseService();

  // updateRevision(String updatedRevision, BuildContext context) {
  //   revision = updatedRevision;
  //   dbService.updateDatabaseUser("revision", updatedRevision, userid, context);
  // }

  snapshotToClass(uid, snapshot) {
    name = snapshot.child('name').value;
    email = snapshot.child('email').value;
    phoneNo = snapshot.child('phone').value;
    password = snapshot.child('password').value;
    accountCreationDate = snapshot.child('date').value;
    role = snapshot.child('role').value;
    profile = snapshot.child('profile').value;
    status = snapshot.child('status').value;
    balance = snapshot.child('balance').value + 0.00;

    // spService.setSharedprefUser(
    //     uid, name, email, phoneNo, password, batch, revision, role);
  }

  setUserData(
      String uid,
      String setname,
      String setemail,
      String setphoneNo,
      String setpassword,
      String setAccountCreationDate,
      String setrole,
      String setprofile,
      String setstatus,
      double setbalance,
      bool setData) {
    userid = uid;
    name = setname;
    email = setemail;
    phoneNo = setphoneNo;
    password = setpassword;
    accountCreationDate = setAccountCreationDate;
    role = setrole;
    profile = setprofile;
    status = setstatus;
    balance = setbalance;

    if (setData) {
      //SET DATA TO SHARED PREFERANCES WHILE SIGN UP
      // spService.setSharedprefUser(uid, setname, setemail, setphoneNo,
      //     setpassword, setbatch, setrevision, setrole);

      //SET DATA TO REALTIME DATABASE WHILE SIGN UP
      dbService.setDatabaseUser(uid, setname, setemail, setphoneNo, setpassword,
          setAccountCreationDate, setrole, profile, status, balance);
    }
  }
}
