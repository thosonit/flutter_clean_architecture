import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:ts_domain/usecases/check_auth_status_usecase.dart';
import 'package:ts_domain/usecases/sign_in_usecase.dart';
import 'package:ts_domain/usecases/sign_out_usecase.dart';

List<SingleChildWidget> createUseCaseProviders() {
  return [
    Provider<SignInUseCase>(create: (context) => SignInUseCase(context.read())),
    Provider<SignOutUseCase>(
      create: (context) => SignOutUseCase(context.read()),
    ),
    Provider<CheckAuthStatusUseCase>(
      create: (context) => CheckAuthStatusUseCase(context.read()),
    ),
  ];
}
