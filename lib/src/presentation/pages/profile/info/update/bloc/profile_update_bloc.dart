

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/profile/info/update/bloc/profile_update_event.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/profile/info/update/bloc/profile_update_state.dart';
import 'package:indriver_clone_flutter/src/presentation/utils/blog_form_item.dart';

class ProfileUpdateBloc extends Bloc<ProfileUpdateEvent, ProfileUpdateState>{

  ProfileUpdateBloc() : super(ProfileUpdateState()) {
    final formKey = GlobalKey<FormState>();
    on<ProfileUpdateInitEvent>((event, emit) {
      emit(state.copyWith(
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

    on<FormSubmit>((event, emit) {
      print('Name: ${state.name.value}');
      print('Lastname: ${state.lastname.value}');
      print('Phone: ${state.phone.value}');
    });

  }
}