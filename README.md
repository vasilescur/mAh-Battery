# mAh Battery

Adds a mAh (milliampere-hours) battery level indicator to the Mac bar.

This meme was created by the 4:00 AM gang.

By the way this is totally a joke, it's the first thing I ever wrote in Swift.

## Screenshot

<img width="300" src="https://user-images.githubusercontent.com/10100323/52538476-0a461500-2d41-11e9-9617-6bdd1d74b6c8.jpg">

Get it cause the screen was shot
<br><br>
  
  ...
  <br>

<img width="200" alt="screenshot" src="https://user-images.githubusercontent.com/10100323/52536665-a9f8a880-2d2b-11e9-94fc-87642f8bbc3d.png">

## How Do I Use It?

- Prerequisites: 
    - XCode
    - A MacBook
    - ~~a will to live~~

1. Clone the repository.
2. Open the project in XCode.
3. Press `⌘ R` (Command + `R`) to run, or use the Build option from the menu.
4. Install the generated `.app` file into your `Applications` folder.
5. Go to `System Preferences` > `Users and Groups` > `Login Items`, click `+`, and add the app.
6. Hold `⌘` and drag the little thing to wherever your little heart desires.

## Why Does this Exist?

Why does anything exist? *Does* anything exist? 🤔
\*`cmatrix` intensifies\*

## How Does it Work?

Poorly.

JK. It works pretty well. It's very simple, too:

I blatantly copied some code from God-knows-where and put it in `Battery.swift`, then wrote the `BatteryAPI` as a completely
un-necessary frivolity to interface with it, with a series of highly complicated and useful functions such as:

```swift
func isCharging() -> String {
    return String(battery.isCharging());
}
```

<sub><sup>Yeah that's right. I use semicolons in Swift.</sup></sub>

Oooh. Aaah.

Basically it's a bunch of `menuitems` with an update function that does this:

```swift
statusItem.button?.title = batteryApi.currentCapacity(unit: true);
currentCapacityOutlet.title = "Current Capacity: " + batteryApi.currentCapacity();
maxCapacityOutlet.title = "Maximum Capacity: " + batteryApi.maxCapacity();
...
```

On a timer that looks like this:

```swift
Timer.scheduledTimer(
    timeInterval: 5, 
    target: self, 
    selector: #selector(StatusMenuController.timerFire), 
    userInfo: nil, 
    repeats: true
);
```

## Contributing

Nah. I mean, if you really want to, I won't stop you. But there are probably many better things to do with your time.

## License

This software is licensed under a *Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International Public License*. 'Cause it's the CC license with the coolest name :) And also 'cause they say not to use it for code, and I'm that guy.

<br><br><br><br><br><br>
<br><br><br><br><br><br>


<FONT COLOR="#FF0000">e</FONT><FONT COLOR="#FF6000">n</FONT><FONT COLOR="#FFC000">d</FONT><FONT COLOR="#FFff00"> </FONT><FONT COLOR="#9Fff00">m</FONT><FONT COLOR="#3Fff00">y</FONT><FONT COLOR="#00ff00"> </FONT><FONT COLOR="#00ff60">s</FONT><FONT COLOR="#00ffC0">u</FONT><FONT COLOR="#00ffff">f</FONT><FONT COLOR="#00C0ff">f</FONT><FONT COLOR="#0060ff">e</FONT><FONT COLOR="#0000ff">r</FONT><FONT COLOR="#3F00ff">i</FONT><FONT COLOR="#9F00ff">n</FONT><FONT COLOR="#FF00ff">g</FONT>
