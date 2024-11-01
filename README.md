A Flutter package to show the mysterious 25th frame in your apps.

![25th Frame logo](https://github.com/mkobuolys/frame_25/blob/main/images/logo.png?raw=true)

## What is the 25th frame?

The 25th frame is a mysterious frame that is shown for a very short time in movies and TV shows. It is said that this frame can influence the viewer's subconscious mind.

This package allows you to show the 25th frame in your Flutter apps.

## Usage

Add the `frame_25` dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  frame_25:
```

Wrap the widget you want to show the 25th frame on with a `Frame25` widget:

```dart
class MyWidget extends StatelessWidget {
  const MyWidget();

  @override
  Widget build(BuildContext context) {
    return Frame25.random(
      frame25: Container(color: Colors.red),
      maxDelayInMilliseconds: 3000,
      child: const ColoredBox(
        color: Colors.blue,
        child: Center(
          child: Text("Don't blink!"),
        ),
      ),
    );
  }
}
```

If you want to show the 25th frame after a specific delay, you can use the `Frame25.delayed` constructor:

```dart
class MyWidget extends StatelessWidget {
  const MyWidget();

  @override
  Widget build(BuildContext context) {
    return Frame25.delayed(
      frame25: Container(color: Colors.red),
      delay: const Duration(milliseconds: 3000),
      child: const ColoredBox(
        color: Colors.blue,
        child: Center(
          child: Text("Don't blink!"),
        ),
      ),
    );
  }
}
```
