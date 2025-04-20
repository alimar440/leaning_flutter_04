import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool seSouvenir =
      false; // Variable pour gérer l'état du switch "Se souvenir de moi"
  bool isVisible = false; // Variable pour gérer la visibilité du mot de passe
  Column buildColumnForm() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Champ de texte pour le numero d'utilisateur

        const TextField(
          decoration: InputDecoration(
            labelText: 'Numero client',
            border: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.orange,
                width: 2,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.deepOrange,
                width: 2.5,
              ),
            ),
            prefixIcon: Icon(Icons.person_2_outlined, color: Colors.deepOrange),
          ),
        ),

        // Champ de texte pour le mot de passe
        TextField(
          keyboardType: TextInputType.number,
          obscureText: !isVisible,
          decoration: InputDecoration(
            labelText: 'Mot de passe',
            prefixIcon: const Icon(
              Icons.lock_outline,
              color: Colors.deepOrange,
            ),
            suffixIcon: IconButton(
              icon: isVisible
                  ? const Icon(Icons.visibility)
                  : const Icon(Icons.visibility_off),
              onPressed: () {
                setState(() {
                  isVisible = !isVisible;
                });
              },
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.deepOrange,
                width: 2.5,
              ),
            ),
          ),
        ),

        // Champ de se souvenir de moi

        const SizedBox(height: 20),
        SwitchListTile(
          value: seSouvenir,
          onChanged: (value) {
            setState(() {
              seSouvenir = value;
            });
          },
          controlAffinity: ListTileControlAffinity.leading,
          title: const Text(
            'Se souvenir de moi',
          ),
          activeColor: Colors.deepOrange,
          activeTrackColor: Colors.orange[200],
        ),

        // Bouton de connexion
        Container(
          width: double.infinity,
          height: 40,
          margin: const EdgeInsets.only(top: 20),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepOrange, // couleur du bouton
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide.none, // même arrondi que le container
              ),
              elevation: 0, // optionnel pour éviter l'ombre
            ),
            onPressed: () {},
            child: const Text(
              "Connexion",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),

        //mot de passe oublié
        Container(
          margin: EdgeInsets.only(top: 10),
          alignment: Alignment.centerRight,
          child: Text(
            "Mot de passe oublié ?",
            style: TextStyle(color: Colors.blueAccent),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/login_background.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.white, // <- Couleur de l’icône leading
          ),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.menu_sharp),
            onPressed: () {},
          ),
          title: const Text(
            'Banque mobile',
            style: TextStyle(
                color: Colors.white, // <- Couleur du texte
                fontSize: 25,
                fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.deepOrange,
        ),
        body: Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 40),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.5),
              border: Border.all(
                color: Colors.white30,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: buildColumnForm(),
          ),
        ),
      ),
    );
  }
}
