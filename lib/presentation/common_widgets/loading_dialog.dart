import 'package:flutter/material.dart';

class LoadingDialog extends StatelessWidget {
  final String dialogText;
  const LoadingDialog({Key? key, required this.dialogText}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: 20,
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.black54,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(
              backgroundColor: Colors.white,
            ),
            const SizedBox(height: 4),
            Text(
              dialogText,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
