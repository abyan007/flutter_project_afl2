import 'package:flutter/material.dart';

class Backdrop extends StatefulWidget {
  final Widget frontLayer;
  final Widget backLayer;
  final Widget frontTitle;
  final Widget backTitle;

  const Backdrop({
    super.key,
    required this.frontLayer,
    required this.backLayer,
    required this.frontTitle,
    required this.backTitle,
  });

  @override
  State<Backdrop> createState() => _BackdropState();
}

class _BackdropState extends State<Backdrop>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  static const double _kFlingVelocity = 2.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      value: 1.0,
      vsync: this,
    );
  }

  void _toggleBackdropLayerVisibility() {
    _controller.fling(
      velocity: isFrontLayerVisible ? -_kFlingVelocity : _kFlingVelocity,
    );
  }

  bool get isFrontLayerVisible {
    final AnimationStatus status = _controller.status;
    return status == AnimationStatus.completed ||
        status == AnimationStatus.forward;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        titleSpacing: 0.0,
        title: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: isFrontLayerVisible ? widget.frontTitle : widget.backTitle,
        ),
        leading: IconButton(
          icon: AnimatedIcon(
            icon: AnimatedIcons.close_menu,
            progress: _controller.view,
          ),
          onPressed: _toggleBackdropLayerVisibility,
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          const double layerTitleHeight = 48.0;
          final Size layerSize = constraints.biggest;
          final double layerTop = layerSize.height - layerTitleHeight;

          return Stack(
            children: [
              ExcludeSemantics(
                excluding: isFrontLayerVisible,
                child: widget.backLayer,
              ),
              AnimatedBuilder(
                animation: _controller.view,
                builder: (context, child) {
                  return PositionedTransition(
                    rect: RelativeRectTween(
                      begin: RelativeRect.fromLTRB(
                          0, layerTop, 0, -(layerTop - layerTitleHeight)),
                      end: const RelativeRect.fromLTRB(0, 0, 0, 0),
                    ).animate(_controller.view),
                    child: Material(
                      elevation: 5.0,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16.0),
                        topRight: Radius.circular(16.0),
                      ),
                      child: Column(
                        children: [
                          // judul kecil di atas frontLayer
                          SizedBox(
                            height: layerTitleHeight,
                            child: Center(child: widget.frontTitle),
                          ),
                          // konten produk isi layar penuh + scroll
                          Expanded(
                            child: widget.frontLayer,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
