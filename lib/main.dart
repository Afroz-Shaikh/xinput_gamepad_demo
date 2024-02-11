import 'package:flutter/material.dart';
import 'package:xinput_gamepad/xinput_gamepad.dart';

void main() {
  XInputManager.enableXInput();
  XInputManager.inputLag = 0;

  runApp(MaterialApp(
    home: HomePage(),
    theme: ThemeData(
      brightness: Brightness.dark,
      textTheme: const TextTheme(
          bodyText2: TextStyle(color: Color.fromRGBO(26, 28, 25, 1))),
      backgroundColor: const Color.fromRGBO(28, 27, 30, 1),
    ),
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  final int flexFactorContainer = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(children: [
          Expanded(
              flex: flexFactorContainer,
              child: ControllerInformationContainer(
                color: const Color.fromRGBO(255, 179, 169, 1),
                index: 0,
              )),
          const Spacer(),
          Expanded(
              flex: flexFactorContainer,
              child: ControllerInformationContainer(
                color: const Color.fromRGBO(173, 198, 255, 1),
                index: 1,
              )),
          const Spacer(),
          Expanded(
              flex: flexFactorContainer,
              child: ControllerInformationContainer(
                color: const Color.fromRGBO(97, 224, 90, 1),
                index: 2,
              )),
          const Spacer(),
          Expanded(
              flex: flexFactorContainer,
              child: ControllerInformationContainer(
                color: const Color.fromRGBO(255, 185, 79, 1),
                index: 3,
              ))
        ]),
      ),
    );
  }
}

class ControllerStateChip extends StatelessWidget {
  final String text;
  final bool connected;
  final Color color;

