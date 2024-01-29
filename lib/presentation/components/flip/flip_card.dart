
import 'dart:math';
import 'package:flutter/material.dart';
import 'dart:async';

enum CardSide {
  front,
  back;

  /// Return [CardSide] associated with the [AnimationStatus]
  factory CardSide.fromAnimationStatus(AnimationStatus status) {
    switch (status) {
      case AnimationStatus.dismissed:
      case AnimationStatus.reverse:
        return CardSide.front;
      case AnimationStatus.forward:
      case AnimationStatus.completed:
        return CardSide.back;
    }
  }

  /// Return the opposite of the this [CardSide]
  CardSide get opposite {
    switch (this) {
      case CardSide.front:
        return CardSide.back;
      case CardSide.back:
        return CardSide.front;
    }
  }
}

enum Fill { none, front, back }

extension on TickerFuture {
  /// Wait until ticker completes or an error is thrown
  Future<void> get complete {
    final completer = Completer();
    void thunk(value) {
      completer.complete();
    }

    orCancel.then(thunk, onError: thunk);
    return completer.future;
  }
}

/// A widget that provides a flip card animation.
/// It could be used for hiding and showing details of a product.
///
/// To control the card programmatically,
/// you can pass a [controller] when creating the card.
///
/// ## Example
///
/// ```dart
/// FlipCard(
///   fill: Fill.fillBack,
///   direction: FlipDirection.HORIZONTAL, // default
///   initialSide: CardSide.front, // The side to initially display.
///   front: Container(
///     child: Text('Front'),
///   ),
///   back: Container(
///     child: Text('Back'),
///   ),
/// )
/// ```
class MetaFlipCard extends StatefulWidget {
  const MetaFlipCard({
    super.key,
    required this.front,
    required this.back,
    this.duration = const Duration(milliseconds: 500),
    this.onFlip,
    this.onFlipDone,
    this.direction = Axis.horizontal,
    this.controller,
    this.flipOnTouch = true,
    this.alignment = Alignment.center,
    this.fill = Fill.none,
    this.initialSide = CardSide.front,
    this.autoFlipDuration,
  });

  /// The initially shown side of the card
  final CardSide initialSide;

  /// {@macro flip_card.FlipCardTransition.alignment}
  final Alignment alignment;

  /// If the value is set, the flip effect will work automatically after the specified duration.
  final Duration? autoFlipDuration;

  /// {@macro flip_card.FlipCardTransition.front}
  final Widget front;

  /// {@macro flip_card.FlipCardTransition.back}
  final Widget back;

  /// Assign a controller to the [FlipCard] to control it programmatically
  ///
  /// {@macro flip_card_controller.example}
  final FlipCardController? controller;

  /// {@macro flip_card.FlipCardTransition.direction}
  final Axis direction;

  /// {@macro flip_card.FlipCardTransition.fill}
  final Fill fill;

  /// When enabled, the card will flip automatically when touched. This behavior
  /// can be disabled if this is not desired.
  ///
  /// To manually flip a card from your code use a [controller].
  final bool flipOnTouch;

  /// This callback is triggered when the card flipping is started
  final VoidCallback? onFlip;

  /// This callback is triggered when the card flipping is completed
  /// with the final [CardSide]
  final void Function(CardSide side)? onFlipDone;

  /// The [Duration] a turn animation will take.
  final Duration duration;

  @override
  State<StatefulWidget> createState() => FlipCardState();
}

