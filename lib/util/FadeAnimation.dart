// import 'package:flutter/material.dart';
// import 'package:simple_animations/simple_animations.dart';


// class FadeAnimation extends StatelessWidget {
//   final double delay;
//   final Widget child;

//   FadeAnimation(this.delay, this.child);

//   @override
//   Widget build(BuildContext context) {
//     final _tween = MultiTween<AniProps>()
//       ..add(AniProps.opacity, 0.0.tweenTo(1.0), 500.milliseconds)
//       ..add(AniProps.translateY, (-30.0).tweenTo(0.0), 500.milliseconds, Curves.easeOut);

//     return PlayAnimation<MultiTweenValues<AniProps>>(
//       delay: (500 * delay).round().milliseconds,
//       duration: _tween.duration,
//       tween: _tween,
//       child: child,
//       builderWithChild: (context, child, animation) => Opacity(
//         opacity: animation.get(AniProps.opacity),
//         child: Transform.translate(
//           offset: Offset(0, animation.get(AniProps.translateY)), 
//           child: child
//         ),
//       ),
//     );
//   }
// }
// enum AniProps { opacity, translateY }
