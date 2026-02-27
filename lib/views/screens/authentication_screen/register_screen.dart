import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/auth_controller.dart';
import 'package:flutter_application_1/views/screens/authentication_screen/login_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _forKey = GlobalKey<FormState>();

  final AuthController _authController = AuthController();
  bool _isLoading = false;
  late String email;

  late String passwotd;

  late String fullName;
  bool _isObsure = true;
  registerUser() async {
    BuildContext localContext = context;
    setState(() {
      _isLoading = true;
    });
    String res = await _authController.registerNewUser(
      email,
      fullName,
      passwotd,
    );
    if (res == 'success') {
      Future.delayed(Duration.zero, () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return LoginScreen();
            },
          ),
        );
        ScaffoldMessenger.of(localContext).showSnackBar(
          SnackBar(
            content: Text('congratulation account have created for you '),
          ),
        );
      });
    } else {
      setState(() {
        _isLoading = false;
      });
      Future.delayed(Duration.zero, () {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(res)));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.93),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _forKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Login your Acount..",

                  style: GoogleFonts.getFont(
                    'Lato',
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    letterSpacing: 1,
                  ),
                ),
                Text(
                  "To explore the world ",
                  style: GoogleFonts.getFont(
                    'Lato',
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold,
                    fontSize: 9,
                  ),
                ),
                Image.asset(
                  'assets/images/Illustration.png',
                  width: 300,
                  height: 300,
                ),
                SizedBox(height: 5),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Name",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    onChanged: (value) {
                      fullName = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'enter a value';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      fillColor: Colors.white24,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(9),
                      ),
                      labelText: 'Enter a Full Name...',
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'assets/icons/user.png',
                          width: 5,
                          height: 5,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Email',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    onChanged: (value) {
                      email = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'enter a full Email';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      fillColor: Colors.white24,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(9),
                      ),
                      // focusedBorder: InputBorder.none,
                      // enabledBorder: InputBorder.none,
                      labelText: 'enter a Email.',
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'assets/icons/email.png',
                          width: 5,
                          height: 1,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Passowerd",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    obscureText: _isObsure,
                    onChanged: (value) {
                      passwotd = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'enter a password';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      fillColor: Colors.white24,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(9),
                      ),
                      labelText: 'Enter a password.',
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'assets/icons/password.png',
                          width: 5,
                          height: 5,
                        ),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _isObsure = !_isObsure;
                          });
                        },
                        icon: Icon(
                          _isObsure ? Icons.visibility : Icons.visibility_off,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    if (_forKey.currentState!.validate()) {
                      registerUser();
                    }
                  },
                  child: Container(
                    width: 310,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: LinearGradient(
                        colors: [Colors.blue, Colors.lightBlue],
                      ),
                    ),
                    child: Center(
                      child: _isLoading
                          ? CircularProgressIndicator(color: Colors.white)
                          : Text(
                              'Sign up',
                              style: GoogleFonts.getFont(
                                'Lato',
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an  account ?...',
                      style: GoogleFonts.roboto(fontWeight: FontWeight.w300),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return LoginScreen();
                            },
                          ),
                        );
                      },
                      child: Text(
                        "Sing Ip",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
