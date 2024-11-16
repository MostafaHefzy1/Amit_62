// // import 'package:carousel_slider/carousel_slider.dart';
// // import 'package:flutter/material.dart';

// // class HomeScreen extends StatelessWidget {
// //   const HomeScreen({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.white,
// //       // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
// //       drawer: Container(
// //         color: Colors.grey,
// //         width: 250,
// //         child: const Column(
// //           children: [
// //             Text("data"),
// //             Text("data"),
// //             Text("data"),
// //             Text("data"),
// //           ],
// //         ),
// //       ),
// //       appBar: AppBar(
// //         backgroundColor: Colors.green,

// //         // centerTitle: true,
// //         centerTitle: true,
// //         title: const Text(
// //           "Home Screen",
// //           style: TextStyle(
// //             color: Colors.red,
// //             fontWeight: FontWeight.bold,
// //           ),
// //         ),
// //         // leading:
// //         //     IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back)),
// //         actions: [
// //           IconButton(
// //               onPressed: () {
// //                 print("Icon Search");
// //               },
// //               icon: const Icon(
// //                 Icons.search,
// //                 color: Colors.green,
// //                 size: 30,
// //               ))
// //         ],
// //       ),
// //       body: SingleChildScrollView(
// //         child: Column(
// //           children: [
// //             Container(
// //               // padding:  EdgeInsets.symmetric(horizontal: 10, vertical: 10),
// //               color: Colors.red,
// //               height: 100,
// //               width: double.infinity,
// //               child: Container(
// //                 padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
// //                 color: Colors.yellow,
// //                 height: 100,
// //                 width: double.infinity,
// //               ),
// //             ),
// //             Container(
// //               height: 100,
// //               // color: Colors.red,
// //               decoration: const BoxDecoration(),
// //             ),
// //             IconButton(
// //                 onPressed: () {
// //                   print("object");
// //                 },
// //                 icon: const Icon(Icons.favorite)),
// //             const Padding(
// //               padding: EdgeInsets.symmetric(horizontal: 100),
// //               child: Text(
// //                 "data",
// //                 style: TextStyle(color: Colors.amber, fontSize: 22),
// //               ),
// //             ),
// //             const Padding(
// //               padding: EdgeInsets.symmetric(horizontal: 100),
// //               child: Text(
// //                 "data",
// //                 style: TextStyle(color: Colors.amber, fontSize: 22),
// //               ),
// //             ),
// //             CarouselSlider(
// //               options: CarouselOptions(height: 400.0),
// //               items: [1, 2, 3, 4, 5].map((i) {
// //                 return Builder(
// //                   builder: (BuildContext context) {
// //                     return Container(
// //                         width: MediaQuery.of(context).size.width,
// //                         margin: const EdgeInsets.symmetric(horizontal: 5.0),
// //                         decoration: const BoxDecoration(color: Colors.amber),
// //                         child: Text(
// //                           'text $i',
// //                           style: const TextStyle(fontSize: 16.0),
// //                         ));
// //                   },
// //                 );
// //               }).toList(),
// //             ),
// //             OutlinedButton(
// //               style: ButtonStyle(
// //                 mouseCursor: WidgetStateProperty.all(SystemMouseCursors.click),
// //                 iconColor: WidgetStateProperty.all(Colors.amberAccent),
// //                 backgroundColor: WidgetStateProperty.all(Colors.amberAccent),
// //               ),
// //               onPressed: () {},
// //               child: const Text("data"),
// //             ),
// //             IconButton.filled(
// //               style: IconButton.styleFrom(backgroundColor: Colors.redAccent),
// //               onPressed: () {},
// //               icon: const Icon(Icons.abc_outlined),
// //             ),
// //             TextButton.icon(
// //               onPressed: () {},
// //               icon: Icon(Icons.access_alarms_outlined),
// //               label: Text("data"),
// //               iconAlignment: IconAlignment.end,
// //             ),
// //             Container(
// //               height: 100,
// //               // color: Colors.red,
// //               decoration: const BoxDecoration(),
// //             ),
// //           ],
// //         ),
// //       ),
// //       bottomNavigationBar: BottomNavigationBar(
// //           fixedColor: Colors.amber,
// //           unselectedItemColor: Colors.green,
// //           items: const [
// //             BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
// //             BottomNavigationBarItem(icon: Icon(Icons.new_label), label: "home"),
// //             BottomNavigationBarItem(icon: Icon(Icons.add), label: "home"),
// //             BottomNavigationBarItem(icon: Icon(Icons.add), label: "home")
// //           ]),
// //       floatingActionButton: FloatingActionButton(
// //         onPressed: () {},
// //         child: const Icon(Icons.favorite),
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';

// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         // backgroundColor: Colors.green,

//         // drawer: Container(x`
//         //   color: Colors.grey,
//         //   width: 200,
//         //   child: Column(
//         //     children: [
//         //       SizedBox(
//         //         height: 30,
//         //       ),
//         //       InkWell(
//         //         onTap: () {
//         //           print("     color: Colors.grey,");
//         //         },
//         //         child: Row(
//         //           children: [
//         //             Icon(Icons.settings),
//         //             SizedBox(
//         //               width: 8,
//         //             ),
//         //             Text(
//         //               "Settings",
//         //               style: TextStyle(fontSize: 16, color: Colors.white),
//         //             ),
//         //             Spacer(),
//         //             Icon(Icons.arrow_forward_ios_rounded),
//         //           ],
//         //         ),
//         //       )
//         //     ],
//         //   ),
//         // ),
//         appBar: AppBar(
//           backgroundColor: Colors.blue,
//           centerTitle: true,
//           title: const Text(
//             "Home Screen",
//             style: TextStyle(color: Colors.white),
//           ),
//           actions: [
//             IconButton(
//               onPressed: () {},
//               icon: const Icon(
//                 Icons.favorite,
//                 color: Colors.red,
//               ),
//             ),
//             IconButton(
//               onPressed: () {},
//               icon: const Icon(
//                 Icons.favorite,
//                 color: Colors.red,
//               ),
//             )
//           ],
//         ),

//         body: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: Column(
//               children: [

//                 Image.network("https://plus.unsplash.com/premium_photo-1664474619075-644dd191935f?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8aW1hZ2V8ZW58MHx8MHx8fDA%3D")

//                   ,

//                 const Text("data"),
//                 const SizedBox(
//                   height: 100,
//                 ),

//                 TextFormField(
//                   keyboardType: TextInputType.name,
//                   obscureText: false,
//                   initialValue: "dmsakldmas",
//                   // maxLines: 5,
//                   style: const TextStyle(color: Colors.deepOrange),
//                   cursorColor: Colors.green[800],
//                   decoration: InputDecoration(
//                       contentPadding: const EdgeInsets.symmetric(horizontal: 5),
//                       hintText: "Home Screen",
//                       hintStyle: const TextStyle(color: Colors.grey),
//                       suffixIcon: IconButton(
//                         icon: const Icon(
//                           // Icons.visibility_off_rounded,
//                           Icons.remove_red_eye,
//                           color: Colors.blue,
//                         ),
//                         onPressed: () {},
//                       ),
//                       prefixIcon: const Icon(
//                         Icons.lock_open_rounded,
//                         color: Colors.blue,
//                       ),
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(25))),
//                 ),

//                 const SizedBox(
//                   height: 30,
//                 ),
//                 const Row(
//                   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       "data",
//                     ),
//                     Icon(Icons.account_balance_outlined),
//                     Spacer(),
//                     Icon(Icons.access_time)
//                   ],
//                 ),
//                 const Text(
//                   "mdkslamdas",
//                   style: TextStyle(
//                       fontSize: 26,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.deepPurpleAccent),
//                 ),

//                 // Button
//                 IconButton(
//                     onPressed: () {},
//                     icon: const Icon(Icons.access_alarm_rounded)),
//                 TextButton(onPressed: () {}, child: const Text("TextButton")),
//                 ElevatedButton(

//                     // style: ElevatedButton.styleFrom(
//                     //   backgroundColor: Colors.amber
//                     // )  ,

