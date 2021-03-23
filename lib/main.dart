import 'dart:math';

import 'package:flutter/material.dart';

import 'sliding_animation_button.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Animated Button',
      theme: ThemeData.dark().copyWith(
        accentColor: Color(0xFF3231E4),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isEnabled = false;

  @override
  Widget build(BuildContext context) {
    SlidingAnimationButton(
      enabled: SlidingAnimationButtonStyle.enabled(
        text: 'Enabled'.toUpperCase(),
      ),
      disabled: SlidingAnimationButtonStyle.disabled(
        text: 'Disabled'.toUpperCase(),
      ),
      state: isEnabled
          ? AnimatedButtonState.enabled
          : AnimatedButtonState.disabled,
      onTap: () {
        setState(() {
          isEnabled = false;
        });
      },
    );
    return Scaffold(
      backgroundColor: Color(0xFF3231E4),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(flex: 2),
            SizedBox(
              width: min(MediaQuery.of(context).size.width * 0.6, 350),
              child: SlidingAnimationButton(
                enabled: SlidingAnimationButtonStyle.enabled(
                  text: 'Enabled'.toUpperCase(),
                ),
                disabled: SlidingAnimationButtonStyle.disabled(
                  text: 'Disabled'.toUpperCase(),
                ),
                state: isEnabled
                    ? AnimatedButtonState.enabled
                    : AnimatedButtonState.disabled,
                onTap: () {
                  setState(() {
                    isEnabled = false;
                  });
                },
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Disable',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Switch(
                  activeColor: Colors.white,
                  value: isEnabled,
                  onChanged: (value) => setState(() => isEnabled = value),
                ),
                Text(
                  'Enable',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Spacer(),
            Container(
              padding: EdgeInsets.symmetric(vertical: 4),
              color: Color(0xFF121212),
              width: double.maxFinite,
              child: Wrap(
                direction: MediaQuery.of(context).size.width > 450
                    ? Axis.horizontal
                    : Axis.vertical,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width > 450
                        ? MediaQuery.of(context).size.width / 2
                        : double.maxFinite,
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Color(0xFFFFB908),
                        backgroundImage: NetworkImage(
                            'https://pbs.twimg.com/profile_images/1297099267106979842/zpPd2YaE_400x400.jpg'),
                        radius: 22,
                      ),
                      title: Text(
                        'Developed By',
                        style: TextStyle(
                          color: Colors.grey,
                          height: 1.0,
                          fontSize: 14,
                        ),
                      ),
                      subtitle: SelectableText(
                        'Birju Vachhani',
                        style: TextStyle(
                          color: Colors.blue,
                          height: 1.2,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width > 450
                        ? MediaQuery.of(context).size.width / 2
                        : double.maxFinite,
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Color(0xFFEB498A),
                        backgroundImage: NetworkImage(
                            'https://s3.amazonaws.com/www-inside-design/uploads/2015/06/Dribbble-InVision-feature-810x810.jpg'),
                        radius: 22,
                      ),
                      title: Text(
                        'Inspired By',
                        style: TextStyle(
                          color: Colors.grey,
                          height: 1.0,
                          fontSize: 14,
                        ),
                      ),
                      subtitle: SelectableText(
                        'Kate Laguta',
                        style: TextStyle(
                          color: Colors.blue,
                          height: 1.2,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
