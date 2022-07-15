import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:idosos/modules/pages/cd_prof.dart';
import 'package:idosos/modules/pages/selec_cd.dart';
import '../../Functions/Login.functions.dart';
import 'cd_resp.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> _fromState = GlobalKey<FormState>();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerSenha = TextEditingController();

  late bool _obscurePass;

  @override
  void initState() {
    super.initState();
    _obscurePass = true;
  }

  @override
  Widget build(BuildContext context) {
    final double largura = MediaQuery.of(context).size.width;
    final double altura = MediaQuery.of(context).size.height;
    return Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.greenAccent.shade200,
        //   title: Row(children: [
        //     Padding(
        //       padding: EdgeInsets.fromLTRB(95, 0, 0, 0),
        //       child: Text(
        //         'HealLife',
        //         style: TextStyle(
        //           fontSize: 40,
        //         ),
        //       ),
        //     ),
        //     Icon(
        //       Icons.healing,
        //       size: 50,
        //     ),
        //   ]),
        // ),
        backgroundColor: Theme.of(context).backgroundColor,
        body: SingleChildScrollView(
          child: Container(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                'assets/images/tcclogo.png',
                width: 300,
                height: 300,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                margin: EdgeInsets.all(20),
                child: Form(
                  key: _fromState,
                  child: Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: _controllerEmail,
                        validator: (value) =>
                            LoginFunctions().validarEmail(value!),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            errorStyle: TextStyle(fontSize: 15),
                            hintText: "exemplo@email.com",
                            hintStyle: TextStyle(
                              color: Colors.black,
                            ),
                            prefixIcon: Icon(Icons.email),
                            label: Text(
                              "E-mail:",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black),
                            )),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        controller: _controllerSenha,
                        validator: (value) =>
                            LoginFunctions().validarSenha(value!),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                        obscureText: _obscurePass,
                        decoration: InputDecoration(
                            errorStyle: TextStyle(fontSize: 15),
                            border: OutlineInputBorder(),
                            hintText: "Sua senha:",
                            hintStyle: TextStyle(
                              color: Colors.black,
                            ),
                            prefixIcon: Icon(Icons.key),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() => _obscurePass = !_obscurePass);
                              },
                              icon: _obscurePass
                                  ? Icon(Icons.visibility)
                                  : Icon(Icons.visibility_off),
                              iconSize: 30,
                            )),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    height: 35,
                  ),
                  Container(
                    width: largura / 1.4,
                    height: 45,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 52, 95, 212),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        )),
                    child: TextButton(
                      child: Text(
                        'Entrar',
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        if (_fromState.currentState!.validate()) {
                          print(_controllerEmail.text.trim());
                          print(_controllerSenha.text.trim());
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 27,
                    child: Text(
                      "Não possui uma conta? Cadastre-se",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Container(
                    width: largura / 1.4,
                    height: 45,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 182, 228, 236),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: TextButton(
                      child: Text(
                        'Cadastre-se',
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Select_Cd_Page()));
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            ],
          )),
        ));
  }
}
