import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ReviewScreen extends StatefulWidget {
  ReviewScreen({super.key});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                // obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "value!.isEmpty";
                  }
                },
                decoration: InputDecoration(
                    hintText: "Email...",
                    prefixIcon: const Icon(
                      Icons.email_outlined,
                      color: Colors.blue,
                    ),
                    // suffixIcon: const Icon(
                    //   // Icons.visibility_off_outlined,
                    //   Icons.remove_red_eye_outlined,

                    //   color: Colors.blue,
                    // ),
                    hintStyle: TextStyle(color: Colors.grey[400]),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
              SizedBox(
                height: 8,
              ),
              TextFormField(
                maxLength: 11,
                obscureText: isObscureText,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "value!.isEmpty";
                  } else if (value.length < 8) {
                    return "value.length>8";
                  } else if (value.length > 12) {
                    return "value.length > 12";
                  }
                },
                decoration: InputDecoration(
                    hintText: "Password...",
                    prefixIcon: const Icon(
                      Icons.lock_open_rounded,
                      color: Colors.blue,
                    ),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isObscureText = !isObscureText;
                            // print(isObscureText);
                          });
                          // if(isObscureText==true){
                          //   isObscureText = false ;
                          // }else{
                          //   isObscureText = true ;
                          // }
                        },
                        icon: Icon(
                          isObscureText == true
                              ? Icons.visibility_off_outlined
                              : Icons.remove_red_eye_outlined,
                          
                          color: Colors.blue,
                        )),
                    hintStyle: TextStyle(color: Colors.grey[400]),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                  onTap: () {
                    if (formKey.currentState!.validate()) {}
                  },
                  child: const Text("TextFormField validator")),
            ],
          ),
        ),
      ),
    );
  }
}
