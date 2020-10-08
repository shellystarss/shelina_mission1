import 'package:path/path.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

TextEditingController nameCtrl = TextEditingController();
TextEditingController emailCtrl = TextEditingController();
TextEditingController passCtrl = TextEditingController();
String name, email, pass, agentName;

class _RegisterState extends State<Register> {
  List<Agent> agents = [
    Agent("Jett"),
    Agent("Phoenix"),
    Agent("Raze"),
    Agent("Reyna")
  ];

  Agent selectedAgent;

  List<DropdownMenuItem> generateItems(List<Agent> agents) {
    List<DropdownMenuItem> items = [];
    for (var item in agents) {
      items.add(DropdownMenuItem(
        child: Text(item.name),
        value: item,
      ));
    }
    return items;
  }

  successAlertDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Registration Successful"),
            content: Text(
                "Name : $name\nEmail : $email\npassword : $pass \nSelected Agent : $agentName"),
            actions: <Widget>[
              MaterialButton(
                onPressed: () {
                  Navigator.pop(context, true);
                  Navigator.pop(context, true);
                },
                elevation: 5,
                child: Text("OK"),
              )
            ],
          );
        });
  }

  failAlertDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Registration Failed"),
            content: Text("Please fill the empty field."),
            actions: <Widget>[
              MaterialButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  selectedAgent = null;
                },
                elevation: 5,
                child: Text("OK"),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Register',
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text('Register'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context, false),
          ),
          backgroundColor: const Color(0xFF6B1827),
        ),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [const Color(0xFF111723), const Color(0xFFF74050)],
                  begin: new Alignment(0.0, 0.0),
                  end: new Alignment(0.0, 2.8))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(25),
                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      focusColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      prefixIcon: Icon(
                        Icons.person_pin,
                        color: Colors.white,
                      ),
                      labelText: "Name",
                      labelStyle: TextStyle(color: Colors.white),
                      hintText: "Enter your name",
                      hintStyle: TextStyle(color: Colors.grey)),
                  controller: nameCtrl,
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.all(25),
                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      focusColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      prefixIcon: Icon(
                        Icons.mail,
                        color: Colors.white,
                      ),
                      labelText: "Email",
                      labelStyle: TextStyle(color: Colors.white),
                      hintText: "youremail@mail.com",
                      hintStyle: TextStyle(color: Colors.grey)),
                  controller: emailCtrl,
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.all(25),
                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      focusColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      prefixIcon: Icon(
                        Icons.vpn_key,
                        color: Colors.white,
                      ),
                      labelText: "password",
                      labelStyle: TextStyle(color: Colors.white),
                      hintText: "Enter your password",
                      hintStyle: TextStyle(color: Colors.grey)),
                  obscureText: true,
                  controller: passCtrl,
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
              ),
              Container(
                margin:
                    EdgeInsets.only(top: 20, left: 30, right: 30, bottom: 30),
                child: DropdownButton(
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      decorationColor: Colors.white),
                  hint: Text(
                    "Select Agent",
                    style: TextStyle(color: Colors.grey),
                  ),
                  dropdownColor: Colors.transparent,
                  value: selectedAgent,
                  isExpanded: true,
                  items: generateItems(agents),
                  onChanged: (item) {
                    setState(() {
                      selectedAgent = item;
                    });
                  },
                ),
              ),
              // Text((selectedAgent != null) ? selectedAgent.name : ""),
              Center(
                  child: Padding(
                      padding: EdgeInsets.all(50),
                      child: RaisedButton(
                        onPressed: () {
                          print(nameCtrl.text);
                          if (nameCtrl.text.isEmpty ||
                              emailCtrl.text.isEmpty ||
                              passCtrl.text.isEmpty ||
                              selectedAgent == null) {
                            failAlertDialog(context);
                          } else {
                            setState(() {
                              name = nameCtrl.text;
                              email = emailCtrl.text;
                              pass = passCtrl.text
                                  .replaceAll(RegExp(r'(?<=.{0}).(?=.*)'), '*');

                              agentName = selectedAgent.name;
                            });

                            successAlertDialog(context);
                            nameCtrl.clear();
                            emailCtrl.clear();
                            passCtrl.clear();
                          }
                        },
                        child: Text(
                          "Register",
                          style: TextStyle(fontSize: 20),
                        ),
                        textColor: Colors.white,
                        color: const Color(0xFF111723),
                      )))
            ],
          ),
        ),
      ),
    );
  }
}

class Agent {
  String name;
  Agent(this.name);
}