/// State associated with a [FlipCard] widget.
///
/// A [FlipCardState] can be used to [flip], [flipWithoutAnimation], [skew]
/// or [hint] the associated [FlipCard]
class FlipCardState extends State<MetaFlipCard>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void didUpdateWidget(MetaFlipCard oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.duration != oldWidget.duration) {
      controller.duration = widget.duration;
    }

    if (widget.controller != oldWidget.controller) {
      if (oldWidget.controller?.state == this) {
        oldWidget.controller?.state = null;
      }

      widget.controller?.state = this;
    }
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      value: widget.initialSide == CardSide.front ? 0.0 : 1.0,
      duration: widget.duration,
      vsync: this,
    );

    widget.controller?.state = this;

    if (widget.autoFlipDuration != null) {
      Future.delayed(widget.autoFlipDuration!, flip);
    }
  }

  @override
  void dispose() {
    controller.dispose();
    widget.controller?.state = null;
    super.dispose();
  }

  /// {@template flip_card.FlipCardState.flip}
  /// Flips the card or reverses the direction of the current animation
  ///
  /// You can optionally pass a [targetSide] to show next
  ///
  /// This function returns a future that will complete when animation is done
  /// {@endtemplate}
  Future<void> flip([CardSide? targetSide]) async {
    if (!mounted) return;
    widget.onFlip?.call();

    targetSide ??= getOppositeSide();

    switch (targetSide) {
      case CardSide.front:
        await controller.reverse().complete;
        break;
      case CardSide.back:
        await controller.forward().complete;
        break;
    }

    widget.onFlipDone?.call(targetSide);
  }

  /// {@template flip_card.FlipCardState.flipWithoutAnimation}
  /// Flip the card without playing an animation.
  ///
  /// You can optionally pass a [targetSide] to show next
  ///
  /// This will cancel any ongoing animation.
  /// {@endtemplate}
  void flipWithoutAnimation([CardSide? targetSide]) {
    controller.stop();
    widget.onFlip?.call();

    targetSide ??= getOppositeSide();

    switch (targetSide) {
      case CardSide.front:
        controller.value = 0.0;
        break;
      case CardSide.back:
        controller.value = 1.0;
        break;
    }

    widget.onFlipDone?.call(targetSide);
  }

  /// Return the opposite side from the side currently being shown
  CardSide getOppositeSide() {
    return CardSide.fromAnimationStatus(controller.status).opposite;
  }

  /// {@template flip_card.FlipCardState.skew}
  /// Skew the card by amount percentage (0 - 1.0)
  ///
  /// This can be used with a MouseReagion to indicate that the card can
  /// be flipped. skew(0) to go back to original.
  ///
  /// This function returns a future that resolves when animation
  /// completes
  /// {@endtemplate}
  Future<void> skew(double target, {Duration? duration, Curve? curve}) async {
    assert(0 <= target && target <= 1);

    if (target > controller.value) {
      await controller
          .animateTo(
        target,
        duration: duration,
        curve: curve ?? Curves.linear,
      )
          .complete;
    } else {
      await controller
          .animateBack(
        target,
        duration: duration,
        curve: curve ?? Curves.linear,
      )
          .complete;
    }
  }

  /// {@template flip_card.FlipCardState.hint}
  /// Triggers a flip animation to [target] and back to 0 and completes in [duration].
  ///
  /// Calling [hint] when animating or when back side of the card is showed
  /// does nothing
  ///
  /// This function returns a future that resolves when animation
  /// completes
  /// {@endtemplate}
  Future<void> hint({
    double target = 0.2,
    Duration? duration,
    Curve curveTo = Curves.easeInOut,
    Curve curveBack = Curves.easeInOut,
  }) async {
    if (controller.status != AnimationStatus.dismissed) return;

    duration = duration ?? controller.duration!;
    final halfDuration =
    Duration(milliseconds: (duration.inMilliseconds / 2).round());

    try {
      await controller
          .animateTo(
        target,
        duration: halfDuration,
        curve: curveTo,
      )
          .complete;
    } finally {
      await controller
          .animateBack(
        0,
        duration: halfDuration,
        curve: curveBack,
      )
          .complete;
    }
  }

  @override
  Widget build(BuildContext context) {
    final child = FlipCardTransition(
      front: widget.front,
      back: widget.back,
      animation: controller,
      direction: widget.direction,
      fill: widget.fill,
      alignment: widget.alignment,
    );

    /// if we need to flip the card on taps, wrap the content
    if (widget.flipOnTouch) {
      return GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: flip,
        child: child,
      );
    }

    return child;
  }
}

