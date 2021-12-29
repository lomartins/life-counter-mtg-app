import 'package:flutter/material.dart';

class EditableTextField extends StatefulWidget {
  const EditableTextField({
    Key? key,
    required this.initialText
  }) : super(key: key);

  final String initialText;

  @override
  _EditableTextFieldState createState() => _EditableTextFieldState();
}

class _EditableTextFieldState extends State<EditableTextField> with WidgetsBindingObserver {
  final FocusNode _inputFocusNode = FocusNode();

  bool _isEditingText = false;
  late TextEditingController _editingController;
  late String _text;

  @override
  void initState() {
    super.initState();
    _text = widget.initialText;
    _editingController = TextEditingController(text: _text);
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    final value = WidgetsBinding.instance?.window.viewInsets.bottom;
    if (value == 0) {
      _inputFocusNode.unfocus();
      setState(() {
        _isEditingText = false;
      });
    }
  }

  @override
  void dispose() {
    _editingController.dispose();
    _inputFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isEditingText) {
      return Center(
        child: TextField(
          onSubmitted: (newValue) {
            setState(() {
              _text = newValue;
              _isEditingText = false;
            });
          },
          onEditingComplete: () {
            _isEditingText = false;
          },
          autofocus: true,
          controller: _editingController,
        ),
      );
    }

    return InkWell(
        onTap: () {
          setState(() {
            _isEditingText = true;
          });
        },
        child: Text(
          _text,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18.0,
          ),
        ));
  }
}
