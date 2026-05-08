import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motrive/features/home0/presentation/cubit/home0_cubit.dart';

class Home0FeatureScreen extends StatelessWidget {
  const Home0FeatureScreen({super.key});
  @override
  Widget build(BuildContext context) {
      final _ = context.read<Home0Cubit>();

    return Scaffold(
      appBar: AppBar(title: const Text('Home0 Feature Screen')),
      body: Column(children: [
          
        ],
      ),
    );
  }
}
