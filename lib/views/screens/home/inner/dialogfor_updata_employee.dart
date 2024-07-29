
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../../services/database_method.dart';

class DialogForUpDateEmployee extends StatelessWidget {
  String id;
   DialogForUpDateEmployee({
     required this.id,
    super.key,
  });

  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  DateTime nowTime = DateTime.now();


  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///------------------------name------------------>
            const SizedBox(
              height: 8,
            ),
            const Text("Name"),
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(hintText: "Enter your name"),
            ),
            const SizedBox(
              height: 8,
            ),

            ///------------------------age------------------>
            const SizedBox(
              height: 8,
            ),
            const Text("Age"),
            TextFormField(
              controller: ageController,
              decoration: const InputDecoration(hintText: "Enter your age"),
            ),
            const SizedBox(
              height: 8,
            ),

            ///------------------------location------------------>
            const SizedBox(
              height: 8,
            ),
            const Text("Location"),
            TextFormField(
              controller: locationController,
              decoration: const InputDecoration(hintText: "Enter you location"),
            ),
            const SizedBox(
              height: 8,
            ),

            const Spacer(),

            ElevatedButton(
                onPressed: () async{
                  Map <String, dynamic> employee = {
                    "Name" : nameController.text,
                    "Age" : ageController.text,
                    "Address" : locationController.text,
                    "Time" : nowTime,
                  };
                  await DataBaseMethod().upDateEmployeeInfo(
                      id,
                      employee,
                  ).then((value) => Fluttertoast.showToast(
                      msg: "employee create successed",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0
                  ));
                },
                child: const Text("Update Informaition"))
          ],
        ),
      ),
    );
  }
}
