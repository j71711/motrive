import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:motrive/core/constants/app_colors.dart';
import 'package:motrive/core/extensions/context_extensions.dart';
import 'package:motrive/features/home/sub/add_expense/presentation/cubit/add_expense_cubit.dart';
import 'package:motrive/features/home/sub/add_expense/presentation/cubit/add_expense_state.dart';

class AddExpenseFeatureWidget extends StatelessWidget {
  const AddExpenseFeatureWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddExpenseCubit(GetIt.I.get()),
      child: Builder(
        builder: (context) {
    final cubit = context.read<AddExpenseCubit>();
    final formKey =  GlobalKey<FormState>();    
    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      minChildSize: 0.5,
      maxChildSize: 0.7,

      builder: (context, scrollController) {
        return Container(
          padding: EdgeInsets.only(
            // left: 20,
            // right: 20,
            top: 16,
            // bottom: MediaQuery.of(context).viewInsets.bottom + 20,
          ),

          child: SingleChildScrollView(
            controller: scrollController,

            child: Form(
              key: formKey,

              child: Column(
                spacing: 12,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 50,
                      height: 5,
                      decoration: BoxDecoration(
                        color: AppColors.textSecondary,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),

                  // const Gap(20),

                  const Text(
                    'Add Expense',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const Gap(24),

                                       
                  DropdownButtonFormField<String>(
                    value: cubit.selectedCategory,
                    decoration: const InputDecoration(labelText: 'Category'),
                    items: [ 'Fuel','Vehicle insurance', 'Maintenance', 'Oil', 'Traffic violation' ,'Other'].map((e) => 
                      DropdownMenuItem(value: e, child: Text(e))).toList(),
                    onChanged: (val) => cubit.selectedCategory = val,
                    validator: (val) => val == null ? 'required' : null,
                  ),
                      
                  TextFormField(
                    controller: cubit.costController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: 'Cost'),
                    validator: (val) => (val == null || val.isEmpty) ? 'required' : null,
                  ),
                      
                  TextFormField(
                    controller: cubit.kmController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: 'Odometer'),
                    validator: (val) => (val == null || val.isEmpty) ? 'required' : null,
                  ),
                      
                  const Gap(30),
                      
                  BlocConsumer<AddExpenseCubit, AddExpenseState>(
                    listener: (context, state) {
                      switch (state){
                        case AddExpenseSuccessState _:
                        return context.showSnackBar('Saved successfully');
                        case AddExpenseErrorState _:
                        return context.showSnackBar(state.message);
                      }
                    },
                    builder: (context, state) {
                      final isLoading = state is AddExpensesLoadingState;
                      return SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: isLoading ? null : () {
                            if (formKey.currentState!.validate()) {
                              cubit.addExpenseMethod();
                            }
                          },
                          child: isLoading 
                            ? const CircularProgressIndicator() 
                            : const Text("save"),
                        ),
                      );
                    },
                  ),

                ],
              ),
            ),
          ),
        );
      },
    );
  },),);}
}