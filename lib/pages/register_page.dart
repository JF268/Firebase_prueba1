import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tareas/ui/general/colors.dart';
import 'package:tareas/ui/widgets/button_custom_widget.dart';
import 'package:tareas/ui/widgets/general_widgets.dart';
import 'package:tareas/ui/widgets/textfield_normal_widget.dart';
import 'package:tareas/ui/widgets/textfield_password_widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final keyForm = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _fullnameController = TextEditingController();

  _registerUser() async{
    try{

      if(keyForm.currentState!.validate()){
       UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: _emailController.text, 
      password: _passwordController.text,
      ); 
      }
    }on FirebaseAuthException catch(error){
      if(error.code == "weak-password"){
        showSnackBarError(context, "La contraseña es muy débil");
      }else if(error.code == "email-already-in-use");
      showSnackBarError(context, "El correo electrónico está en uso");
    }
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: keyForm,
            child: Column(
              children: [
                divider30(),
                SvgPicture.asset("assets/images/register.svg",
                height: 180.0,),
                divider20(),
                Text("Regístrate", style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                  color: kBrandPrymaryColor),),
                TextFieldNormalWidget(
                  hintText: "Nombre Completo", 
                  icon: Icons.email, 
                  controller: _fullnameController),
                TextFieldNormalWidget(
                  hintText: "Correo", 
                  icon: Icons.email, 
                  controller: _emailController),
                divider20(),
                TextFieldPasswordWidget(controller: _passwordController),
                divider10(),
                ButtonCustomWidget(text: "Registrate", 
                color: kBrandPrymaryColor, 
                icon: "check",
                onPressed: (){
                  _registerUser();
                },),  
            ]),
          ),

        ),
      ),
    );
  }
}