  const ControllerStateChip(this.text, this.connected,
      {Key? key, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110,
      height: 40,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Container(
          color: Colors.grey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      width: 10,
                      height: 10,
                      color: connected ? Colors.green : Colors.red,
                    )),
                Text(
                  text,
                  style: const TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ControllerInformationContainer extends StatefulWidget {
  final Color color;
  final int index;

  ControllerInformationContainer(
      {Key? key, required this.index, required this.color})
      : super(key: key);

  @override
  State<ControllerInformationContainer> createState() =>
      _ControllerInformationContainerState();
}

class _ControllerInformationContainerState
    extends State<ControllerInformationContainer> {
  late Controller controller;

  final String pressedString = "Pressed";
  final String notPressedString = "Not pressed";

  bool aButtonPressed = false;
  bool bButtonPressed = false;
  bool xButtonPressed = false;
  bool yButtonPressed = false;
  bool dUpButtonPressed = false;
  bool dDownButtonPressed = false;
  bool dLeftButtonPressed = false;
  bool dRightButtonPressed = false;
  bool startButtonPressed = false;
  bool backButtonPressed = false;
  bool leftThumbButtonPressed = false;
  bool rightThumbButtoPressed = false;
  bool leftShoulderButtonPressed = false;
  bool rightSholderButtonPressed = false;

  int rxThumb = 0;
  int ryThumb = 0;
  int lxThumb = 0;
  int lyThumb = 0;
  int leftTrigger = 0;
  int rightTrigger = 0;

  void releaseButton(List<ControllerButton> buttons) {
    for (ControllerButton button in buttons) {
      switch (button) {
        case ControllerButton.A_BUTTON:
          setState(() {
            aButtonPressed = false;
          });
          break;
        case ControllerButton.B_BUTTON:
          setState(() {
            bButtonPressed = false;
          });
          break;
        case ControllerButton.X_BUTTON:
          setState(() {
            xButtonPressed = false;
          });
          break;
        case ControllerButton.Y_BUTTON:
          setState(() {
            yButtonPressed = false;
          });
          break;
        case ControllerButton.DPAD_DOWN:
          setState(() {
            dDownButtonPressed = false;
          });
          break;
        case ControllerButton.DPAD_UP:
          setState(() {
            dUpButtonPressed = false;
          });
          break;
        case ControllerButton.DPAD_LEFT:
          setState(() {
            dLeftButtonPressed = false;
          });
          break;
        case ControllerButton.DPAD_RIGHT:
          setState(() {
            dRightButtonPressed = false;
          });
          break;
        case ControllerButton.START:
          setState(() {
            startButtonPressed = false;
          });
          break;
        case ControllerButton.BACK:
          setState(() {
            backButtonPressed = false;
          });
          break;
        case ControllerButton.LEFT_THUMB:
          setState(() {
            leftThumbButtonPressed = false;
          });
          break;
        case ControllerButton.RIGHT_THUMB:
          setState(() {
            rightThumbButtoPressed = false;
          });
          break;
        case ControllerButton.LEFT_SHOULDER:
          setState(() {
            leftShoulderButtonPressed = false;
          });
          break;
        case ControllerButton.RIGHT_SHOULDER:
          setState(() {
            rightSholderButtonPressed = false;
          });
          break;
      }
    }
  }

  @override
  void initState() {
    controller = Controller(index: widget.index);
    controller.buttonsMapping = {
      ControllerButton.A_BUTTON: () {
        setState(() {
          aButtonPressed = true;
        });
      },
      ControllerButton.B_BUTTON: () {
        setState(() {
          bButtonPressed = true;
        });
      },
      ControllerButton.X_BUTTON: () {
        setState(() {
          xButtonPressed = true;
        });
      },
      ControllerButton.Y_BUTTON: () {
        setState(() {
          yButtonPressed = true;
        });
      },
      ControllerButton.DPAD_UP: () {
        setState(() {
          dUpButtonPressed = true;
        });
      },
      ControllerButton.DPAD_DOWN: () {
        setState(() {
          dDownButtonPressed = true;
        });
      },
      ControllerButton.DPAD_LEFT: () {
        setState(() {
          dLeftButtonPressed = true;
        });
      },
      ControllerButton.DPAD_RIGHT: () {
        setState(() {
          dRightButtonPressed = true;
        });
      },
      ControllerButton.START: () {
        setState(() {
          startButtonPressed = true;
        });
      },
      ControllerButton.BACK: () {
        setState(() {
          backButtonPressed = true;
        });
      },
      ControllerButton.LEFT_THUMB: () {
        setState(() {
          leftThumbButtonPressed = true;
        });
      },
      ControllerButton.RIGHT_THUMB: () {
        setState(() {
          rightThumbButtoPressed = true;
        });
      },
      ControllerButton.LEFT_SHOULDER: () {
        setState(() {
          leftShoulderButtonPressed = true;
        });
      },
      ControllerButton.RIGHT_SHOULDER: () {
        setState(() {
          rightSholderButtonPressed = true;
        });
      }
    };
    controller.onReleaseButton = (buttons) => releaseButton(buttons);

    controller.variableKeysMapping = {
      VariableControllerKey.THUMB_RX: (value) {
        setState(() {
          rxThumb = value;
        });
      },
      VariableControllerKey.THUMB_RY: (value) {
        setState(() {
          ryThumb = value;
        });
      },
      VariableControllerKey.THUMB_LX: (value) {
        setState(() {
          lxThumb = value;
        });
      },
      VariableControllerKey.THUMB_LY: (value) {
        setState(() {
          ryThumb = value;
        });
      },
      VariableControllerKey.LEFT_TRIGGER: (value) {
        setState(() {
          leftTrigger = value;
        });
      },
      VariableControllerKey.RIGHT_TRIGGER: (value) {
        setState(() {
          rightTrigger = value;
        });
      }
    };

    controller.listen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        color: widget.color,
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          ControllerStateChip(
            "Controller ${widget.index}",
            ControllersManager.getIndexConnectedControllers()
                .contains(widget.index),
            color: widget.color,
          ),
          Text(
              "A Button: ${aButtonPressed ? pressedString : notPressedString}"),
          Text(
              "B Button: ${bButtonPressed ? pressedString : notPressedString}"),
          Text(
              "X Button: ${xButtonPressed ? pressedString : notPressedString}"),
          Text(
              "Y Button: ${yButtonPressed ? pressedString : notPressedString}"),
          Text(
              "DPAD Down Button: ${dDownButtonPressed ? pressedString : notPressedString}"),
          Text(
              "DPAD Up Button: ${dUpButtonPressed ? pressedString : notPressedString}"),
          Text(
              "DPAD Right Button: ${dRightButtonPressed ? pressedString : notPressedString}"),
          Text(
              "DPAD Left Button: ${dLeftButtonPressed ? pressedString : notPressedString}"),
          Text(
              "START Button ${startButtonPressed ? pressedString : notPressedString}"),
          Text(
              "Back Button: ${backButtonPressed ? pressedString : notPressedString}"),
          Text(
              "Left Thumb: ${leftThumbButtonPressed ? pressedString : notPressedString}"),
          Text(
              "Right Thumb: ${rightThumbButtoPressed ? pressedString : notPressedString}"),
          Text(
              "Left Shoulder: ${leftShoulderButtonPressed ? pressedString : notPressedString}"),
          Text(
              "Right Shoulder: ${rightSholderButtonPressed ? pressedString : notPressedString}"),
          const Divider(color: Colors.grey),
          Text("Left thumb: X($lxThumb) - Y($lyThumb)"),
          Text("Right thumb: X($rxThumb) - Y($ryThumb)"),
          Text("Left trigger: $leftTrigger"),
          Text("Right trigger: $rightTrigger")
        ]),
      ),
    );
  }
}
