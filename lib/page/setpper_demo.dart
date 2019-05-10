/**
 * 步骤 Stepper
 */
import 'package:flutter/material.dart';

class StepperDemo extends StatefulWidget {
  StepperDemo({Key key}) : super(key: key);

  _StepperDemoState createState() => _StepperDemoState();
}

class _StepperDemoState extends State<StepperDemo> {
  int _currentStep = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('步骤 Stepper'),),
      body: Container(
        child: Theme(
          data: Theme.of(context).copyWith(
            // primaryColor: Colors.black
          ),
          child: Stepper(
            currentStep: _currentStep,
            onStepTapped: (int value) {
              setState(() {
                _currentStep = value;
              });
            },
            onStepContinue: () {
              setState(() {
                _currentStep < 2 ? _currentStep += 1 : null;
              });
            },
            onStepCancel: () {
              setState(() {
                _currentStep > 0 ? _currentStep -= 1 : null;
              });
            },
            steps: [
              Step(
                title: Text('步骤 1'),
                subtitle: Text('副标题'),
                content: Text('The subtitle of the step that appears below the title and has a smaller'),
                isActive: _currentStep >= 0
              ),
              Step(
                title: Text('步骤 2'),
                subtitle: Text('副标题'),
                content: Text('The subtitle of the step that appears below the title and has a smaller'),
                isActive: _currentStep >= 1
              ),
              Step(
                title: Text('步骤 3'),
                subtitle: Text('副标题'),
                content: Text('The subtitle of the step that appears below the title and has a smaller'),
                isActive: _currentStep >= 2
              )
            ],
          ),
        ),
      ),
    );
  }
}
