import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:todo_list_provider/app/core/notifier/default_change_notifier.dart';
import 'package:todo_list_provider/app/core/ui/messages.dart';

class DefautlListenerNotifier {
  final DefaultChangeNotifier changeNotifier;

  DefautlListenerNotifier({required this.changeNotifier});

  void listener({
    required BuildContext context,
    required SuccesVoidCallback successCallback,
     EverVoidCallback? evercallback,
    ErrorVoidCallback? errorCallback
  }) {
    changeNotifier.addListener(() {
      if(evercallback != null) {
      evercallback(changeNotifier, this);
      }
      
      if (changeNotifier.loading) {
        Loader.show(context as BuildContext);
      } else {
        Loader.hide();
      }

      if (changeNotifier.hasError) {
        if(errorCallback != null) {
          errorCallback(changeNotifier, this);
        }
        Messages.of(context).ShowError(changeNotifier.error ?? 'Erro interno');
      } else if (changeNotifier.isSucess) {
        successCallback(changeNotifier, this);
      }
    });
  }

  void dispose() {
    changeNotifier.removeListener(() {});
  }
}

typedef SuccesVoidCallback = void Function(
    DefaultChangeNotifier notifier, DefautlListenerNotifier listenerInstance);

    typedef ErrorVoidCallback = void Function(
    DefaultChangeNotifier notifier, DefautlListenerNotifier listenerInstance);

     typedef EverVoidCallback = void Function(
    DefaultChangeNotifier notifier, DefautlListenerNotifier listenerInstance);