//                     style: ButtonStyle(
//                       // shape: WidgetStateProperty.all<OutlineInputBorder>(
//                       //   RoundedRectangleBorder(
//                       //     borderRadius: BorderRadius.circular(10)
//                       //   )
//                       // ),
//                       backgroundColor:
//                           WidgetStateProperty.all<Color>(Colors.amber),
//                     ),
//                     onPressed: () {},
//                     child: const Text("ElevatedButton")),
//                 OutlinedButton(
//                     onPressed: () {}, child: const Text("OutlinedButton")),
//                 MaterialButton(
//                   onPressed: () {},
//                   child: const Text("MaterialButton"),
//                 ),

//                 GestureDetector(
//                     onTap: () {
//                       print("object");
//                     },
//                     onDoubleTap: () {
//                       print("onDoubleTap");
//                     },
//                     onLongPress: () {
//                       print("onLongPress");
//                     },
//                     child: Image.network(
//                         "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQqGK3diR3Zi-mnOXEaj-3ewmFyRYVxGzVzZw&s")),

//                 GestureDetector(
//                     onTap: () {
//                       print("object");
//                     },
//                     onDoubleTap: () {
//                       print("onDoubleTap");
//                     },
//                     onLongPress: () {
//                       print("onLongPress");
//                     },
//                     child: Image.network(
//                         "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQqGK3diR3Zi-mnOXEaj-3ewmFyRYVxGzVzZw&s")),

//                 const SizedBox(
//                   height: 50,
//                 ),

//                 // Row(
//                 //   children: [
//                 //     Image.network(
//                 //         "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQqGK3diR3Zi-mnOXEaj-3ewmFyRYVxGzVzZw&s"),
//                 //     Image.network(
//                 //         "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQqGK3diR3Zi-mnOXEaj-3ewmFyRYVxGzVzZw&s"),
//                 //   ],
//                 // ),
//                 // Spacer(),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: Container(
//                         color: Colors.green,
//                         height: 100,
//                         width: 100,
//                       ),
//                     ),
//                     const SizedBox(
//                       width: 10,
//                     ),
//                     Container(
//                       color: Colors.red,
//                       height: 100,
//                       width: 150,
//                     )
//                   ],
//                 ),
//                 // const SizedBox(
//                 //   height: 100,
//                 // ),
//                 // SizedBox(
//                 //   height: 100,
//                 //   width: 100,
//                 //   child: Image.network(
//                 //     "https://www.shutterstock.com/image-photo/collage-children-boys-girls-using-260nw-2413434275.jpg",
//                 //     fit: BoxFit.contain,
//                 //   ),
//                 // ),
//                 // const SizedBox(
//                 //   height: 100,
//                 // ),
//                 // // Row(
//                 // //   children: [
//                 // //     CircleAvatar(
//                 // //       radius: 40,
//                 // //       backgroundImage: Image.network(
//                 // //               "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQqGK3diR3Zi-mnOXEaj-3ewmFyRYVxGzVzZw&s")
//                 // //           .image,
//                 // //     ),
//                 // //     const SizedBox(
//                 // //       width: 10,
//                 // //     ),
//                 // //     const Expanded(
//                 // //       child: Column(
//                 // //         crossAxisAlignment: CrossAxisAlignment.start,
//                 // //         children: [
//                 // //           Text(
//                 // //             "Amit",
//                 // //             style: TextStyle(fontSize: 20),
//                 // //           ),
//                 // //           Text(
//                 // //             "Home Screen fndmaklsfnkalsnfklasnfklasnfklHome Screen fndmaklsfnkalsnfklasnfklasnfklHome Screen fndmaklsfnkalsnfklasnfklasnfklHome Screen fndmaklsfnkalsnfklasnfklasnfklHome Screen fndmaklsfnkalsnfklasnfklasnfklHome Screen fndmaklsfnkalsnfklasnfklasnfklHome Screen fndmaklsfnkalsnfklasnfklasnfklHome Screen fndmaklsfnkalsnfklasnfklasnfklHome Screen fndmaklsfnkalsnfklasnfklasnfklHome Screen fndmaklsfnkalsnfklasnfklasnfkl",
//                 // //             maxLines: 2,
//                 // //             overflow: TextOverflow.ellipsis,
//                 // //             style: TextStyle(fontSize: 20),
//                 // //           ),
//                 // //         ],
//                 // //       ),
//                 // //     )
//                 // //   ],
//                 // // ),

