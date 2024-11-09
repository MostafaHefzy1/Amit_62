import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.green,
        leading: IconButton(
            onPressed: () {
              // Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.green,
            )),
        // title: const Text(
        //   "Login Screen",
        //   style: TextStyle(
        //       color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        // ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Login Screen",
              style: TextStyle(color: Colors.black, fontSize: 25),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: TextEditingController(),
              readOnly: true,
              onFieldSubmitted: (value) {
                print(value);
              },
              validator: (value) {},
              onChanged: (value) {
                print("object $value");
              },
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.email_outlined),
                  prefixIconColor: Colors.green,
                  contentPadding: const EdgeInsets.all(1),
                  hintText: "Email",
                  hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
                  // hoverColor: Colors.green,

                  hoverColor: Colors.green,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.green)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.green)),
                  disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.green)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.grey)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.green)),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.green))),
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormField(
              controller: TextEditingController(),
              validator: (value) {},
              onChanged: (value) {},
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock_open_outlined),
                  prefixIconColor: Colors.green,
                  suffixIcon: const Icon(Icons.remove_red_eye_outlined),
                  suffixIconColor: Colors.green,
                  contentPadding: const EdgeInsets.all(1),
                  hintText: "Password",
                  hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.green,
              ),
              child: MaterialButton(
                onPressed: () {},
                child: const Text(
                  "Log In",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: RichText(
                  text: const TextSpan(
                      text: "Don't have an account? ",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      children: [
                    TextSpan(
                      text: "dafasfas",
                      style: TextStyle(
                        color: Colors.green,
                      ),
                    )
                  ])),
            ),
          ],
        ),
      ),
    );
  }
}
