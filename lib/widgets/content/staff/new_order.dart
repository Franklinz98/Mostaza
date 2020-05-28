import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mostaza/constants/app_icons_icons.dart';
import 'package:mostaza/constants/colors.dart';
import 'package:mostaza/screens/content/staff/search.dart';
import 'package:mostaza/widgets/components/button.dart';
import 'package:mostaza/widgets/components/input.dart';

class NewOrder extends StatefulWidget {
  final controllerId = TextEditingController();
  final controllerTable = TextEditingController();
  final controllerDiscount = TextEditingController();
  @override
  _NewOrderState createState() => _NewOrderState();
}

class _NewOrderState extends State<NewOrder> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              "Datos",
              style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w600, fontSize: 14),
            ),
          ),
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Input(
                      hintText: 'Id. del cliente',
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Por favor ingrese la identificación del cliente';
                        } else if (value.length < 8) {
                          return 'Ingrese un numero de identificación válido';
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
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Input(
                      hintText: 'No. Mesa',
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Por favor ingrese el numero de la mesa';
                        }
                        return null;
                      },
                      controller: widget.controllerTable,
                      inputType: TextInputType.number,
                      icon: Icon(
                        AppIcons.number,
                        size: 20.0,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Input(
                      hintText: 'Descuento',
                      validator: (value) {
                        if (value.length != 5 && !value.isEmpty) {
                          return 'Ingrese un código de descuento valido';
                        }
                        return null;
                      },
                      controller: widget.controllerDiscount,
                      icon: Icon(
                        AppIcons.price_tag,
                        size: 20.0,
                      )),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 12.0),
            child: Row(
              children: <Widget>[
                Text(
                  "Platos",
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600, fontSize: 14),
                ),
                Expanded(
                  child: Text(
                    "Total:",
                    textAlign: TextAlign.right,
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600, fontSize: 14),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "\$21.800",
                  style: GoogleFonts.openSans(
                    fontWeight: FontWeight.w300,
                    fontSize: 12,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (_, index) {
                if (index != 1) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xffffffff),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0.00, 3.00),
                            color: Color(0xff000000).withOpacity(0.16),
                            blurRadius: 10,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(8.00),
                      ),
                      child: ListTile(
                        dense: true,
                        leading: Text(
                          "2",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        ),
                        title: Text(
                          "Ejecutivo de Pollo",
                          style: GoogleFonts.openSans(
                            fontWeight: FontWeight.w300,
                            fontSize: 12,
                          ),
                        ),
                        trailing: IconButton(
                            icon: Icon(
                              Icons.remove_circle_outline,
                              color: AppColors.dixie,
                            ),
                            onPressed: () {}),
                      ),
                    ),
                  );
                } else {
                  return IconButton(
                      icon: Icon(
                        Icons.add_circle,
                        color: AppColors.dixie,
                        size: 42.0,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SearchMenu()),
                        );
                      });
                }
              },
              itemCount: 2,
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 16.0, bottom: 8.0, right: 8.0),
                  child: Button(
                    height: 38.0,
                    color: AppColors.white,
                    onPressed: () {},
                    child: Text(
                      'Cancelar',
                      style: GoogleFonts.montserrat(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          textStyle: TextStyle(color: Colors.black)),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 16.0, bottom: 8.0, left: 8.0),
                  child: Button(
                    height: 38.0,
                    color: AppColors.dixie,
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        // TODO login stuff
                      }
                    },
                    child: Text(
                      'Confirmar',
                      style: GoogleFonts.montserrat(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          textStyle: TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
