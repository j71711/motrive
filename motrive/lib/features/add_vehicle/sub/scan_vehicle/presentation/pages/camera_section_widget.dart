import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CameraSectionWidget extends HookWidget {
  final Function(String imagePath) onCapture;
  const CameraSectionWidget({super.key, required this.onCapture});

  @override
  Widget build(BuildContext context) {
    final controller = useState<CameraController?>(null);
    final isLoading = useState(true);

    useEffect(() {
      Future<void> initCamera() async {
        final cameras = await availableCameras();
        final backCamera = cameras.firstWhere(
          (camera) => camera.lensDirection == CameraLensDirection.back,
        );
        final cameraController = CameraController(
          backCamera,
          ResolutionPreset.high,
          enableAudio: false,
        );

        await cameraController.initialize();
        controller.value = cameraController;
        isLoading.value = false;
      }

      initCamera();
      return () {
        controller.value?.dispose();
      };
    }, []);

    Future<void> captureImage() async {
      if (controller.value == null) return;
      final image = await controller.value!.takePicture();
      onCapture(image.path);
    }

    if (isLoading.value || controller.value == null) {
      return const Center(child: CircularProgressIndicator());
    }
    return Stack(
      fit: StackFit.expand,
      children: [
        CameraPreview(controller.value!),
        Center(
          child: Container(
            width: 300,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white, width: 2),
            ),
          ),
        ),
        Positioned(
          bottom: 110,
          left: 0,
          right: 0,
          child: Center(
            child: Text(
              "put the vin number inside the frame.",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
        Positioned(
          bottom: 20,
          left: 0,
          right: 0,
          child: Center(
            child: GestureDetector(
              onTap: captureImage,
              child: Container(
                width: 85,
                height: 85,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}