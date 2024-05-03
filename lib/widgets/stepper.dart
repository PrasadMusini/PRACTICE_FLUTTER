import 'package:flutter/material.dart';

class StepperWid extends StatefulWidget {
  const StepperWid({super.key});

  @override
  State<StepperWid> createState() => _StepperWidState();
}

class _StepperWidState extends State<StepperWid> {
  int _currentStep = 0;

  final style = const TextStyle(
    fontSize: 16,
    color: Colors.redAccent,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stepper'),
      ),
      body: Stepper(
        steps: steps(),
        currentStep: _currentStep,
        onStepTapped: (newStep) {
          setState(() {
            _currentStep = newStep;
          });
        },
        onStepContinue: () {
          if (_currentStep != 3) {
            setState(() {
              _currentStep++;
            });
          }
        },
        onStepCancel: () {
          if (_currentStep != 0) {
            setState(() {
              _currentStep--;
            });
          }
        },
        type: StepperType.horizontal,
      ),
    );
  }

  List<Step> steps() => [
        Step(
          // state: _currentStep > 0 ? StepState.complete : StepState.indexed,
          isActive: _currentStep >= 0,
          title: const Text('step 1'),
          content: Text('step 1', style: style),
        ),
        Step(
          state: _currentStep > 1 ? StepState.disabled : StepState.editing,
          isActive: _currentStep >= 1,
          title: const Text('step 2'),
          content: Text('step 2', style: style),
        ),
        Step(
          state: _currentStep > 1 ? StepState.editing : StepState.error,
          isActive: _currentStep >= 2,
          title: const Text('step 3'),
          content: Text('step 3', style: style),
        ),
        Step(
          isActive: _currentStep >= 3,
          title: const Text('step 4'),
          content: Text('step 4', style: style),
        ),
      ];
}
