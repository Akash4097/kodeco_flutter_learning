import 'package:flutter/material.dart';
import 'game_model.dart';
import 'dart:ui' as ui;
import 'package:flutter/services.dart';
import 'slider_thumb_image.dart';

class Control extends StatefulWidget {
  final GameModel model;

  const Control({
    super.key,
    required this.model,
  });

  @override
  State<Control> createState() => _ControlState();
}

class _ControlState extends State<Control> {
  ui.Image? sliderImage;

  Future<ui.Image> _loadAsset(String asset) async {
    final data = await rootBundle.load(asset);
    final codec = await ui.instantiateImageCodec(data.buffer.asUint8List());
    final frame = await codec.getNextFrame();
    return frame.image;
  }

  @override
  void initState() {
    _loadAsset("assets/images/nub.png").then((image) {
      setState(() {
        sliderImage = image;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 90.0),
          child: Text(
            "1",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: Colors.red[700],
              inactiveTrackColor: Colors.red[700],
              trackShape: const RoundedRectSliderTrackShape(),
              trackHeight: 8.0,
              thumbColor: Colors.redAccent,
              overlayColor: Colors.red.withAlpha(32),
              overlayShape: const RoundSliderOverlayShape(overlayRadius: 28.0),
              thumbShape: SliderThumbImage(sliderImage),
            ),
            child: Slider(
              value: widget.model.current.toDouble(),
              onChanged: (newValue) {
                setState(() {
                  widget.model.current = newValue.toInt();
                });
              },
              min: 1,
              max: 100,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(right: 90.0),
          child: Text(
            "100",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
