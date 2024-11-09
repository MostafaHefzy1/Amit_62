import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WidgetsScreen extends StatelessWidget {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          centerTitle: true,
          title: const Text(
            "Widgets Screen",
            style: TextStyle(color: Colors.white),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart_rounded), label: "Cart"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_pin_circle_outlined),
                  label: "Profile"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: "Settings"),
            ]));
  }
}












        // body: Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: Form(
        //     key: formKey,
        //     child: Column(
        //       children: [
        //         const SizedBox(
        //           height: 50,
        //         ),
        //         TextFormField(
        //           maxLength: 5,
        //           onChanged: (value) {
        //             print("onChanged $value");
        //           },
        //           onFieldSubmitted: (value) {
        //             print("onSaved $value");
        //           },
        //           validator: (value) {
        //             if (value!.isEmpty) {
        //               return "ERRROR";
        //             }
        //           },
        //           decoration: InputDecoration(
        //             hintText: "Email",
        //             // label: Text("Email")
        //             border: OutlineInputBorder(
        //               borderRadius: BorderRadius.circular(10),
        //             ),

        //             prefixIcon: const Icon(Icons.email),
        //             prefixIconColor: Colors.green,

        //             suffixIcon: const Icon(Icons.remove_red_eye),
        //           ),
        //         ),
        //         TextFormField(
        //           onChanged: (value) {
        //             print("onChanged $value");
        //           },
        //           onFieldSubmitted: (value) {
        //             print("onSaved $value");
        //           },
        //           validator: (value) {
        //             if (value!.isEmpty) {
        //               return "ERRROR";
        //             } else if (value.length < 8) {
        //               return "value.length<8";
        //             } else if (value.length > 12) {
        //               return "value.length>12";
        //             }  
        //           },
        //           decoration: InputDecoration(
        //             hintText: "Email",
        //             // label: Text("Email")
        //             border: OutlineInputBorder(
        //               borderRadius: BorderRadius.circular(10),
        //             ),

        //             prefixIcon: const Icon(Icons.email),
        //             prefixIconColor: Colors.green,

        //             suffixIcon: const Icon(Icons.remove_red_eye),
        //           ),
        //         ),
        //         TextButton(
        //             onPressed: () {
        //               if (formKey.currentState!.validate()) {



                        
        //               }
        //             },
        //             child: Text("Login"))
        //       ],
        //     ),
        //   ),
        // ),
        
        // body: ,