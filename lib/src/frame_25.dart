import 'dart:async';
import 'dart:math';

import 'package:flutter/widgets.dart';

/// A widget that shows the 25th frame on top of the child widget.
///
/// The 25th frame is shown once after a specific or a random delay.
///
/// When a random delay is used, the frame is shown within 1000 and
/// [maxDelayInMilliseconds] milliseconds.
///
/// Example:
///
/// ```dart
/// import 'package:flutter/material.dart';
/// import 'package:frame_25/frame_25.dart';
///
/// void main() {
///   runApp(const MyApp());
/// }
///
/// class MyApp extends StatelessWidget {
///   const MyApp({super.key});
///
///   @override
///   Widget build(BuildContext context) {
///     return MaterialApp(
///       title: '25th frame demo',
///       home: Frame25.random(
///         frame25: Container(color: Colors.red),
///         child: Container(
///           color: Colors.blue,
///           child: Center(
///             child: Text(
///               "Don't blink!",
///               style: Theme.of(context).textTheme.headlineMedium,
///             ),
///           ),
///         ),
///       ),
///     );
///   }
/// }
/// ```
///
/// See also:
/// - [Frame25.delayed], which shows the 25th frame after a specific delay.
/// - [Frame25.random], which shows the 25th frame after a random delay.
class Frame25 extends StatefulWidget {
  const Frame25._({
    required this.delay,
    required this.frame25,
    required this.child,
    this.maxDelayInMilliseconds = 10000,
    super.key,
  }) : assert(
          maxDelayInMilliseconds > 0,
          'maxDelayInMilliseconds must be greater than 0',
        );

  /// Shows the 25th frame after a specific delay.
  ///
  /// The [delay] parameter must not be null.
  const Frame25.delayed({
    required Duration delay,
    required Widget frame25,
    required Widget child,
    Key? key,
  }) : this._(
          delay: delay,
          frame25: frame25,
          child: child,
          key: key,
        );

  /// Shows the 25th frame after a random delay.
  ///
  /// If [maxDelayInMilliseconds] is not provided, the delay is between 1000 and
  /// 10000 milliseconds. The [maxDelayInMilliseconds] must be greater than 0.
  const Frame25.random({
    required Widget frame25,
    required Widget child,
    int maxDelayInMilliseconds = 10000,
    Key? key,
  }) : this._(
          delay: null,
          maxDelayInMilliseconds: maxDelayInMilliseconds,
          frame25: frame25,
          child: child,
          key: key,
        );

  /// The delay before the frame is shown.
  final Duration? delay;

  /// The maximum delay before the frame is shown.
  final int maxDelayInMilliseconds;

  /// The 25th frame to show.
  final Widget frame25;

  /// The child widget.
  final Widget child;

  @override
  State<Frame25> createState() => _Frame25State();
}

class _Frame25State extends State<Frame25> with WidgetsBindingObserver {
  final _frame25DelayInMilliseconds = (1 / 24 * 1000).round();
  var _frameVisible = false;

  @override
  void initState() {
    super.initState();

    final delay = widget.delay ??
        Duration(
          milliseconds: Random().nextInt(widget.maxDelayInMilliseconds) + 1000,
        );

    Future.delayed(delay, () => _setFrameVisible(true));
  }

  void _setFrameVisible(bool value) {
    if (_frameVisible == value) return;

    if (value) return setState(() => _frameVisible = value);

    Future.delayed(Duration(milliseconds: _frame25DelayInMilliseconds), () {
      if (mounted) setState(() => _frameVisible = value);
    });
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _setFrameVisible(false),
    );

    return Stack(
      children: <Widget>[
        widget.child,
        if (_frameVisible) widget.frame25,
      ],
    );
  }
}
