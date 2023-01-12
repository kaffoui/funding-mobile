import 'package:flutter/material.dart';
import 'package:lisocash/screens/auth/register/user_infos_screen.dart';
import 'package:lisocash/screens/home_screen.dart';
import 'package:lisocash/utils/my_buttons.dart';
import 'package:lisocash/utils/my_colors.dart';
import 'package:lisocash/utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.5),
          child: ListView(
            children: [
              const SizedBox(height: 40,),
              SizedBox(
                height: 100,
                child: Image.asset(
                  'assets/images/logo.png',
                  fit: BoxFit.contain,
                ),
              ),

              const SizedBox(height: 20,),
              const Text(
                'Connexion',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: MyColors.primary
                ),
              ),

              const SizedBox(height: 10,),

              const SizedBox(height: 40,),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: TextFormField(
                  cursorColor: MyColors.primary,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    
                    prefixIcon: const Icon(
                      Icons.email,
                      color: MyColors.primary,
                    ),
                    labelText: 'Email',
                    filled: true,
                    fillColor: MyColors.primary.withOpacity(0.1),
                    border: Utils.myOutlineBorder(),
                    enabledBorder: Utils.myOutlineBorder(),
                    focusedBorder: Utils.myOutlineBorder()
                  ),
                ),
              ),

              const SizedBox(height: 20,),

              TextFormField(
                obscureText: true,
                cursorColor: MyColors.primary,
                
                decoration: InputDecoration(
                  labelText: "Votre Mot de Passe",
                  
                  prefixIcon: const Icon(
                    Icons.lock,
                    color: MyColors.primary,
                  ),
                  suffixIcon: const Icon(
                    Icons.visibility,
                    color: MyColors.primary,
                  ),
                   filled: true,
                    fillColor: MyColors.primary.withOpacity(0.1),
                    border: Utils.myOutlineBorder(),
                    enabledBorder: Utils.myOutlineBorder(),
                    focusedBorder: Utils.myOutlineBorder()
                ),
              ),

              const SizedBox(height: 20,),
              Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              width: MediaQuery.of(context).size.width * 0.8,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(29),
                child: myButton(
                  "Connexion",
                  onPressed: () => Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen()
                    )
                  )
                )
              ),
              ),

              const SizedBox(height: 15,),

              Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  "Vous n'avez pas de compte ",
                  style: TextStyle(color: MyColors.primary),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (context) => const UserInfoscreen()
                    )
                  );
                  },
                  child: const Text(
                    "Inscrivez-vous",
                    style: TextStyle(
                      color: MyColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
              )
            ],
          ),
        ),
      ),
    
    );
  }

  
}