import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indriver_clone_flutter/src/domain/models/user.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/profile/info/update/bloc/profile_update_bloc.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/profile/info/update/bloc/profile_update_event.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/profile/info/update/bloc/profile_update_state.dart';
import 'package:indriver_clone_flutter/src/presentation/utils/blog_form_item.dart';
import 'package:indriver_clone_flutter/src/presentation/utils/gallery_or_photo_dialog.dart';
import 'package:indriver_clone_flutter/src/presentation/widgets/default_text_field.dart';

class ProfileUpdateContent extends StatelessWidget {
  User? user;
  ProfileUpdateState state;

  ProfileUpdateContent(this.state, this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: state.formKey, //* keep changes state
      child: Stack(
        children: [
          Column(
            children: [
              _headerProfile(context),
              Spacer(),
              _actionProfile(context, "ACTUALIZAR USUARIO", Icons.check),
              SizedBox(height: 35),
            ],
          ),
          _cardUserInfo(context),
        ],
      ),
    );
  }

  Widget _imageUser(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GalleryOrPhotoDialog(
          context,
          () => {context.read<ProfileUpdateBloc>().add(PickImage())},
          () => {context.read<ProfileUpdateBloc>().add(TakePhoto())},
        );
      },
      child: Container(
        width: 115,
        margin: EdgeInsets.only(top: 15, bottom: 15),
        child: AspectRatio(
          aspectRatio: 1,
          child: ClipOval(
            child:
                state.image != null
                    ? Image.file(state.image!, fit: BoxFit.cover)
                    : FadeInImage.assetNetwork(
                      placeholder: "assets/img/my_user.png",
                      image:
                          "https://e7.pngegg.com/pngimages/552/1/png-clipart-dogs-dogs-thumbnail.png",
                      fit: BoxFit.cover,
                      fadeInDuration: Duration(seconds: 1),
                    ),
          ),
        ),
      ),
    );
  }

  Widget _cardUserInfo(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 85),
      width: MediaQuery.of(context).size.width,
      height: 540,
      child: Card(
        color: Colors.white,
        surfaceTintColor: Colors.white,
        child: Column(
          children: [
            _imageUser(context),

            DefaultTextField(
              text: 'Nombre',
              icon: Icons.person,
              onChanged: (text) {
                context.read<ProfileUpdateBloc>().add(
                  NameChanged(name: BlocFormItem(value: text)),
                );
              },
              backgroundColor: Colors.grey[200]!,
              initialValue: user?.name,
              validator: (value) {
                return state?.name.error;
              },
            ),

            DefaultTextField(
              text: 'Apellido',
              icon: Icons.person_outline,
              onChanged: (text) {
                context.read<ProfileUpdateBloc>().add(
                  LastnameChanged(lastname: BlocFormItem(value: text)),
                );
              },
              backgroundColor: Colors.grey[200]!,
              initialValue: user?.lastname,
              validator: (value) {
                return state?.lastname.error;
              },
            ),

            DefaultTextField(
              text: 'Telefono',
              icon: Icons.phone,
              onChanged: (text) {
                context.read<ProfileUpdateBloc>().add(
                  PhoneChanged(phone: BlocFormItem(value: text)),
                );
              },
              backgroundColor: Colors.grey[200]!,
              initialValue: user?.phone,
              validator: (value) {
                return state?.phone.error;
              },
            ),
          ],
        ),
      ),
    );
  }

  // ciruclar icon and styles
  Widget _actionProfile(BuildContext context, String option, IconData icon) {
    return GestureDetector(
      onTap: () {
        if (state!.formKey!.currentState != null) {
          if (state!.formKey!.currentState!.validate()) {
            context.read<ProfileUpdateBloc>().add(FormSubmit());
          }
        } else {
          context.read<ProfileUpdateBloc>().add(FormSubmit());
        }
      },
      child: Container(
        margin: EdgeInsets.only(left: 10, right: 10, top: 15),
        child: ListTile(
          title: Text(option, style: TextStyle(fontWeight: FontWeight.bold)),
          leading: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color.fromARGB(255, 14, 29, 106),
                  Color.fromARGB(255, 30, 112, 227),
                ],
              ),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Icon(icon, color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _headerProfile(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      padding: EdgeInsets.only(top: 40),
      height: MediaQuery.of(context).size.height * 0.35,
      width:
          MediaQuery.of(context).size.width, // or full width: double.infinity
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color.fromARGB(255, 12, 38, 145),
            Color.fromARGB(255, 34, 156, 249),
          ],
        ),
      ),
      child: Text(
        "PERFIL DE USUARIO",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }
}