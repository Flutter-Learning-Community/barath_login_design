// ignore_for_file: deprecated_member_use

import "package:flutter/material.dart";

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
      child: Scaffold(
          backgroundColor: Color.fromRGBO(40, 55, 77, 1.0),
          body: SingleChildScrollView(child: LoginPage())),
    );
  }
}

class LoginPage extends StatefulWidget {
  createState() => LoginState();
}

Widget CustomSizeBox({double height}) {
  return SizedBox(
    height: height,
  );
}

class LoginState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  bool loading = false;
  FocusNode emailNode;
  FocusNode passawordNode;

  @override
  BoxDecoration decoration = BoxDecoration();

  TextStyle CustomTextStyle() {
    return TextStyle(color: Colors.white30, fontSize: 20.0);
  }

  InputDecoration CustomTextDecoration({String text, IconData icon}) {
    return InputDecoration(
      labelStyle: TextStyle(color: Colors.white30),
      labelText: text,
      prefixIcon: Icon(icon, color: Colors.blueGrey[700]),
    );
  }

  Widget CustomSizeBox({double height}) {
    return SizedBox(
      height: 125.0,
    );
  }

  Widget LoginButton(BuildContext context) {
    return new SizedBox(
      height: 45.0,
      width: double.infinity,
      child: new RaisedButton(
        color: Color.fromRGBO(
          0,
          119,
          119,
          1.0,
        ),
        child: Text(
          "Login",
          style: TextStyle(color: Colors.white70),
        ),
        onPressed: () {
          FocusScope.of(context).requestFocus(new FocusNode());
          if (_formKey.currentState.validate()) {
            setState(() {
              loading = true;
            });
            Future.delayed(Duration(seconds: 0), () {
              setState(() {
                loading = false;
              });
              Scaffold.of(context).showSnackBar(new SnackBar(
                content: new Text("Login success"),
              ));
            });
          } else {
            setState(() {
              _autoValidate = true;
            });
          }
        },
      ),
    );
  }

  Widget LoginUi() {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          CustomSizeBox(height: 40.0),
          Container(
              height: 75.0,
              child: Icon(Icons.person,
                  size: 100,
                  color: Color.fromRGBO(
                    0,
                    119,
                    119,
                    1.0,
                  ))),
          CustomSizeBox(height: 50.0),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(
              children: <Widget>[
                Container(decoration: decoration),
                TextFormField(
                  style: CustomTextStyle(),
                  decoration:
                      CustomTextDecoration(icon: Icons.person, text: "Email"),
                  textCapitalization: TextCapitalization.none,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter email';
                    } else if (!new RegExp(
                            r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value)) {
                      return "Plase enter valid email";
                    }
                  },
                ),
                TextFormField(
                  enabled: true,
                  enableInteractiveSelection: true,
                  obscureText: true,
                  textInputAction: TextInputAction.done,
                  style: CustomTextStyle(),
                  focusNode: passawordNode,
                  decoration:
                      CustomTextDecoration(icon: Icons.lock, text: "Password"),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter password';
                    } else if (value.length < 6) {
                      return 'Password must be 6 digit';
                    }
                  },
                ),
                CustomSizeBox(height: 20.0),
                LoginButton(context),
                CustomSizeBox(height: 30.0),
                TextButton(
                  style: ButtonStyle(
                    overlayColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {}),
                  ),
                  onPressed: () {},
                  child: Text('Forgot Password?'),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[LoginUi(), Container()],
    );
  }
}
