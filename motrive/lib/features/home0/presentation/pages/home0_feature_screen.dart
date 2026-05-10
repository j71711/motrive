import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motrive/features/home0/presentation/cubit/home0_cubit.dart';
import 'package:motrive/features/home0/sub/add_car_card/presentation/pages/add_car_card_feature_widget.dart';

class Home0FeatureScreen extends StatelessWidget {
  const Home0FeatureScreen({super.key});
  @override
  Widget build(BuildContext context) {
      final _ = context.read<Home0Cubit>();

    return Scaffold(
      appBar: AppBar(title: const Text('Home0 Feature Screen')),
      body: Column(children: [
          Center(
            child: IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    final screenSize = MediaQuery.of(context).size;
                    return Center(
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        margin: const EdgeInsets.all(20),
                        child: Container(
                          width: screenSize.width * 0.85,
                          height: screenSize.height * 0.60,
                          padding: const EdgeInsets.all(16),
                          child: const AddCarCardFeatureWidget(),
                        ),
                      ),
                    );
                  },
                );
              },
              icon: const Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}
