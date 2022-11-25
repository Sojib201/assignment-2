import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

MySnackBar(message, context) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
    duration: Duration(seconds: 3),
  ));
}

MyAlertDialog(context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Aler for Assignment!"),
          content: Text("Assignment Done?"),
          actions: [
            TextButton(
                onPressed: () {
                  MySnackBar("Assignment Done", context);
                  Navigator.pop(context);
                },
                child: Text("Yes")),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("No"))
          ],
        );
      });
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Assignment-3"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      drawer: Drawer(
        elevation: 500,
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.all(0),
              child: UserAccountsDrawerHeader(
                onDetailsPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SojibDetails()));
                },
                decoration: BoxDecoration(color: Colors.white),
                currentAccountPicture: Image.network(
                    "https://scontent.fdac135-1.fna.fbcdn.net/v/t39.30808-6/307007947_1148608179058883_5983143140396414337_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeHKfzebhRzz_t9BvjdPzmMaUhS65reBurhSFLrmt4G6uNURpDBnAh1d4IuxjdDzK-VtBuZVDj1liWhG7383W26H&_nc_ohc=Riy2O6RNyl8AX-ls6uZ&_nc_ht=scontent.fdac135-1.fna&oh=00_AfDyIuk-XIGK-2uxuvVurQPin7-YCZ8azeA77DcEEI7Zxg&oe=6385A44C"),
                accountEmail: Text(
                  "sojib@gmail.com",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
                accountName: Text(
                  "Sojib",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.call),
              title: Text("Call"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Center(
          child: ElevatedButton(
        onPressed: () {
          MyAlertDialog(context);
        },
        child: Text(
          "Click Me",
          style: TextStyle(color: Colors.yellowAccent),
        ),
      )),
    );
  }
}

class SojibDetails extends StatelessWidget {
  const SojibDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MyDetails Page"),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          "I am Sojib. I am from Pabna.\nI am a student of Daffodil International \nUniversity in CSE Department",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
