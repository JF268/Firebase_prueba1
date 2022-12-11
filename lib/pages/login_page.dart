import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tareas/pages/home_pages.dart';
import 'package:tareas/pages/register_page.dart';
import 'package:tareas/ui/general/colors.dart';
import 'package:tareas/ui/widgets/button_custom_widget.dart';
import 'package:tareas/ui/widgets/button_normal-widget.dart';
import 'package:tareas/ui/widgets/general_widgets.dart';
import 'package:tareas/ui/widgets/textfield_normal_widget.dart';
import 'package:tareas/ui/widgets/textfield_password_widget.dart';

class LoginPage extends StatefulWidget {
  

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  _login() async{
    try{
      if(formKey.currentState!.validate()){
        UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text, 
        password: _passwordController.text);

      if(userCredential.user != null){
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomePage()), (route) => false);
      }
      }
    } on FirebaseAuthException catch(error){
      if(error.code == "invalid-email"){
        showSnackBarError(context, "El correo electrónico es inválido");
      }else if(error.code == "user-not-found"){
        showSnackBarError(context, "El usuario no está registrado");
      }else if(error.code == "wrong-password"){
        showSnackBarError(context, "Contraseña incorrecta");
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                divider30(),
                SvgPicture.asset("assets/images/login.svg",
                height: 180.0,),
                divider20(),
                Text("Iniciar Sesión", style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                  color: kBrandPrymaryColor),),
                TextFieldNormalWidget(
                  hintText: "Correo", 
                  icon: Icons.email, 
                  controller: _emailController),
                divider20(),
                TextFieldPasswordWidget(controller: _passwordController),
                divider10(),
                ButtonCustomWidget(text: "Iniciar Sesión", 
                color: kBrandPrymaryColor, 
                icon: "check",
                onPressed: (){
                  _login();
                },),
                divider6(),
                Text("O ingresa con tus redes sociales"),
                divider6(),
                ButtonCustomWidget(
                  text: "Iniciar sesión con Google", 
                  color: Color(0xfff84b2a), 
                  icon: "google",
                  onPressed: (){},),
                divider6(),
                ButtonCustomWidget(
                  text: "Iniciar sesión con Facebook", 
                  color: Color(0xfff507CC0), 
                  icon: "facebook",
                  onPressed: (){},),
                divider10(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("¿No tienes cuenta?"),
                    divider10w(),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> RegisterPage()));
                      },
                      child: Text("Registrate",style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: kBrandPrymaryColor) ,)),
                  ],
                )
              ],
            ),
          ),
          padding: EdgeInsets.all(16.0)),
      ),
    );
  }
}