//                 // ListView.separated(
//                 //   shrinkWrap: true,
//                 //   physics: NeverScrollableScrollPhysics(),
//                 //   itemBuilder: (context, index) {
//                 //     return Row(
//                 //       children: [
//                 //         CircleAvatar(
//                 //           radius: 40,
//                 //           backgroundImage: Image.network(
//                 //                   "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQqGK3diR3Zi-mnOXEaj-3ewmFyRYVxGzVzZw&s")
//                 //               .image,
//                 //         ),
//                 //         const SizedBox(
//                 //           width: 10,
//                 //         ),
//                 //         const Expanded(
//                 //           child: Column(
//                 //             crossAxisAlignment: CrossAxisAlignment.start,
//                 //             children: [
//                 //               Text(
//                 //                 "Amit",
//                 //                 style: TextStyle(fontSize: 20),
//                 //               ),
//                 //               Text(
//                 //                 "Home Screen fndmaklsfnkalsnfklasnfklasnfklHome Screen fndmaklsfnkalsnfklasnfklasnfklHome Screen fndmaklsfnkalsnfklasnfklasnfklHome Screen fndmaklsfnkalsnfklasnfklasnfklHome Screen fndmaklsfnkalsnfklasnfklasnfklHome Screen fndmaklsfnkalsnfklasnfklasnfklHome Screen fndmaklsfnkalsnfklasnfklasnfklHome Screen fndmaklsfnkalsnfklasnfklasnfklHome Screen fndmaklsfnkalsnfklasnfklasnfklHome Screen fndmaklsfnkalsnfklasnfklasnfkl",
//                 //                 maxLines: 2,
//                 //                 overflow: TextOverflow.ellipsis,
//                 //                 style: TextStyle(fontSize: 20),
//                 //               ),
//                 //             ],
//                 //           ),
//                 //         )
//                 //       ],
//                 //     );
//                 //   },
//                 //   separatorBuilder: (context, index) {
//                 //     return Padding(
//                 //       padding: const EdgeInsets.symmetric(horizontal: 20),
//                 //       child: Divider(
//                 //         color: Colors.blue,
//                 //         thickness: 1,
//                 //       ),
//                 //     );
//                 //   },
//                 //   itemCount: 3,
//                 // ),

//                 // // SizedBox(
//                 // //   height: 20,
//                 // // ),

//                 // SizedBox(
//                 //   height: 159,
//                 //   child: ListView.separated(
//                 //       padding: const EdgeInsets.only(top: 20),
//                 //       shrinkWrap: true,
//                 //       scrollDirection: Axis.horizontal,
//                 //       itemBuilder: (context, index) => Column(
//                 //             children: [
//                 //               CircleAvatar(
//                 //                 radius: 40,
//                 //                 backgroundImage: NetworkImage(
//                 //                     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQqGK3diR3Zi-mnOXEaj-3ewmFyRYVxGzVzZw&s"),
//                 //               ),
//                 //               Text("Hello")
//                 //             ],
//                 //           ),
//                 //       separatorBuilder: (context, index) => SizedBox(
//                 //             width: 10,
//                 //           ),
//                 //       itemCount: 10),
//                 // )
//               ],
//             ),
//           ),
//         ),

