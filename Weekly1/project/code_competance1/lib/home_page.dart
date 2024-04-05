import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class Contact {
  final String username;
  final String email;
  final String message;

  Contact({
    required this.username,
    required this.email,
    required this.message,
  });

  @override
  String toString() {
    return '{Name: $username, Email: $email, Message: $message}\n';
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  String _name = "";
  String? _errorName;
  String _email = "";
  String? _errorEmail;
  String _message = "";
  String? _errorMessage;

  List<Contact> contacts = [];

  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logojantune.png',
              width: 40,
              height: 40,
            ),
            const Text(
              'Jantune',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        backgroundColor: Colors.blue,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(right: 20, left: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.only(right: 16, left: 16),
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/login image.png',
                      height: 140,
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    const Expanded(
                      child: Text(
                        'Suarakan Kesehatan Jantungmu dengan Early Detection Heart Disease App',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        softWrap: true,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    )
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Ayo Tes',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          'Kardiovaskular',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              //backgroundColor: Colors.blue,
                              ),
                          child: const Text(
                            'Cek Sekarang',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                    Image.asset(
                      'assets/doctor.png',
                      height: 110,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              const Center(
                child: Column(
                  children: [
                    Text(
                      'Contact us',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Jangan ragu untuk menghubungi kami jika Anda memiliki pertanyaan, saran, atau masukan.',
                      textAlign: TextAlign.center,
                     
                    )
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Name:'),
                      ],
                    ),
                    inputName(),
                    const SizedBox(height: 20),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Email:'),
                      ],
                    ),
                    inputEmail(),
                    const SizedBox(height: 20),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Message:'),
                      ],
                    ),
                    inputMessage(),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            if (_errorName == null &&
                                _errorEmail == null &&
                                _errorMessage == null) {
                              if (selectedIndex != null) {
                                contacts[selectedIndex!] = Contact(
                                  username: nameController.text,
                                  email: emailController.text,
                                  message: messageController.text,
                                );
                              } else {
                                contacts.add(
                                  Contact(
                                    username: nameController.text,
                                    email: emailController.text,
                                    message: messageController.text,
                                  ),
                                );
                              }
                            }
                            setState(() {});
                            // ignore: avoid_print
                            print(contacts);
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text(
                                    'Data yang Anda masukkan:',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  content: SingleChildScrollView(
                                    child: ListBody(
                                      children: <Widget>[
                                        Text('Nama: $_name'),
                                        Text('Email: $_email'),
                                        Text('Message: $_message'),
                                      ],
                                    ),
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('OK'),
                                    ),
                                  ],
                                );
                              },
                            );

                            clearController();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                          ),
                          child: const Text(
                            'Submit',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void clearController() {
    nameController.clear();
    emailController.clear();
    messageController.clear();
  }

  TextFormField inputName() {
    return TextFormField(
      controller: nameController,
      onChanged: (String value) {
        _name = value;
        if (_name.isEmpty) {
          _errorName = 'Nama harus diisi';
        } else if (value.trim().split(' ').length < 2) {
          _errorName = 'Nama harus terdiri dari minimal 2 kata';
        } else {
          bool isValid = true;
          List<String> words = value.trim().split(' ');
          for (String word in words) {
            if (RegExp(r'[0-9\W]').hasMatch(word)) {
              isValid = false;
              _errorName =
                  'Nama tidak boleh mengandung angka atau karakter khusus';
              break;
            } else if (!RegExp(r'^[A-Z][a-z]*$').hasMatch(word)) {
              isValid = false;
              _errorName = 'Setiap kata harus dimulai dengan huruf kapital';
              break;
            }
          }
          if (isValid) {
            _errorName = null;
          }
        }
        setState(() {});
      },
      decoration: InputDecoration(
        hintText: 'Insert Your Name',
        border: const OutlineInputBorder(),
        errorText: _errorName,
      ),
    );
  }

  TextFormField inputEmail() {
    return TextFormField(
      controller: emailController,
      onChanged: (String value) {
        _email = value;
        if (_email.isEmpty) {
          _errorEmail = 'Email harus diisi';
        } else if (!EmailValidator.validate(value)) {
          _errorEmail = 'Email tidak valid';
        } else {
          _errorEmail = null;
          assert(EmailValidator.validate(value));
        }

        setState(() {});
      },
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'Insert Your Email',
        border: const OutlineInputBorder(),
        errorText: _errorEmail,
      ),
    );
  }

  TextFormField inputMessage() {
    return TextFormField(
      controller: messageController,
      onChanged: (String value) {
        _message = value;
        if (_message.isEmpty) {
          _errorMessage = 'Pesan harus diisi';
        } else {
          _errorMessage = null;
        }

        setState(() {});
      },
      maxLines: null,
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
        hintText: 'Insert Your Message',
        border: const OutlineInputBorder(),
        errorText: _errorMessage,
      ),
    );
  }
}
