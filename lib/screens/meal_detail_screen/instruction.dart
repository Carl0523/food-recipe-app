import 'package:flutter/material.dart';

class Instruction extends StatelessWidget {
  final List<String> steps;
  const Instruction({super.key, required this.steps});

  @override
  Widget build(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 1. The [instruction] title text
        const Text(
          'Instruction',
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.w600,
          ),
        ),

        const SizedBox(
          height: 10,
        ),

        // 2. The instruciton steps
        for (int i = 0; i < steps.length; i++)
          Padding(
            padding: const EdgeInsets.only(bottom: 10, left: 15),
            child: Text.rich(
              TextSpan(
                text: '${i + 1}.  ',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(
                    text: steps[i],
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
