import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_crud/services/database_method.dart';
import 'package:firebase_crud/views/screens/employee/add_employee.dart';
import 'package:firebase_crud/views/screens/notification/notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'inner/dialogfor_updata_employee.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Stream? EmployeeStram;


  getmethodLoad()async{
    EmployeeStram = await DataBaseMethod().getEmployeeDetails();
    setState(() {

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getmethodLoad();
  }


  Widget allEmployeeDetails() {
    return StreamBuilder(
      stream: EmployeeStram,
      builder: (context, snapshot) {
        return snapshot.hasData ?
        ListView.builder(
          itemCount: snapshot.data.docs.length,
          itemBuilder: (context, index) {
            DocumentSnapshot ds = snapshot.data.docs[index];
            return Container(
              margin: const EdgeInsets.only(top: 10),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.white10,
                    blurRadius: 10,
                    offset: Offset(1, .50),
                    spreadRadius: 10
                  )
                ]
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Name:      ${ds["Name"]}"),
                      IconButton(onPressed: (){
                        Navigator.pop(context);
                        showDialog(context: context, builder: (context) =>
                          DialogForUpDateEmployee(id: ds.id),);
                      }, icon: Icon(Icons.edit,color: Colors.white,))
                    ],
                  ),
                  Text("Age:          ${ds["Age"]}"),
                  Text("Address:  ${ds["Address"]}"),
                  Text("Time:        ${ds["Time"]}" ?? "no"),
                ],
              ),
            );
          },) : const Center(child: CircularProgressIndicator());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Employee"),
        actions: [
          IconButton(onPressed: () {
            Get.to(AddEmployeeScreen());
          }, icon: Icon(Icons.add))
        ],
      ),



      ///---------------------body section-------------->
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        child: Column(

          children: [

            ElevatedButton(onPressed: (){
              // Get.to(NotificationScreen());
            }, child: Text("Notification")),



            Expanded(child: allEmployeeDetails())
          ],
        ),
      ),
    );
  }
}
