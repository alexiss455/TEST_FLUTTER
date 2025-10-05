import 'dart:async';
import 'package:FBM/components/_custom_colors.dart';
import 'package:FBM/components/_custom_text.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class SelfieVerificationPage extends StatefulWidget {
  @override
  _SelfieVerificationPageState createState() => _SelfieVerificationPageState();
}

class _SelfieVerificationPageState extends State<SelfieVerificationPage>
    with TickerProviderStateMixin {
  CameraController? _controller;
  Future<void>? _initializeControllerFuture;

  double _progress = 0.0;
  Timer? _timer;
  bool _ocrProcessing = false;
  bool _success = false;

  late final AnimationController _checkController;

  @override
  void initState() {
    super.initState();
    _checkController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 450),
    );
    _initCamera();
  }

  Future<void> _initCamera() async {
    try {
      final cameras = await availableCameras();
      final front = cameras.firstWhere(
        (c) => c.lensDirection == CameraLensDirection.front,
      );

      _controller = CameraController(
        front,
        ResolutionPreset.medium,
        enableAudio: false,
      );
      _initializeControllerFuture = _controller!.initialize();
      setState(() {});
      _initializeControllerFuture!.then((_) => _startFakeScan());
    } catch (e) {
      print("Camera error: $e");
    }
  }

  void _startFakeScan() {
    _timer = Timer.periodic(Duration(milliseconds: 40), (t) {
      setState(() {
        _progress += 0.01;
        if (_progress >= 1.0) {
          _progress = 1.0;
          t.cancel();
          _startFakeOcrProcessing();
        }
      });
    });
  }

  void _startFakeOcrProcessing() async {
    setState(() => _ocrProcessing = true);

    await Future.delayed(Duration(seconds: 2));

    setState(() {
      _success = true;
      _ocrProcessing = false;
    });
    _checkController.forward();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller?.dispose();
    _checkController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bg = AppColors.black.withOpacity(0.7);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: bg,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.close, color: AppColors.white),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        title: CustomText(
          text: 'Sefle Verification',
          fontWeight: FontWeight.w600,
          color: AppColors.white,
          fontSize: 18,
        ),
      ),
      body: SafeArea(
        child: FutureBuilder<void>(
          future: _initializeControllerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return Center(child: CircularProgressIndicator());
            }

            return Stack(
              children: [
                Positioned.fill(child: CameraPreview(_controller!)),
                Positioned.fill(
                  child: Container(
                    color: bg,
                  ),
                ),
                Center(
                  child: _buildScanCircle(240),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomText(
                          text: _success
                              ? 'Verification Successful'
                              : 'Scanning Your Face',
                          fontSize: 20,
                          color: AppColors.white,
                        ),
                        SizedBox(height: 8),
                        CustomText(
                          textAlign: TextAlign.center,
                          text: _success
                              ? 'Thank you — your face has been verified.'
                              : (_ocrProcessing
                                  ? 'Processing OCR...'
                                  : 'Please keep your face centered on the screen and facing forward'),
                          color: AppColors.white,
                          fontSize: 14,
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildScanCircle(double size) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Circular progress arc
          SizedBox(
            width: size,
            height: size,
            child: Transform.rotate(
              angle: -3.14159 / 2,
              child: CircularProgressIndicator(
                value: _progress,
                strokeWidth: 8,
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.success),
                backgroundColor: AppColors.white,
              ),
            ),
          ),

          // Transparent inner circle (so camera shows through)
          Container(
            width: size - 16,
            height: size - 16,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.transparent,
              border: Border.all(color: AppColors.transparent),
            ),
          ),

          // Success check overlay
          if (_success)
            ScaleTransition(
              scale: Tween<double>(begin: 0.6, end: 1.0).animate(
                CurvedAnimation(
                    parent: _checkController, curve: Curves.elasticOut),
              ),
            ),
        ],
      ),
    );
  }
}
