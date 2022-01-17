import 'package:flutter/material.dart';
import 'package:flutter_form_authorization/model/user.dart';
import 'package:flutter_form_authorization/page/user_page_info.dart';

class PageAuthorization extends StatefulWidget {
  const PageAuthorization({Key? key}) : super(key: key);

  @override
  _PageAuthorizationState createState() => _PageAuthorizationState();
}

class _PageAuthorizationState extends State<PageAuthorization> {
  bool _hidePass = true;

  final _formKey = GlobalKey<FormState>();

  final _mailController = TextEditingController();
  final _passwordController = TextEditingController();

  User newUser = User();

  final _mailFocus = FocusNode();
  final _passFocus = FocusNode();

  @override
  void dispose() {
    _mailController.dispose();
    _passwordController.dispose();
    _mailFocus.dispose();
    _passFocus.dispose();

    super.dispose();
  }

  void _fieldFocuseChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 16));

    return Scaffold(
      body: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.only(
              top: 200,
              left: 40,
              right: 40,
            ),
            children: [
              TextFormField(
                focusNode: _mailFocus,
                autofocus: true,
                onFieldSubmitted: (_) {
                  _fieldFocuseChange(context, _mailFocus, _passFocus);
                },
                controller: _mailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter Email@adress',
                ),
                keyboardType: TextInputType.emailAddress,
                validator: _validMail,
                onSaved: (value) => newUser.email = value!,
              ),
              const SizedBox(height: 20),
              TextFormField(
                focusNode: _passFocus,
                controller: _passwordController,
                obscureText: _hidePass,
                decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Use 8 or more symbols',
                    suffixIcon: IconButton(
                      icon: Icon(
                          _hidePass ? Icons.visibility : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _hidePass = !_hidePass;
                        });
                      },
                    )),
                validator: _validPassword,
                onSaved: (value) => newUser.password = value!,
              ),
              const SizedBox(height: 20),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ElevatedButton(
                    style: style,
                    onPressed: _submitForm,
                    child: const Text('Login'),
                  ),
                ],
              ),
            ],
          )),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UserPageInfo(
              userInfo: newUser,
            ),
          ));
      print('Form is valid');
      print('Mail: ${_mailController.text}');
      print('Password: ${_passwordController.text}');
    } else {
      print('Form is not valid! Please review and correct');
    }
  }

  String? _validMail(String? value) {
    if (value!.isEmpty) {
      return 'Feeld is empty.';
    } else if (!_mailController.text.contains('@')) {
      return 'Not a valid email address';
    } else {
      return null;
    }
  }

  String? _validPassword(String? value) {
    if (value!.isEmpty) {
      return 'Feeld is empty.';
    } else if (_passwordController.text.length < 8) {
      return 'Password too short';
    } else {
      return null;
    }
  }
}