/// A controller used with [FlipCard] to control it programmatically
///
/// {@template flip_card_controller.example}
/// ## Example
///
/// Inside a stateful widgets state do the following:
///
/// ```dart
/// late FlipCardController controller = FlipCardController();
///
/// @override
/// Widget build(BuildContext context) {
///   return FlipCard(
///     controller: controller,
///     flipOnTouch: false,
///     front: RaisedButton(
///       onPressed: controller.flip,
///       child: const Text('Front'),
///     ),
///     back: RaisedButton(
///       onPressed: controller.flip,
///       child: const Text('Back'),
///     ),
///   );
/// }
/// ```
/// {@endtemplate}
class FlipCardController {
  FlipCardState? _internalState;

  /// The internal widget state. Use only if you know what you're doing!
  ///
  /// This will throw an [AssertionError] if controller has not been
  /// assigned to a [FlipCard] widget or state has not been initialized
  FlipCardState get state {
    assert(
    _internalState != null,
    'Controller not attached to any FlipCard. Did you forget to pass the controller to the FlipCard?',
    );
    return _internalState!;
  }

  /// Set the internal state
  set state(FlipCardState? value) => _internalState = value;

  /// {@macro flip_card.FlipCardState.flip}
  Future<void> flip({CardSide? targetSide}) async =>
      await state.flip(targetSide);

  /// {@macro flip_card.FlipCardState.flipWithoutAnimation}
  void flipWithoutAnimation([CardSide? targetSide]) =>
      state.flipWithoutAnimation(targetSide);

  /// {@macro flip_card.FlipCardState.skew}
  Future<void> skew(
      double target, {
        Duration? duration,
        Curve? curve,
      }) async =>
      await state.skew(
        target,
        duration: duration,
        curve: curve,
      );

  /// {@macro flip_card.FlipCardState.hint}
  Future<void> hint({
    double target = 0.2,
    Duration? duration,
    Curve curveTo = Curves.easeInOut,
    Curve curveBack = Curves.easeInOut,
  }) async =>
      await state.hint(
        target: target,
        duration: duration,
        curveTo: curveTo,
        curveBack: curveBack,
      );
}


Widget _fill(Widget child) => Positioned.fill(child: child);
Widget _noop(Widget child) => child;

/// The transition used internally by [FlipCard]
///
/// You obtain more control by providing your on [Animation]
/// at the cost of built-in methods like [FlipCardState.flip]
class FlipCardTransition extends StatefulWidget {
  const FlipCardTransition({
    super.key,
    required this.front,
    required this.back,
    required this.animation,
    this.direction = Axis.horizontal,
    this.fill = Fill.none,
    this.alignment = Alignment.center,
    this.frontAnimator,
    this.backAnimator,
  });

  /// {@template flip_card.FlipCardTransition.front}
  /// The widget rendered on the front side
  /// {@endtemplate}
  final Widget front;

  /// {@template flip_card.FlipCardTransition.back}
  /// The widget rendered on the front side
  /// {@endtemplate}
  final Widget back;

  /// The [Animation] that controls the flip card
  final Animation<double> animation;

  /// {@template flip_card.FlipCardTransition.direction}
  /// The animation [Axis] of the card
  /// {@endtemplate}
  final Axis direction;

  /// {@template flip_card.FlipCardTransition.fill}
  /// Whether to fill a side of the card relative to the other
  /// {@endtemplate}
  final Fill fill;

  /// {@template flip_card.FlipCardTransition.alignment}
  /// How to align the [front] and [back] in the card
  /// {@endtemplate}
  final Alignment alignment;

  /// The [Animatable] used to animate the front side
  final Animatable<double>? frontAnimator;

  /// The [Animatable] used to animate the back side
  final Animatable<double>? backAnimator;

