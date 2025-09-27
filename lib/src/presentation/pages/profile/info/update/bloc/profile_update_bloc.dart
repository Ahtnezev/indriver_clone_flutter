

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indriver_clone_flutter/src/domain/useCases/users/users_use_cases.dart';
import 'package:indriver_clone_flutter/src/domain/utils/resource.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/profile/info/update/bloc/profile_update_event.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/profile/info/update/bloc/profile_update_state.dart';
import 'package:indriver_clone_flutter/src/presentation/utils/blog_form_item.dart';

class ProfileUpdateBloc extends Bloc<ProfileUpdateEvent, ProfileUpdateState>{

  UsersUseCases usersUseCases;
  final formKey = GlobalKey<FormState>();

  ProfileUpdateBloc(this.usersUseCases) : super(ProfileUpdateState()) {
    
    on<ProfileUpdateInitEvent>((event, emit) {
      emit(state.copyWith(
          id: event.user?.id,
        name: BlocFormItem(value: event.user?.name ?? '',),
        lastname: BlocFormItem(value: event.user?.lastname ?? '',),
        phone: BlocFormItem(value: event.user?.phone ?? '',),
        formKey: formKey
      ));
    });


    on<NameChanged>((event, emit) {
      emit(state.copyWith(name: BlocFormItem(value: event.name.value, error: event.name.value.isEmpty ? 'Name cannot be empty' : null), formKey: formKey));
    });

    on<LastnameChanged>((event, emit) {
      emit(state.copyWith(lastname: BlocFormItem(value: event.lastname.value, error: event.lastname.value.isEmpty ? 'Lastname cannot be empty' : null), formKey: formKey));
    });

    on<PhoneChanged>((event, emit) {
      emit(state.copyWith(phone: BlocFormItem(value: event.phone.value, error: event.phone.value.isEmpty ? 'Phone cannot be empty' : null), formKey: formKey));
    });

    on<FormSubmit>((event, emit) async {
      debugPrint('Name: ${state.name.value}');
      debugPrint('Lastname: ${state.lastname.value}');
      debugPrint('Phone: ${state.phone.value}');

      emit(state.copyWith(response: Loading(), formKey: formKey));
      Resource response = await usersUseCases.update.run(
        state.id,
        state.toUser(),
        null,
      );
      emit(state.copyWith(response: response, formKey: formKey));
    });

  }
}