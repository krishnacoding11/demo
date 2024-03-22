import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../sql_data_table/get_data_demo/home_screen.dart';
import 'bottom_bar.dart';

class ScreenOnePage extends StatefulWidget {
  const ScreenOnePage({super.key});

  @override
  State<ScreenOnePage> createState() => _ScreenOnePageState();
}

class _ScreenOnePageState extends State<ScreenOnePage> {
  List text = ["Book An\nAppointment", "", "My\nAppointments"];
  List loan = [
    "Applications",
    "Check Loan Eligibility",
    "Docker",
    "EMI calculator"
  ];
  List loan1 = [
    "Personal Loan",
    "Property Loan",
    "Business Loan",
    "Other Loan",
  ];
  List image = [
    "assets/image/resume.png",
    "assets/image/credit.png",
    "assets/image/docker.png",
    "assets/image/calculate.png"
  ];
  List image1 = [
    "assets/image/1.png",
    "assets/image/2.png",
    "assets/image/3.png",
    "assets/image/4.png",
  ];
  List myImage = [
    "assets/image/my1.png",
    "assets/image/my2.png",
    "assets/image/my3.png",
    "assets/image/my4.png",
    "assets/image/my5.png",
  ];
  List myName = [
    "Generate\nQR Code",
    "Events\nActivities",
    "Bills",
    "General\nDiscussions",
    "My\nVisitors"
  ];
  List color = [const Color(0xffFF5733), const Color(0xff0e22b5), Colors.white];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black, // Change the color of the drawer icon
        ),
        title: const Text(
          "Hello, Hyandav!",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.comment),
            color: Colors.black,
            tooltip: 'Comment Icon',
            onPressed: () {
              Get.to(()=>const HomeScreen());
            },
          ), //IconButton
          IconButton(
            icon: const CircleAvatar(
              backgroundColor: Color.fromARGB(255, 165, 255, 137),
              child: Center(
                child: Text(
                  "A",
                  style: TextStyle(fontSize: 20.0, color: Colors.blue),
                ),
              ),
            ),
            tooltip: 'Setting Icon',
            onPressed: () {},
          ), //IconButton
        ],
      ),
      drawer: Drawer(
        // backgroundColor: Colors.white,
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.green),
                accountName: Text(
                  "Abhishek Mishra",
                  style: TextStyle(fontSize: 18),
                ),
                accountEmail: Text("abhishekm977@gmail.com"),
                currentAccountPictureSize: Size.square(40),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 165, 255, 137),
                  child: Center(
                    child: Text(
                      "A",
                      style: TextStyle(fontSize: 20.0, color: Colors.blue),
                    ),
                  ),
                ),
              ),
            ),
            // Container(
            //   height: MediaQuery.of(context).size.height/15,
            //   color: Colors.green,
            //   child: Column(
            //     children: [
            //       CircleAvatar(
            //         backgroundColor: Color.fromARGB(255, 165, 255, 137),
            //         child: Text(
            //           "A",
            //           style: TextStyle(fontSize: 30.0, color: Colors.blue),
            //         ),
            //       ),
            //       Text(
            //         "Abhishek Mishra",
            //         style: TextStyle(fontSize: 18),
            //       ),
            //       Text("abhishekm977@gmail.com"),
            //     ],
            //   ),
            // ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text(' My Profile '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.book),
              title: const Text(' My Course '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.workspace_premium),
              title: const Text(' Go Premium '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.video_label),
              title: const Text(' Saved Videos '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text(' Edit Profile '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('LogOut'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),
                          Container(
                            height: 150,
                            decoration: BoxDecoration(
                                color: const Color(0xffdaf7de),
                                borderRadius: BorderRadius.circular(20)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15.0, vertical: 00),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 30.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 20,
                                          width: 50,
                                          decoration: BoxDecoration(
                                            color: Colors.indigo,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: const Center(
                                            child: Text(
                                              "ADD",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        const Row(
                                          children: [
                                            Text(
                                              '"',
                                              style: TextStyle(
                                                  color: Colors.indigo,
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              "POWER",
                                              style: TextStyle(
                                                  color: Color(0xff0c871d),
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              '"',
                                              style: TextStyle(
                                                  color: Colors.indigo,
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        const Row(
                                          children: [
                                            Text(
                                              'To Your',
                                              style: TextStyle(
                                                  color: Colors.indigo,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              " Loans!..",
                                              style: TextStyle(
                                                  color: Color(0xff0c871d),
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Image.asset(
                                    "assets/image/handshake2-removebg-preview.png.webp",
                                    height: 150,
                                    width: 150,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 14),
                          const Text(
                            "FINANCIAL DOCTOR",
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                          const SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(
                              3,
                              (index) => Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Container(
                                    height: 70, width: 105,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.blue.shade900,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Center(
                                        child: index == 1
                                            ? const Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  SizedBox(height: 5),
                                                  Text(
                                                    "Upcoming Apt.",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 10),
                                                  ),
                                                  SizedBox(height: 2),
                                                  Text(
                                                    "12 Mar, 2014",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xff55a363),
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              )
                                            : Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 8.0),
                                                child: Text(
                                                  "${text[index]}",
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 13),
                                                ),
                                              ),
                                      ),
                                    ),
                                    // margin: EdgeInsets.only(right: 8),
                                  ),
                                  Positioned(
                                    left: 33,
                                    top: -18,
                                    child: Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                        color: const Color(0xff3aa152),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: index == 1 || index == 2
                                          ? const Icon(
                                              Icons.calendar_month,
                                              color: Colors.black,
                                            )
                                          : Padding(
                                              padding:
                                                  const EdgeInsets.all(7.0),
                                              child: Image.asset(
                                                  "assets/image/doctor-appointment.png"),
                                            ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 14),
                          const Text(
                            "LOAN CENTRE",
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Row(
                          children: List.generate(
                            4,
                            (index) => Container(
                              height: 55,
                              // width: 180,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: const Color(0xff0c9c29),
                                ),
                                color: const Color(0xff0c9c29),
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                              ),
                              margin: const EdgeInsets.only(right: 10),
                              child: Container(
                                height: 55,
                                // width: 180,
                                margin: const EdgeInsets.only(bottom: 5),
                                decoration: const BoxDecoration(
                                    color: Color(0xffebf0ec),
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10),
                                      bottomLeft: Radius.circular(10),
                                    )),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Center(
                                        child: Image.asset(
                                          "${image[index]}",
                                          height: 27,
                                          width: 27,
                                          // color: Color(0xffebf0ec),
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        "${loan[index]}",
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    Container(
                      height: 230,
                      width: double.infinity,
                      // color: Colors.grey,
                      child: Row(
                        children: [
                          Container(
                            width: 170,
                            decoration: const BoxDecoration(
                              color: Color(0xff8cbf92),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                    "assets/image/Screenshot 2024-03-12 131819.png"),
                              ),
                            ),
                          ),
                          Container(
                            height: 230,
                            width: MediaQuery.of(context).size.width / 1.9,
                            color: Colors.indigo,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 15.0),
                              child: GridView.builder(
                                itemCount: 4,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2),
                                itemBuilder: (context, index) {
                                  return Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                          // color: Color(0xff8cbf92),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image:
                                                AssetImage("${image1[index]}"),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 6),
                                      Text(
                                        "${loan1[index]}",
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 12),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Text(
                        "MY COMMUNITY",
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Row(
                          children: List.generate(
                            5,
                            (index) => Container(
                              height: 175,
                              width: 95,
                              margin: const EdgeInsets.only(right: 13),
                              decoration: BoxDecoration(
                                color: const Color(0xff54945c),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 110,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                        // fit: BoxFit.cover,
                                        image: AssetImage("${myImage[index]}"),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 13),
                                  index == 2
                                      ? Center(
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(top: 8.0),
                                            child: Text(
                                              "${myName[index]}",
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                fontSize: 15,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        )
                                      : Center(
                                          child: Text(
                                            "${myName[index]}",
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                              fontSize: 15,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Row(
                          children: List.generate(
                            3,
                            (index) => Container(
                              height: 130,
                              width: 300,
                              margin: const EdgeInsets.only(right: 13),
                              padding: const EdgeInsets.only(
                                  top: 10, left: 10, bottom: 15),
                              decoration: BoxDecoration(
                                color: color[index],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: index == 0
                                  ? Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Row(
                                              // crossAxisAlignment:
                                              //     CrossAxisAlignment.start,
                                              // mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "CASHON",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20),
                                                ),
                                                Text(
                                                  "payments\nBank",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 8,
                                                  ),
                                                )
                                              ],
                                            ),
                                            const SizedBox(height: 6),
                                            RichText(
                                              text: const TextSpan(
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  // Add other styling properties as needed
                                                ),
                                                children: [
                                                  TextSpan(
                                                      text: 'Get 20% off on\n'),
                                                  TextSpan(
                                                      text:
                                                          'your Swiggy order'),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(height: 6),
                                            Container(
                                              decoration: BoxDecoration(
                                                color: Colors.orange,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: const Padding(
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 5.0,
                                                  vertical: 4,
                                                ),
                                                child: Text(
                                                  "Use Cashon Debit Card",
                                                  style: TextStyle(
                                                      fontSize: 8,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        const SizedBox(width: 30),
                                        Image.asset(
                                          "assets/image/atm-removebg-preview.png",
                                          scale: 3,
                                        ),
                                      ],
                                    )
                                  : index == 1
                                      ? Row(
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Container(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 4),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4),
                                                        color: Colors.white,
                                                      ),
                                                      child: const Row(
                                                        children: [
                                                          Text(
                                                            "CASHON",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 12),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    const SizedBox(width: 4),
                                                    Image.asset(
                                                      "assets/image/HDFC_Bank_Logo.svg.png",
                                                      scale: 29,
                                                    ),
                                                  ],
                                                ),
                                                const Text(
                                                  "credit card",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12),
                                                ),
                                                const SizedBox(height: 6),
                                                RichText(
                                                  text: const TextSpan(
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      // Add other styling properties as needed
                                                    ),
                                                    children: [
                                                      TextSpan(
                                                          text:
                                                              'Flat 20% Cashback\n'),
                                                      TextSpan(
                                                          text:
                                                              'on recharge & bills'),
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(height: 6),
                                                Container(
                                                  height: 20,
                                                  width: 50,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  child: const Center(
                                                    child: Text(
                                                      "Apply",
                                                      style: TextStyle(
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                            Image.asset(
                                              "assets/image/atm-removebg-preview.png",
                                              scale: 4,
                                            ),
                                          ],
                                        )
                                      : Row(
                                          children: [
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Image.asset(
                                                      "assets/image/aa.png",
                                                      scale: 1,
                                                    ),
                                                    RichText(
                                                      text: const TextSpan(
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          // Add other styling properties as needed
                                                        ),
                                                        children: [
                                                          TextSpan(
                                                              text: 'Cashon\n',
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      20)),
                                                          TextSpan(
                                                              text:
                                                                  'Insurance Broking'),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 6),
                                                const Text("Don't wait to get challaned",style: TextStyle(color: Colors.blue,fontSize: 15),),
                                                RichText(
                                                  text: const TextSpan(
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 15,fontWeight: FontWeight.normal
                                                      // Add other styling properties as needed
                                                    ),
                                                    children: [
                                                      TextSpan(
                                                          text: 'Get two wheeler\n'),
                                                      TextSpan(
                                                          text:
                                                          'insurance today'),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Image.asset("assets/image/car.png",scale: 1.6,),
                                          ],
                                        ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(00)),
        child: BottomNavigationBar(
            onTap: (value) {
              setState(() {});
              selectDashboard = value;
            },
            backgroundColor: const Color(0xff5a51b5),
            selectedLabelStyle: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            unselectedItemColor: Colors.white,
            selectedItemColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            selectedIconTheme: const IconThemeData(color: Colors.orange),
            //unselectedItemColor: Colors.grey,
            // unselectedFontSize: 12,
            // selectedFontSize: 12,
            unselectedLabelStyle: const TextStyle(
              fontSize: 12,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            currentIndex: selectDashboard,
            items: const [
              BottomNavigationBarItem(
                icon: Padding(
                    padding: EdgeInsets.symmetric(vertical: 6),
                    child: Icon(Icons.home)),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Padding(
                    padding: EdgeInsets.symmetric(vertical: 6),
                    child: Icon(Icons.phonelink_lock)),
                label: "My Locker",
              ),
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.symmetric(vertical: 6),
                    child: Icon(Icons.drive_file_move_outlined),
                  ),
                  label: "Drive Inn"),
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.symmetric(vertical: 6),
                    child: Icon(Icons.account_box_outlined),
                  ),
                  label: "Profile"),
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.symmetric(vertical: 6),
                    child: Icon(Icons.surround_sound),
                  ),
                  label: "Refer & Eran"),
            ]),
      ),
    );
  }
}
