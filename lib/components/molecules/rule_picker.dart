library ruler_picker;

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// a triangle painter
class _TrianglePainter extends CustomPainter {
  // final double lineSize;

  // _TrianglePainter({this.lineSize = 16});
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width / 2, tan(pi / 3) * size.width / 2);
    path.close();
    Paint paint = Paint();
    paint.color = const Color.fromARGB(255, 118, 165, 248);
    paint.style = PaintingStyle.fill;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

/// The controller for the ruler picker
/// init the ruler value from the controller
/// 用于 RulerPicker 的控制器，可以在构造函数里初始化默认值
class RulerPickerController extends ValueNotifier<num> {
  RulerPickerController({num value = 0}) : super(value);
  num get value => super.value;
  set value(num newValue) {
    super.value = newValue;
  }
}

typedef void ValueChangedCallback(num value);

/// RulerPicker 标尺选择器
/// [width] 必须是具体的值，包括父级container的width，不能是 double.infinity，
/// 可以传入MediaQuery.of(context).size.width
class RulerPicker extends StatefulWidget {
  final ValueChangedCallback onValueChanged;
  final String Function(int index, num rulerScaleValue) onBuildRulerScaleText;
  final double width;
  final double height;
  final TextStyle rulerScaleTextStyle;
  final List<ScaleLineStyle> scaleLineStyleList;
  final List<RulerRange> ranges;
  final Widget? marker;
  final double rulerMarginTop;
  final Color rulerBackgroundColor;
  final RulerPickerController? controller;
  final bool vertical;

  RulerPicker({
    required this.onValueChanged,
    required this.width,
    required this.height,
    required this.onBuildRulerScaleText,
    this.ranges = const [],
    this.rulerMarginTop = 0,
    this.scaleLineStyleList = const [
      ScaleLineStyle(
          scale: 0,
          color: Color.fromARGB(255, 188, 194, 203),
          width: 2,
          height: 32),
      ScaleLineStyle(
          color: Color.fromARGB(255, 188, 194, 203), width: 1, height: 20),
    ],
    this.rulerScaleTextStyle = const TextStyle(
      color: Color.fromARGB(255, 188, 194, 203),
      fontSize: 14,
    ),
    this.marker,
    this.rulerBackgroundColor = Colors.white,
    this.controller,
    this.vertical = false,
  });
  @override
  State<StatefulWidget> createState() {
    return RulerPickerState();
  }
}

class RulerPickerState extends State<RulerPicker> {
  double lastOffset = 0;
  bool isPosFixed = false;
  String value = '';
  late ScrollController scrollController;
  Map<int, ScaleLineStyle> _scaleLineStyleMap = {};
  int itemCount = 0;

  @override
  void initState() {
    super.initState();

    itemCount = _calculateItemCount();
    print(itemCount);

    widget.scaleLineStyleList.forEach((element) {
      _scaleLineStyleMap[element.scale] = element;
    });

    double initValueOffset = getPositionByValue(widget.controller?.value ?? 0);

    scrollController = ScrollController(
        initialScrollOffset: initValueOffset > 0 ? initValueOffset : 0);

    scrollController.addListener(_onValueChanged);

    widget.controller?.addListener(() {
      setPositionByValue(widget.controller?.value ?? 0);
    });
  }

  int _calculateItemCount() {
    int itemCount = 0;
    widget.ranges.forEach((element) {
      // print(element.end);
      itemCount += ((element.end - element.begin) / element.scale).truncate();
    });
    itemCount += 1;
    return itemCount;
  }

  void _onValueChanged() {
    int currentIndex = scrollController.offset ~/ _ruleScaleInterval.toInt();

    if (currentIndex < 0) currentIndex = 0;
    num currentValue = getRulerScaleValue(currentIndex);

    var lastConfig = widget.ranges.last;
    if (currentValue > lastConfig.end) currentValue = lastConfig.end;

    widget.onValueChanged(currentValue);
  }

  /// default mark
  Widget _buildMark(bool vertical) {
    /// default mark arrow
    Widget triangle() {
      return SizedBox(
        width: 15,
        height: 15,
        child: CustomPaint(
          painter: _TrianglePainter(),
        ),
      );
    }

    return Container(
      child: SizedBox(
        width: vertical ? 45 : _ruleScaleInterval * 2,
        height: vertical ? _ruleScaleInterval * 2 : 45,
        child: Stack(
          children: <Widget>[
            Align(
                alignment:
                    vertical ? Alignment.centerRight : Alignment.topCenter,
                child: Transform.rotate(
                    angle: vertical ? pi / 2 : 0, child: triangle())),
            Align(
                child: Container(
              width: vertical ? 34 : 3,
              height: vertical ? 3 : 34,
              color: Color.fromARGB(255, 118, 165, 248),
            )),
          ],
        ),
      ),
    );
  }

  ///绘制刻度线
  Widget _buildRulerScaleLine(int index, bool vertical) {
    double width = 0;
    double height = 0;
    Color color = Color.fromARGB(255, 188, 194, 203);
    int scale = index % 10;

    if (_scaleLineStyleMap[scale] != null) {
      width = _scaleLineStyleMap[scale]!.width;
      height = _scaleLineStyleMap[scale]!.height;
      color = _scaleLineStyleMap[scale]!.color;
    } else {
      if (_scaleLineStyleMap[-1] != null) {
        scale = -1;
        width = _scaleLineStyleMap[scale]!.width;
        height = _scaleLineStyleMap[scale]!.height;
        color = _scaleLineStyleMap[scale]!.color;
      } else {
        if (scale == 0) {
          width = 2;
          height = 32;
        } else {
          width = 1;
          height = 20;
        }
      }
    }

    return Container(
      width: vertical ? height : width,
      height: vertical ? width : height,
      color: color,
    );
  }

