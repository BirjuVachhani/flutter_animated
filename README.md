# flutter_animated

[![Starware](https://img.shields.io/badge/Starware-⭐-black?labelColor=f9b00d)](https://github.com/zepfietje/starware)

This repository is aimed to hold small animated components. All the components will be ready to use into Flutter projects. This is basically a playground for me to learn and implement animation in Flutter. More components/examples will be added.

## Index
1. [SlidingAnimationButton](#SlidingAnimationButton)

## 1. SlidingAnimationButton

Flutter sliding animation button design inspired by [Kate Laguta](https://dribbble.com/katelaguta) on [Dribble](https://dribbble.com/shots/4858673-Button-PRD)

Live: https://codepen.io/birjuvachhani/pen/zYNxxZj

<img src="https://cdn.dribbble.com/users/1481172/screenshots/4858673/fuge_button_01.gif" height=300px />

Checkout [sliding_animation_button.dart](lib/sliding_animation_button.dart) for source code.

## Usage

```dart
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
```

<br/>

## Starware

This repository is Starware.
This means you're free to use the project, as long as you star its [GitHub repository](https://github.com/birjuvachhani/flutter_not_paid).
Your appreciation makes us grow and glow up. ⭐

## License

```
BSD 3-Clause License

Copyright (c) 2021, Birju Vachhani
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this
   list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice,
   this list of conditions and the following disclaimer in the documentation
   and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its
   contributors may be used to endorse or promote products derived from
   this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
```
