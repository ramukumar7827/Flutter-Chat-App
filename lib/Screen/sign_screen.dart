import 'package:flutter/material.dart';
import 'package:practice/utils/util.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:practice/utils/colors.dart';
import 'package:practice/widgets/text_field.dart';
import 'package:practice/Screen/login_Screen.dart';
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';

class SignScreen extends StatefulWidget {
  const SignScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return _SignScreen();
  }
}

class _SignScreen extends State<SignScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  Uint8List? _image;
  selectImage() async {
    // final ImagePicker img = ImagePicker();
    // XFile? im = await img.pickImage(source: ImageSource.gallery);

    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
            child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(flex: 2, child: Container()),
                  SvgPicture.asset(
                    'assets/images/ic_instagram.svg',
                    height: 64,
                    color: primaryColor,
                  ),
                  const SizedBox(
                    height: 64,
                  ),
                  Stack(
                    children: [
                      _image != null
                          ? CircleAvatar(
                              radius: 64,
                              backgroundImage: MemoryImage(_image!),
                              backgroundColor: Colors.red,
                            )
                          : const CircleAvatar(
                              radius: 64,
                              backgroundImage: NetworkImage(
                                  'https://i.stack.imgur.com/l60Hf.png'),
                              backgroundColor: Colors.red,
                            ),
                      Positioned(
                        bottom: -10,
                        left: 80,
                        child: IconButton(
                          onPressed: selectImage,
                          icon: const Icon(Icons.add_a_photo),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  TextFieldInput(
                      textEditingController: _emailController,
                      hintText: 'Enter your email',
                      textInputType: TextInputType.emailAddress),
                  const SizedBox(
                    height: 24,
                  ),
                  TextFieldInput(
                    textEditingController: _passwordController,
                    hintText: 'Enter your password',
                    textInputType: TextInputType.text,
                    isPass: true,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  TextFieldInput(
                    hintText: 'Enter your Username',
                    textInputType: TextInputType.text,
                    textEditingController: _usernameController,
                    isPass: true,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  TextFieldInput(
                    hintText: 'Enter your bio',
                    textInputType: TextInputType.text,
                    textEditingController: _bioController,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: const ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                      ),
                      color: blueColor,
                    ),
                    child: const Text('Login'),
                  ),
                  Flexible(
                    flex: 2,
                    child: Container(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: const Text(
                          'Already have an account?',
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen())),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: const Text(
                            ' Login.',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ]),
          ),
        )));
  }
}
