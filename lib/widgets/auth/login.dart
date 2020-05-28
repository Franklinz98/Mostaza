import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mostaza/backend/auth.dart';
import 'package:mostaza/constants/app_icons_icons.dart';
import 'package:mostaza/constants/colors.dart';
import 'package:mostaza/constants/user_type.dart';
import 'package:mostaza/screens/content/costumer/container.dart';
import 'package:mostaza/screens/content/staff/container.dart';
import 'package:mostaza/widgets/components/button.dart';
import 'package:mostaza/widgets/components/header.dart';
import 'package:mostaza/widgets/components/input.dart';
import 'package:mostaza/widgets/components/leading.dart';
import 'package:mostaza/widgets/components/linked_text.dart';

class Login extends StatelessWidget {
  final controllerInput = TextEditingController();
  final controllerPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final int type;
  final VoidCallback onBackPressed;
  final VoidCallback onSignUpShow;
  final VoidCallback onForgottenShow;
  Login(
      {Key key,
      @required this.type,
      @required this.onBackPressed,
      @required this.onSignUpShow,
      @required this.onForgottenShow})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      key: _scaffoldKey,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Header(
              title: 'INICIAR SESIÓN',
              icon: Icon(
                Icons.arrow_back,
                color: AppColors.dixie,
              ),
              onPressed: this.onBackPressed,
            ),
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Leading(
                          title: 'Ingresa tus credenciales',
                          description:
                              'Necesitamos saber que todo está en orden, por favor ingresa tus datos',
                          imagePath: this.type == 0
                              ? 'assets/images/person_logo.png'
                              : 'assets/images/employee_logo.png'),
                      Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
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
                                controller: this.controllerInput,
                                inputType: TextInputType.emailAddress,
                                icon: Icon(
                                  this.type == 0
                                      ? AppIcons.email
                                      : AppIcons.fingerprint,
                                  size: 20.0,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
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
                                  controller: this.controllerPassword,
                                  obscureText: true,
                                  icon: Icon(
                                    AppIcons.password,
                                    size: 20.0,
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 16.0, bottom: 12.0),
                              child: Button(
                                height: 52.0,
                                color: AppColors.dixie,
                                onPressed: () {
                                  if (_formKey.currentState.validate()) {
                                    // TODO login stuff
                                    this._scaffoldKey.currentState.showSnackBar(
                                        SnackBar(
                                            content:
                                                Text("Iniciando Sesion..")));
                                    login(this.controllerInput.text,
                                            this.controllerPassword.text)
                                        .then(
                                      (user) {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => user.type ==
                                                    UserType.costumer
                                                ? UserContainer(user: user)
                                                : StaffContainer(user: user),
                                          ),
                                        );
                                      },
                                    ).catchError(
                                      () {},
                                    );
                                  }
                                },
                                child: Text(
                                  'ACEPTAR',
                                  style: GoogleFonts.montserrat(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      textStyle:
                                          TextStyle(color: Colors.white)),
                                ),
                              ),
                            ),
                            this.type == 0
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        "¿No tienes cuenta? ",
                                        style: GoogleFonts.montserrat(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 13,
                                            textStyle: TextStyle(
                                                color: AppColors.black)),
                                      ),
                                      LinkedText(
                                        text: " Regístrate",
                                        textStyle: GoogleFonts.montserrat(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 13,
                                            textStyle: TextStyle(
                                                color: AppColors.dixie)),
                                        onTap: this.onSignUpShow,
                                      ),
                                    ],
                                  )
                                : Container(width: 0, height: 0)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              alignment: Alignment(0.0, 0.0),
              child: LinkedText(
                text: "¿Olvidaste tu contraseña?",
                textStyle: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                    textStyle: TextStyle(color: AppColors.dixie)),
                onTap: this.onForgottenShow,
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
