import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mostaza/constants/app_icons_icons.dart';
import 'package:mostaza/constants/colors.dart';
import 'package:mostaza/widgets/components/button.dart';
import 'package:mostaza/widgets/components/header.dart';
import 'package:mostaza/widgets/components/input.dart';
import 'package:mostaza/widgets/components/leading.dart';

class SignUp extends StatefulWidget {
  final VoidCallback onBackPressed;

  const SignUp({Key key, @required this.onBackPressed}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final controllerName = TextEditingController();
  final controllerId = TextEditingController();
  final controllerPhone = TextEditingController();
  final controllerAddress = TextEditingController();
  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();
  SignUpA _signUpA;
  SignUpB _signUpB;
  Widget _signUpStage;

  Widget _switchStage(Function callback) {
    if (_signUpStage == null) {
      _signUpA = SignUpA(
          title: '¡Empecemos!',
          description: 'Ingresa tus datos para que podamos conocerte mejor',
          controllerName: controllerName,
          controllerId: controllerId,
          controllerPhone: controllerPhone,
          controllerAddress: controllerAddress,
          onPressed: () {
            setState(() {
              _signUpStage = _signUpB;
            });
          });
      _signUpB = SignUpB(
          title: '¡Falta poco!',
          description: 'Ingresa tu correo electrónico y crea una contraseña',
          controllerEmail: controllerEmail,
          controllerPassword: controllerPassword,
          onPressed: callback);
      _signUpStage = _signUpA;
    }
    return _signUpStage;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Header(
                    title: "REGISTRARSE",
                    icon: Icon(
                      Icons.arrow_back,
                      color: AppColors.dixie,
                    ),
                    onPressed: _signUpStage == _signUpA
                        ? widget.onBackPressed
                        : () {
                            setState(() {
                              _signUpStage = _signUpA;
                            });
                          }),
                Expanded(
                  child: Center(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            AnimatedSwitcher(
                              duration: const Duration(milliseconds: 750),
                              child: _switchStage(() {
                                final snackBar =
                                    SnackBar(content: Text('Validated!'));
                                // Find the Scaffold in the widget tree and use it to show a SnackBar.
                                Scaffold.of(context).showSnackBar(snackBar);
                              }),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SignUpA extends StatefulWidget {
  final VoidCallback onPressed;
  final TextEditingController controllerName;
  final TextEditingController controllerId;
  final TextEditingController controllerPhone;
  final TextEditingController controllerAddress;
  final String title;
  final String description;
  const SignUpA(
      {Key key,
      @required this.title,
      @required this.description,
      @required this.controllerName,
      @required this.controllerId,
      @required this.controllerPhone,
      @required this.controllerAddress,
      @required this.onPressed})
      : super(key: key);
  @override
  _SignUpAState createState() => _SignUpAState();
}

class _SignUpAState extends State<SignUpA> {
  final _formKeyA = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Leading(
            title: widget.title,
            description: widget.description,
            imagePath: 'assets/images/person_logo.png'),
        Form(
          key: _formKeyA,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Input(
                    hintText: 'Nombre Completo',
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Por favor ingrese su nombre';
                      }
                      return null;
                    },
                    controller: widget.controllerName,
                    icon: Icon(
                      AppIcons.person,
                      size: 20.0,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Input(
                    hintText: 'C.C / T.I',
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Por favor ingrese su número de identificación';
                      } else if (value.length < 5) {
                        return 'Ingrese un número de identificación válido';
                      }
                      return null;
                    },
                    controller: widget.controllerId,
                    inputType: TextInputType.number,
                    icon: Icon(
                      AppIcons.person_id,
                      size: 20.0,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Input(
                    hintText: 'Teléfono',
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Por favor ingrese su número de teléfono';
                      } else if (value.length != 10) {
                        return 'Ingrese un número de teléfono válido';
                      }
                      return null;
                    },
                    controller: widget.controllerPhone,
                    inputType: TextInputType.phone,
                    icon: Icon(
                      AppIcons.phone,
                      size: 20.0,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Input(
                    hintText: 'Dirección',
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Por favor ingrese su dirección';
                      }
                      return null;
                    },
                    controller: widget.controllerAddress,
                    icon: Icon(
                      AppIcons.place,
                      size: 20.0,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Button(
                  height: 52.0,
                  color: AppColors.dixie,
                  onPressed: () {
                    if (_formKeyA.currentState.validate()) {
                      widget.onPressed();
                    }
                  },
                  child: Text(
                    'SIGUIENTE',
                    style: GoogleFonts.montserrat(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        textStyle: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SignUpB extends StatefulWidget {
  final VoidCallback onPressed;
  final TextEditingController controllerEmail;
  final TextEditingController controllerPassword;
  final String title;
  final String description;
  const SignUpB(
      {Key key,
      @required this.title,
      @required this.description,
      @required this.controllerEmail,
      @required this.controllerPassword,
      @required this.onPressed})
      : super(key: key);
  @override
  _SignUpBState createState() => _SignUpBState();
}

class _SignUpBState extends State<SignUpB> {
  final _formKeyB = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Leading(
            title: widget.title,
            description: widget.description,
            imagePath: 'assets/images/person_logo.png'),
        Form(
          key: _formKeyB,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Input(
                    hintText: 'Correo Electrónico',
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Por favor ingrese su correo electrónico';
                      } else if (!value.contains('@')) {
                        return 'Por favor ingrese un correo electrónico válido';
                      }
                      return null;
                    },
                    controller: widget.controllerEmail,
                    inputType: TextInputType.emailAddress,
                    icon: Icon(
                      AppIcons.email,
                      size: 20.0,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Input(
                    hintText: 'Contraseña',
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Por favor ingrese su contraseña';
                      } else if (value.length < 6) {
                        return 'La contraseña de tener al menos 6 caracteres';
                      }
                      return null;
                    },
                    controller: widget.controllerPassword,
                    obscureText: true,
                    icon: Icon(
                      AppIcons.password,
                      size: 20.0,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Button(
                  height: 52.0,
                  color: AppColors.dixie,
                  onPressed: () {
                    if (_formKeyB.currentState.validate()) {
                      widget.onPressed();
                    }
                  },
                  child: Text(
                    'ACEPTAR',
                    style: GoogleFonts.montserrat(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        textStyle: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