  /// The default [frontAnimator]
  static final defaultFrontAnimator = TweenSequence(
    [
      TweenSequenceItem<double>(
        tween: Tween(begin: 0.0, end: pi / 2).chain(
          CurveTween(curve: Curves.easeIn),
        ),
        weight: 50.0,
      ),
      TweenSequenceItem<double>(
        tween: ConstantTween<double>(pi / 2),
        weight: 50.0,
      ),
    ],
  );

  /// The default [backAnimator]
  static final defaultBackAnimator = TweenSequence(
    [
      TweenSequenceItem<double>(
        tween: ConstantTween<double>(pi / 2),
        weight: 50.0,
      ),
      TweenSequenceItem<double>(
        tween: Tween(begin: -pi / 2, end: 0.0).chain(
          CurveTween(curve: Curves.easeOut),
        ),
        weight: 50.0,
      ),
    ],
  );

  @override
  State<FlipCardTransition> createState() => _FlipCardTransitionState();
}

class _FlipCardTransitionState extends State<FlipCardTransition> {
  late CardSide _currentSide;

  @override
  void initState() {
    super.initState();
    _currentSide = CardSide.fromAnimationStatus(widget.animation.status);
    widget.animation.addStatusListener(_handleChange);
  }

  @override
  void didUpdateWidget(covariant FlipCardTransition oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.animation != oldWidget.animation) {
      oldWidget.animation.removeStatusListener(_handleChange);
      widget.animation.addStatusListener(_handleChange);
      _currentSide = CardSide.fromAnimationStatus(widget.animation.status);
    }
  }

  @override
  void dispose() {
    super.dispose();
    widget.animation.removeStatusListener(_handleChange);
  }

  void _handleChange(AnimationStatus status) {
    final newSide = CardSide.fromAnimationStatus(status);
    if (newSide != _currentSide) {
      setState(() {
        _currentSide = newSide;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final frontPositioning = widget.fill == Fill.front ? _fill : _noop;
    final backPositioning = widget.fill == Fill.back ? _fill : _noop;

    return Stack(
      alignment: widget.alignment,
      fit: StackFit.passthrough,
      children: <Widget>[
        frontPositioning(_buildContent(child: widget.front)),
        backPositioning(_buildContent(child: widget.back)),
      ],
    );
  }

  Widget _buildContent({required Widget child}) {
    final isFront = child == widget.front;
    final showingFront = _currentSide == CardSide.front;

    /// pointer events that would reach the backside of the card should be
    /// ignored
    return IgnorePointer(
      /// absorb the front card when the background is active (!isFront),
      /// absorb the background when the front is active
      ignoring: isFront ? !showingFront : showingFront,
      child: FlipTransition(
        animation: isFront
            ? (widget.frontAnimator ?? FlipCardTransition.defaultFrontAnimator)
            .animate(widget.animation)
            : (widget.backAnimator ?? FlipCardTransition.defaultBackAnimator)
            .animate(widget.animation),
        direction: widget.direction,
        child: child,
      ),
    );
  }
}

/// The transition used by each side of the [FlipCardTransition]
///
/// This applies a rotation [Transform] in the given [direction]
/// where the angle is [Animation.value]
class FlipTransition extends AnimatedWidget {
  const FlipTransition({
    super.key,
    required this.child,
    required this.animation,
    required this.direction,
  }) : super(listenable: animation);

  /// The [Animation] that controls this transition
  final Animation<double> animation;

  /// The widget being animated
  final Widget child;

  /// The direction of the flip
  final Axis direction;

  @override
  Widget build(BuildContext context) {
    final transform = Matrix4.identity();
    transform.setEntry(3, 2, 0.001);
    switch (direction) {
      case Axis.horizontal:
        transform.rotateY(animation.value);
        break;
      case Axis.vertical:
        transform.rotateX(animation.value);
        break;
    }

    return Transform(
      transform: transform,
      alignment: FractionalOffset.center,
      filterQuality: FilterQuality.none,
      child: child,
    );
  }
}