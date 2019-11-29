import 'package:equaze/bloc/bloc.dart';
import 'package:equaze/repository/repository.dart';
import 'package:equaze/ui/dashboard_page.dart';
import 'package:equaze/ui/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  String _selectedInstitute = "Select Institute";
  String _selectedInstituteId;
  String _username;
  String _password;
  bool _passwordVisible = true;
  final formKey = GlobalKey<FormState>();
  LoginBloc _loginBloc = LoginBloc();

  @override
  initState() {
    getSharedPreferences("instituteName").then((result) {
      setState(() {
        _selectedInstitute = result ?? "Select Institute";
      });
    });
    getSharedPreferences("instituteId").then((result) {
      setState(() {
        _selectedInstituteId = result ?? "";
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<LoginBloc>(
        builder: (context) => _loginBloc,
        child: Container(
          padding: EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 20),
          decoration: BoxDecoration(color: Color(0xFFF5F5F5)),
          child: ListView(children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildLogo(),
                SizedBox(
                  height: 40,
                ),
                _buildWelcomeText(),
                SizedBox(
                  height: 40,
                ),
                Form(
                    key: formKey,
                    child: Theme(
                      data: ThemeData(
                          hintColor: Colors.white, primaryColor: Colors.blue),
                      child: Column(
                        children: <Widget>[
                          Material(
                            elevation: 1,
                            child: GestureDetector(
                              onTap: () {
                                Repository.getInstituteList().then(
                                  (val) {
                                    showDialog(
                                        context: context,
                                        child: SimpleDialog(
                                          title: Text("Select Institute"),
                                          children: <Widget>[
                                            Container(
                                              height: 600,
                                              width: 400,
                                              child: ListView.builder(
                                                  itemCount: val.length,
                                                  itemBuilder:
                                                      (BuildContext context,
                                                          int index) {
                                                    return SimpleDialogOption(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                          setState(() {
                                                            _selectedInstituteId =
                                                                val[index]
                                                                    .instituteId;
                                                            _selectedInstitute =
                                                                val[index].name;
                                                          });
                                                        },
                                                        child: Column(
                                                          children: <Widget>[
                                                            Text(
                                                              val[index].name,
                                                              style: TextStyle(
                                                                  fontSize: 18),
                                                            ),
                                                            SizedBox(
                                                              height: 5,
                                                            ),
                                                            Container(
                                                              width: double
                                                                  .maxFinite,
                                                              height: 1,
                                                              color: Colors
                                                                  .grey[200],
                                                            )
                                                          ],
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                        ));
                                                  }),
                                            )
                                          ],
                                        ));
                                  },
                                );
                              },
                              child: Container(
                                width: double.maxFinite,
                                padding: EdgeInsets.only(
                                    top: 20, bottom: 20, left: 10, right: 10),
                                child: Text(
                                  '$_selectedInstitute',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16),
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      color: Colors.white, width: 1.0),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Material(
                            elevation: 1,
                            child: TextFormField(
                              onSaved: (usernameValue) =>
                                  {_username = usernameValue},
                              validator: (val) =>
                                  val == "" ? "Enter a valid username" : null,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                labelText: "Username",
                                labelStyle: TextStyle(color: Colors.black),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 1.0)),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Material(
                            elevation: 1,
                            child: TextFormField(
                              obscureText: _passwordVisible,
                              onSaved: (passwordValue) =>
                                  {_password = passwordValue},
                              validator: (val) =>
                                  val == "" ? "Enter a valid password" : null,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                suffixIcon: IconButton(
                                  icon: Icon(_passwordVisible
                                      ? Icons.visibility_off
                                      : Icons.visibility),
                                  onPressed: ()=>_changePasswordVisibility(),
                                ),
                                labelText: "Password",
                                labelStyle: TextStyle(color: Colors.black),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 1.0)),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                "Forgot Password?",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontFamily: "Seoge UI"),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          BlocListener(
                            bloc: _loginBloc,
                            listener: (BuildContext context, LoginState state) {
                              if (state is LoginSuccessState) {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DashboardPage()));
                              }
                            },
                            child: BlocBuilder(
                              bloc: _loginBloc,
                              builder:
                                  (BuildContext context, LoginState state) {
                                if (state is InitialLoginState)
                                  return _buildButton("");
                                if (state is LoggingInState)
                                  return CircularProgressIndicator();
                                if (state is LoginSuccessState)
                                  return _buildButton("Login Successful");
                                else
                                  return _buildButton("Login Failed");
                              },
                            ),
                          )
                        ],
                      ),
                    )),
                SizedBox(
                  height: 20,
                ),
                _buildSignUpLink(),
              ],
            ),
          ]),
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Center(
        child: Image.asset(
      "assets/images/equaze_logo.png",
    ));
  }

  Widget _buildWelcomeText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Welcome",
          style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: "Roboto"),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          "Login to continue",
          style: TextStyle(
              color: Colors.grey,
              fontSize: 16,
              fontFamily: "Segoe UI",
              fontWeight: FontWeight.normal),
        )
      ],
    );
  }

  _buildSignUpLink() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'New User?',
          style: TextStyle(color: Colors.grey),
        ),
        GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SignupPage()));
            },
            child: Text(
              'Signup',
              style: TextStyle(color: Colors.black),
            )),
      ],
    );
  }

  Widget _buildButton(message) {
    Fluttertoast.showToast(msg: message);
    return RaisedButton(
      shape: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFB53C12)),
          borderRadius: BorderRadius.all(Radius.circular(40))),
      color: Color(0xFFB53C12),
      child: Padding(
        padding: const EdgeInsets.only(
            top: 20.0, bottom: 20.0, left: 50.0, right: 50),
        child: Text(
          "Login",
          style: TextStyle(
              color: Colors.white,
              fontFamily: "Rubik",
              fontWeight: FontWeight.bold,
              fontSize: 14),
        ),
      ),
      onPressed: () {
        if (formKey.currentState.validate() && _selectedInstituteId != "") {
          formKey.currentState.save();
          setStringInSharedPreferences("instituteId", _selectedInstituteId);
          setStringInSharedPreferences("instituteName", _selectedInstitute);
          setStringInSharedPreferences("username", _username);
          setBoolInSharedPreferences("isLoggedIn", true);
          _loginBloc.dispatch(GetLoginResponseModel(
              _selectedInstituteId, _username, _password));
        } else {
          Fluttertoast.showToast(msg: "Please fill all values.");
        }
      },
    );
  }

  @override
  void dispose() {
    _loginBloc.dispose();
    super.dispose();
  }

  _changePasswordVisibility() {
    setState(() {
      print("Changing password visible");
      _passwordVisible = !_passwordVisible;
    });
  }
}

Future<String> getSharedPreferences(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString(key);
}

setStringInSharedPreferences(String key, String value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString(key, value);
}

setBoolInSharedPreferences(String key, bool value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool(key, value);
}
