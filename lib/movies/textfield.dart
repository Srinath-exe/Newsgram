import 'package:flutter/material.dart';
import 'package:news_app/constants/constants.dart';

class CustomTextField extends StatefulWidget {
  String name;
  TextEditingController controller;
  IconData icon;
  bool? isPassword;
  FocusNode focus;
  Function(String) onSubmit;
  void Function()? onClose;
  CustomTextField(
      {Key? key,
      this.isPassword = false,
      required this.name,
      required this.focus,
      required this.icon,
      this.onClose,
      required this.onSubmit,
      required this.controller})
      : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _passwordVisible;
  @override
  void initState() {
    _passwordVisible = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Material(
        elevation: 2,
        color: white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        child: Container(
          constraints: const BoxConstraints(minWidth: 100, maxWidth: 600),
          width: MediaQuery.of(context).size.width * 0.86,
          alignment: Alignment.center,
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey.withOpacity(0.5),
                radius: 28,
                child: Icon(
                  Icons.search_rounded,
                  size: 30,
                  color: black,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 16, top: 5),
                  child: TextFormField(
                    onFieldSubmitted: widget.onSubmit,
                    focusNode: widget.focus,
                    textAlignVertical: TextAlignVertical.center,
                    controller: widget.controller,
                    textAlign: TextAlign.left,
                    enabled: true,
                    cursorColor: accent,
                    keyboardType: widget.isPassword!
                        ? TextInputType.visiblePassword
                        : null,
                    style: TextStyle(fontSize: 16, color: black),
                    obscureText: _passwordVisible,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () {
                            widget.onClose;
                          },
                          icon: Icon(Icons.close_rounded)),
                      suffixIconConstraints: BoxConstraints(minWidth: 60),
                      border: InputBorder.none,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      hintText: widget.name,
                      hintStyle:
                          TextStyle(color: Colors.grey.shade600, fontSize: 16),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
