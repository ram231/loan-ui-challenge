import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hiram/routes/index.dart';

class HiRamLoginScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primaryColor: Color(0xFF7497FF),
        accentColor: Color(0xFFFFDC74),
        accentTextTheme: GoogleFonts.ralewayTextTheme(
          TextTheme(
            bodyText1: TextStyle(
              color: Color(0xFF1944C3),
            ),
          ),
        ),
        primaryTextTheme: GoogleFonts.ralewayTextTheme(),
      ),
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Color(0xFF7497FF),
          body: GestureDetector(
              onTap: () {
                final currentFocus = FocusScope.of(context);

                if (!currentFocus.hasPrimaryFocus) {
                  if (!currentFocus.hasPrimaryFocus && currentFocus.hasFocus) {
                    currentFocus.unfocus();
                    FocusManager.instance.primaryFocus.unfocus();
                  }
                }
              },
              child: HiRamLoginBody()),
        ),
      ),
    );
  }
}

class HiRamLoginBody extends StatelessWidget {
  const HiRamLoginBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            SizedBox(height: 48),
            SizedBox(
              child: SvgPicture.asset(
                'assets/ram-logo.svg',
                height: size.height / 6,
                width: size.width,
                color: Colors.white,
                fit: BoxFit.none,
              ),
            ),
            Text(' HiRAM ',
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'baybayin',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                )),
            Text(
              'HiRAM',
              style: Theme.of(context).accentTextTheme.headline2.copyWith(
                    color: Color(0xFFFFDC74),
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Text(
              'Keep track of your expense',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFFFFEE74),
              ),
            ),
            HiRamLoginForm(),
          ],
        ),
      ),
    );
  }
}

class HiRamLoginForm extends StatefulWidget {
  HiRamLoginForm({
    Key key,
  }) : super(key: key);

  @override
  _HiRamLoginFormState createState() => _HiRamLoginFormState();
}

class _HiRamLoginFormState extends State<HiRamLoginForm> {
  final GlobalKey<FormState> _formkey = GlobalKey();
  TextEditingController _usernameController, _passwordController;
  @override
  void initState() {
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(8),
      width: size.width,
      height: size.height / 1.8,
      child: Card(
        elevation: 6,
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16.0,
                ),
                child: Text(
                  'LOGIN WITH YOUR ACCOUNT',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF5680FF),
                  ),
                ),
              ),
              HiRamTextFormField(
                controller: _usernameController,
                hintText: 'Username',
                errorText: '*Username Required!',
              ),
              HiRamPasswordTextField(
                  passwordController: _passwordController,
                  onSubmit: (value) {
                    if (_formkey.currentState.validate()) {
                      _formkey.currentState.save();
                      Navigator.of(context).pushNamed(routeDashboard);
                    }
                  }),
              Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'FORGOT PASSWORD?',
                    style: Theme.of(context).textTheme.subtitle1.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          decoration: TextDecoration.underline,
                        ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (_formkey.currentState.validate()) {
                    _formkey.currentState.save();
                    Navigator.of(context).pushNamed(routeDashboard);
                  }
                },
                child: Container(
                  width: size.width,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  height: 40,
                  decoration: BoxDecoration(
                    color: Color(0xFF7497FF),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      'LOGIN',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: HiRamSignUpButton(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class HiRamSignUpButton extends StatelessWidget {
  const HiRamSignUpButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: RichText(
        text: TextSpan(
          style: Theme.of(context).accentTextTheme.bodyText1,
          children: [
            TextSpan(
              text: 'NO ACCOUNT? ',
              style: TextStyle(
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: 'SIGN UP HERE',
              style: TextStyle(
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HiRamPasswordTextField extends StatefulWidget {
  const HiRamPasswordTextField({
    Key key,
    @required TextEditingController passwordController,
    this.onSubmit,
  })  : _passwordController = passwordController,
        super(key: key);

  final TextEditingController _passwordController;
  final Function(String) onSubmit;
  @override
  _HiRamPasswordTextFieldState createState() => _HiRamPasswordTextFieldState();
}

class _HiRamPasswordTextFieldState extends State<HiRamPasswordTextField> {
  bool _hidePassworod = true;

  @override
  Widget build(BuildContext context) {
    return HiRamTextFormField(
      controller: widget._passwordController,
      hintText: 'Password',
      errorText: '*Password Required!',
      obscureText: _hidePassworod,
      onSubmit: widget.onSubmit,
      suffixIcon: GestureDetector(
        onTap: () {
          setState(() {
            _hidePassworod = !_hidePassworod;
          });
        },
        child: Icon(
          _hidePassworod ? Icons.visibility_off : Icons.visibility,
          color: Colors.grey,
          size: 16,
        ),
      ),
    );
  }
}

class HiRamTextFormField extends StatelessWidget {
  const HiRamTextFormField({
    Key key,
    this.controller,
    this.hintText,
    this.errorText,
    this.suffixIcon,
    this.obscureText,
    this.onChanged,
    this.validator,
    this.onSubmit,
  }) : super(key: key);
  final TextEditingController controller;
  final String hintText;
  final String errorText;
  final Widget suffixIcon;
  final bool obscureText;
  final ValueChanged onChanged;
  final String Function(String) validator;
  final Function(String) onSubmit;
  @override
  Widget build(BuildContext context) {
    final accentTextTheme = Theme.of(context).accentTextTheme;
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8,
      ),
      child: TextFormField(
        onSaved: (value) => controller.text = value,
        onChanged: onChanged,
        onFieldSubmitted: onSubmit,
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[300],
            contentPadding: EdgeInsets.symmetric(
              horizontal: 12,
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none),
            hintText: hintText,
            hintStyle: accentTextTheme.subtitle1.copyWith(
              fontWeight: FontWeight.w400,
              color: Colors.black38,
            ),
            suffix: suffixIcon),
        obscureText: obscureText ?? false,
        validator: validator ??
            (value) {
              if (errorText == null || errorText.isEmpty) {
                return null;
              }
              if (value.isEmpty) return errorText;
              return null;
            },
      ),
    );
  }
}
