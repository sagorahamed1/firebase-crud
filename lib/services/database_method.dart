import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseMethod {
  Future addEmplyeeData(Map<String, dynamic> emplyee, String id) async {
    try {
      await FirebaseFirestore.instance
          .collection("Employee")
          .doc(id)
          .set(emplyee);

      print("---------------------> employee add successed");
    } catch (e) {
      print("--------------------error$e");
    }
  }

  ///------------get empolyee info-------------------->
  Future<Stream<QuerySnapshot>> getEmployeeDetails() async {
    return await FirebaseFirestore.instance.collection("Employee").snapshots();
  }


  ///-------------------update employee informaintion-------------------->
  Future upDateEmployeeInfo(String id, Map <String,dynamic> employInfo) async{
    return await FirebaseFirestore.instance.collection("Employee").doc(id).update(employInfo);
  }
}
