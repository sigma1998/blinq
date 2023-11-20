// Dart imports:
import 'dart:async';
import 'dart:io';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:blinq/presentation/contacts/pages/contacts/bloc/contacts_event.dart';
import 'package:blinq/presentation/contacts/pages/contacts/bloc/contacts_bloc.dart';
import 'package:blinq/utils/custom_widgets/cupertino_action/cupertino_action.dart';
import 'package:blinq/data/model/contact/request/contact_request_model.dart';
import 'package:blinq/domain/repositories/contacts_repository.dart';
import 'package:blinq/utils/services/media/i_media_service.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:blinq/utils/image_crop_helper.dart';
import 'package:blinq/utils/string_helper.dart';
import 'contact_edit_event.dart';

part 'contact_edit_state.dart';
part 'contact_edit_bloc.freezed.dart';

class ContactEditBloc extends Bloc<ContactEditEvent, ContactEditState> {
  //
  final ContactsBloc contactsBloc;
  final ContactsRepository repository;
  final IMediaService mediaService;

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  String imageUrl = '';

  ContactEditBloc({
    required this.contactsBloc,
    required this.repository,
    required this.mediaService,
  }) : super(const ContactEditState()) {
    on<OnAddContact>(_onAddContact);
    on<OnUpdateContact>(_onUpdateContact);
    on<OnDeleteContact>(_onDeleteContact);
    on<OnUpdateContactImage>(_imagePickerPressed);
  }

  void onNavigateBack() {
    NavigationService.contactsNavigatorKey.currentState?.pop();
  }

  void initializeFields(int id) {
    final contact = contactsBloc.state.contacts?.results
        ?.firstWhere((element) => element.id == id);

    imageUrl = contact?.image ?? '';
    firstNameController.text = contact?.firstName ?? '';
    lastNameController.text = contact?.lastName ?? '';
    phoneNumberController.text =
        MyStringHelper.phoneMask(contact?.phoneNumber ?? '');
  }

  //
  FutureOr<void> _onAddContact(
      OnAddContact event, Emitter<ContactEditState> emit) async {
    try {
      final contact = ContactRequestModel(
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        phoneNumber:
            MyStringHelper.removeNonNumbers(phoneNumberController.text),
      );

      emit(state.copyWith(status: Status.loading));
      await repository.add(contact: contact, file: state.image);
      emit(state.copyWith(status: Status.success));
      onNavigateBack();
      contactsBloc.add(OnFetchContacts());
    } catch (e) {
      emit(state.copyWith(status: Status.initial));
    }
  }

  FutureOr<void> _onUpdateContact(
      OnUpdateContact event, Emitter<ContactEditState> emit) async {
    try {
      final contact = ContactRequestModel(
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        phoneNumber:
            MyStringHelper.removeNonNumbers(phoneNumberController.text),
      );

      emit(state.copyWith(status: Status.loading));
      await repository.update(
          id: event.id, contact: contact, file: state.image);
      emit(state.copyWith(status: Status.success));
      onNavigateBack();
      contactsBloc.add(OnFetchContacts());
    } catch (e) {
      emit(state.copyWith(status: Status.initial));
    }
  }

  FutureOr<void> _onDeleteContact(
      OnDeleteContact event, Emitter<ContactEditState> emit) async {
    try {
      emit(state.copyWith(status: Status.loading));
      await repository.delete(event.id);
      emit(state.copyWith(status: Status.success));
      onNavigateBack();
      contactsBloc.add(OnFetchContacts());
    } catch (e) {
      emit(state.copyWith(status: Status.initial));
    }
  }

  FutureOr<void> _imagePickerPressed(
      OnUpdateContactImage event, Emitter<ContactEditState> emit) async {
    final result = await NavigationService.showMyCupertinoModalPopup(
      actions: [
        MyCupertinoActionSheetAction(
          label: 'strTakeImage'.tr(),
          onPressed: () async {
            final imagePath =
                await mediaService.pickImagePath(AppImageSource.camera);
            final result = await ImageCropHelper.cropImage(imagePath);
            NavigationService.back(result: result);
          },
        ),
        MyCupertinoActionSheetAction(
          label: 'strSelectPhoto'.tr(),
          onPressed: () async {
            final imagePath =
                await mediaService.pickImagePath(AppImageSource.gallery);
            final result = await ImageCropHelper.cropImage(imagePath);
            NavigationService.back(result: result);
          },
        ),
      ],
    );
    if (result != null) {
      emit(state.copyWith(image: result));
    }
  }
}