//         // floatingActionButton: FloatingActionButton(onPressed: (){}),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_application_1/drawer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Container(
        color: Colors.blueAccent,
        width: 250,
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            ListTile(
              onTap: () {
                print("object");
              },
              leading: const Icon(
                Icons.settings,
                color: Colors.white,
              ),
              title: const Text(
                "Settings",
                style: TextStyle(color: Colors.white),
              ),
              subtitle: const Text(
                "sub settings",
                style: TextStyle(color: Colors.white),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Colors.white,
                size: 30,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.dark_mode_outlined,
                color: Colors.white,
                size: 30,
              ))
        ],
        // leading: IconButton(
        //     onPressed: () {},
        //     icon: const Icon(
        //       Icons.arrow_back_ios,
        //       color: Colors.white,
        //     )),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),

        title: const Text(
          "Home Screen",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Image.network(
                  "https://plus.unsplash.com/premium_photo-1664474619075-644dd191935f?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8aW1hZ2V8ZW58MHx8MHx8fDA%3D",
                  height: 200,
                  width: double.infinity,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "data",
                    style: TextStyle(fontSize: 25, color: Colors.black),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                 Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "data",
                    // style: TextStyle(fontSize: 25, color: Colors.black),
                    style: Theme.of(context).textTheme.displayLarge!,
                  ),
                ),
                 Align(
                  alignment: Alignment.center,
                  child: Text(
                    "data",
                    style:Theme.of(context).textTheme.displayLarge!,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 100,
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.abc_sharp,
                  size: 88,
                )),
            TextButton(onPressed: () {}, child: const Text("Home Screen")),
            InkWell(
              onTap: () {
                print("onTap");
              },
              child: Image.network(
                "https://plus.unsplash.com/premium_photo-1664474619075-644dd191935f?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8aW1hZ2V8ZW58MHx8MHx8fDA%3D",
                height: 200,
                width: 200,
              ),
            ),
            const CircleAvatar(
              radius: 60,
              backgroundColor: Colors.green,

              // backgroundImage: Image.network(
              //   "https://plus.unsplash.com/premium_photo-1664474619075-644dd191935f?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8aW1hZ2V8ZW58MHx8MHx8fDA%3D",
              //   height: 200,
              //   width: 200,
              // ).image,
              backgroundImage: NetworkImage(
                  "https://plus.unsplash.com/premium_photo-1664474619075-644dd191935f?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8aW1hZ2V8ZW58MHx8MHx8fDA%3D"),
              // child: Image.network(
              //   "https://plus.unsplash.com/premium_photo-1664474619075-644dd191935f?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8aW1hZ2V8ZW58MHx8MHx8fDA%3D",
              //   height: 200,
              //   width: 200,
              // )
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.abc_sharp,
                  size: 88,
                )),
            TextButton(onPressed: () {}, child: const Text("Home Screen")),
            InkWell(
              onTap: () {
                print("onTap");
              },
              child: Image.network(
                "https://plus.unsplash.com/premium_photo-1664474619075-644dd191935f?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8aW1hZ2V8ZW58MHx8MHx8fDA%3D",
                height: 200,
                width: 200,
              ),
            ),
            const CircleAvatar(
              radius: 60,
              backgroundColor: Colors.green,

              // backgroundImage: Image.network(
              //   "https://plus.unsplash.com/premium_photo-1664474619075-644dd191935f?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8aW1hZ2V8ZW58MHx8MHx8fDA%3D",
              //   height: 200,
              //   width: 200,
              // ).image,
              backgroundImage: NetworkImage(
                  "https://plus.unsplash.com/premium_photo-1664474619075-644dd191935f?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8aW1hZ2V8ZW58MHx8MHx8fDA%3D"),
              // child: Image.network(
              //   "https://plus.unsplash.com/premium_photo-1664474619075-644dd191935f?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8aW1hZ2V8ZW58MHx8MHx8fDA%3D",
              //   height: 200,
              //   width: 200,
              // )
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.abc_sharp,
                  size: 88,
                )),
            TextButton(onPressed: () {}, child: const Text("Home Screen")),
            InkWell(
              onTap: () {
                print("onTap");
              },
              child: Image.network(
                "https://plus.unsplash.com/premium_photo-1664474619075-644dd191935f?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8aW1hZ2V8ZW58MHx8MHx8fDA%3D",
                height: 200,
                width: 200,
              ),
            ),
            const CircleAvatar(
              radius: 60,
              backgroundColor: Colors.green,

              // backgroundImage: Image.network(
              //   "https://plus.unsplash.com/premium_photo-1664474619075-644dd191935f?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8aW1hZ2V8ZW58MHx8MHx8fDA%3D",
              //   height: 200,
              //   width: 200,
              // ).image,
              backgroundImage: NetworkImage(
                  "https://plus.unsplash.com/premium_photo-1664474619075-644dd191935f?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8aW1hZ2V8ZW58MHx8MHx8fDA%3D"),
              // child: Image.network(
              //   "https://plus.unsplash.com/premium_photo-1664474619075-644dd191935f?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8aW1hZ2V8ZW58MHx8MHx8fDA%3D",
              //   height: 200,
              //   width: 200,
              // )
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.abc_sharp,
                  size: 88,
                )),
            TextButton(onPressed: () {}, child: const Text("Home Screen")),
            InkWell(
              onTap: () {
                print("onTap");
              },
              child: Image.network(
                "https://plus.unsplash.com/premium_photo-1664474619075-644dd191935f?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8aW1hZ2V8ZW58MHx8MHx8fDA%3D",
                height: 200,
                width: 200,
              ),
            ),
            const CircleAvatar(
              radius: 60,
              backgroundColor: Colors.green,

              // backgroundImage: Image.network(
              //   "https://plus.unsplash.com/premium_photo-1664474619075-644dd191935f?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8aW1hZ2V8ZW58MHx8MHx8fDA%3D",
              //   height: 200,
              //   width: 200,
              // ).image,
              backgroundImage: NetworkImage(
                  "https://plus.unsplash.com/premium_photo-1664474619075-644dd191935f?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8aW1hZ2V8ZW58MHx8MHx8fDA%3D"),
              // child: Image.network(
              //   "https://plus.unsplash.com/premium_photo-1664474619075-644dd191935f?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8aW1hZ2V8ZW58MHx8MHx8fDA%3D",
              //   height: 200,
              //   width: 200,
              // )
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.abc_sharp,
                  size: 88,
                )),
            TextButton(onPressed: () {}, child: const Text("Home Screen")),
            InkWell(
              onTap: () {
                print("onTap");
              },
              child: Image.network(
                "https://plus.unsplash.com/premium_photo-1664474619075-644dd191935f?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8aW1hZ2V8ZW58MHx8MHx8fDA%3D",
                height: 200,
                width: 200,
              ),
            ),
            const CircleAvatar(
              radius: 60,
              backgroundColor: Colors.green,

              // backgroundImage: Image.network(
              //   "https://plus.unsplash.com/premium_photo-1664474619075-644dd191935f?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8aW1hZ2V8ZW58MHx8MHx8fDA%3D",
              //   height: 200,
              //   width: 200,
              // ).image,
              backgroundImage: NetworkImage(
                  "https://plus.unsplash.com/premium_photo-1664474619075-644dd191935f?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8aW1hZ2V8ZW58MHx8MHx8fDA%3D"),
              // child: Image.network(
              //   "https://plus.unsplash.com/premium_photo-1664474619075-644dd191935f?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8aW1hZ2V8ZW58MHx8MHx8fDA%3D",
              //   height: 200,
              //   width: 200,
              // )
            ),
            const SizedBox(
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                obscureText: true,
                obscuringCharacter: "#",
                // cursorHeight: 100,
                // controller:   ,
                // clipBehavior: Clip.antiAlias,

                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.abc),
                    prefixIconColor: Colors.green,
                    suffixIcon: const Icon(Icons.ac_unit),
                    suffixIconColor: Colors.blue,
                    hintText: "Hint Text",
                    hintStyle: TextStyle(color: Colors.grey[600], fontSize: 15),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 5),
                    disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          fixedColor: Colors.amber,
          unselectedItemColor: Colors.green,

          // selectedLabelStyle: const TextStyle(color: Colors.amber),
          // unselectedLabelStyle: const TextStyle(color: Colors.green),
          // useLegacyColorScheme: true,
          // mouseCursor: MouseCursor.uncontrolled,
          // unselectedFontSize: 30,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.ac_unit),
              label: "dasmdla",
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.ac_unit), label: "dasmdla"),
            BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label: "dasd"),
            BottomNavigationBarItem(
                icon: Icon(Icons.ac_unit), label: "dasasdasdasmdla"),
          ]),

      // floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.ac_unit_sharp),
        onPressed: () {},
        // label: const Text("data"),
      ),
    );
    // return Scaffold(
    //   body: Column(
    //     children: [
    //       Container(
    //         // height: MediaQuery.sizeOf(context).height * 0.5,
    //         height: 400.h,
    //         width: double.infinity,
    //         color: Colors.green,
    //       ),
    //       // Container(
    //       //   height: MediaQuery.sizeOf(context).height * 0.4,
    //       //   width: double.infinity,
    //       //   color: Colors.green,
    //       // ),
    //     ],
    //   ),
    // );
  }
}
