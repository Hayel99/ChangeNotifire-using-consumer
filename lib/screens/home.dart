import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => Model(),
        child: Scaffold(
            appBar: AppBar(
                title: Text("Provider"),
                backgroundColor: Colors.red,
                automaticallyImplyLeading: false,
                centerTitle: true),
            body: Consumer<Model>(
              builder: (context, model, child) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${model.textOne}",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      MaterialButton(
                        onPressed: () {
                            model.changeName();
                            print(model.textOne);
                          
                          
                        },
                        child: Text("Do Something"),
                        color: Colors.red,
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(59)),
                      )
                    ],
                  ),
                );
              },
            )));
  }
}

class Model extends ChangeNotifier {
  String textOne = "Welcome";
  changeName() {
    textOne = "Hello World";
    notifyListeners();
  }
  
}