  Widget _buildRulerScale(BuildContext context, int index) {
    return Container(
      width: _ruleScaleInterval,
      child: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          Align(
              alignment: Alignment.topCenter,
              child: _buildRulerScaleLine(index, widget.vertical)),
          Positioned(
            bottom: widget.vertical ? 0 : 5,
            width: 100,
            left: widget.vertical ? -40 : -50 + _ruleScaleInterval / 2,
            child: index % 10 == 0
                ? Container(
                    alignment: Alignment.center,
                    child: Text(
                      widget.onBuildRulerScaleText(
                          index, getRulerScaleValue(index)),
                      style: widget.rulerScaleTextStyle,
                    ),
                  )
                : SizedBox(),
          ),
        ],
      ),
    );
  }

  //尺子刻度间隔
  final double _ruleScaleInterval = 10;

//使得尺子刻度和指示器对齐
  void fixOffset() {
    int tempFixedOffset = (scrollController.offset + 0.5) ~/ 1;

    double fixedOffset = (tempFixedOffset + _ruleScaleInterval / 2) ~/
        _ruleScaleInterval.toInt() *
        _ruleScaleInterval;
    Future.delayed(Duration.zero, () {
      scrollController.animateTo(fixedOffset,
          duration: Duration(milliseconds: 50), curve: Curves.bounceInOut);
    });
  }

  ///获取尺子的刻度值
  num getRulerScaleValue(int index) {
    num rulerScaleValue = 0;

    RulerRange? currentConfig;
    for (RulerRange config in widget.ranges) {
      currentConfig = config;
      if (currentConfig == widget.ranges.last) {
        break;
      }
      var totalCount = ((config.end - config.begin) / config.scale).truncate();

      if (index <= totalCount) {
        break;
      } else {
        index -= totalCount;
      }
    }

    rulerScaleValue = index * currentConfig!.scale + currentConfig!.begin;

    return rulerScaleValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(

          // right: widget.width - _ruleScaleInterval
          ),
      width: widget.width,
      height: widget.height + widget.rulerMarginTop,
      child: Stack(
        children: <Widget>[
          Align(
              alignment:
                  widget.vertical ? Alignment.center : Alignment.bottomCenter,
              child: Listener(
                onPointerDown: (event) {
                  FocusScope.of(context).requestFocus(new FocusNode());
                  isPosFixed = false;
                },
                onPointerUp: (event) {},
                child: NotificationListener(
                    onNotification: (scrollNotification) {
                      if (scrollNotification is ScrollStartNotification) {
                      } else if (scrollNotification
                          is ScrollUpdateNotification) {
                      } else if (scrollNotification is ScrollEndNotification) {
                        if (!isPosFixed) {
                          isPosFixed = true;
                          fixOffset();
                        }
                      }
                      return true;
                    },
                    child: Container(
                        width: double.infinity,
                        height:
                            widget.vertical ? widget.height - 10 : widget.width,
                        color: widget.rulerBackgroundColor,
                        child: ListView.builder(
                          padding: EdgeInsets.only(
                              left: (widget.vertical
                                      ? widget.height
                                      : widget.width - _ruleScaleInterval) /
                                  2,
                              right: (widget.vertical
                                      ? widget.height
                                      : widget.width - _ruleScaleInterval) /
                                  2),
                          itemExtent: _ruleScaleInterval,
                          itemCount: itemCount,
                          controller: scrollController,
                          reverse: !widget.vertical,
                          scrollDirection:
                              widget.vertical ? Axis.vertical : Axis.horizontal,
                          itemBuilder: _buildRulerScale,
                        ))),
              )),
          Align(
            alignment: Alignment.topCenter,
            child: widget.marker ?? _buildMark(widget.vertical),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  void didUpdateWidget(RulerPicker oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (mounted) {
      if (isRangesChanged(oldWidget)) {
        Future.delayed(Duration.zero, () {
          setState(() {
            itemCount = _calculateItemCount();
          });
          _onValueChanged();
        });
      }
    }
  }

  bool isRangesChanged(RulerPicker oldWidget) {
    if (oldWidget.ranges.length != widget.ranges.length) {
      return true;
    }

    if (widget.ranges.isEmpty) return false;
    for (int i = 0; i < widget.ranges.length; i++) {
      RulerRange oldRange = oldWidget.ranges[i];
      RulerRange range = widget.ranges[i];
      if (oldRange.begin != range.begin ||
          oldRange.end != range.end ||
          oldRange.scale != range.scale) {
        return true;
      }
    }
    return false;
  }

  double getPositionByValue(num value) {
    double offsetValue = 0;
    for (RulerRange config in widget.ranges) {
      if (config.begin <= value && config.end >= value) {
        offsetValue +=
            ((value - config.begin) / config.scale) * _ruleScaleInterval;
        break;
      } else if (value >= config.begin) {
        var totalCount =
            ((config.end - config.begin) / config.scale).truncate();
        offsetValue += totalCount * _ruleScaleInterval;
      }
    }
    return offsetValue;
  }

  /// 根据数值设置标记位置
  void setPositionByValue(num value) {
    double offsetValue = getPositionByValue(value);
    scrollController.jumpTo(offsetValue);
    fixOffset();
  }
}

class ScaleLineStyle {
  final int scale;
  final Color color;
  final double width;
  final double height;

  const ScaleLineStyle({
    this.scale = -1,
    required this.color,
    required this.width,
    required this.height,
  });
}

class RulerRange {
  final double scale;
  final int begin;
  final int end;
  const RulerRange({
    required this.begin,
    required this.end,
    this.scale = 1,
  });
}
