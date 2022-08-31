import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homeservice/core/localdisk.repo.dart/disk.repo.dart';
import 'package:homeservice/repository/resgitration.repo.dart';

class MultirepositoryWrapper extends StatelessWidget {
  final Widget child;
  const MultirepositoryWrapper({Key? key, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(providers: [
      RepositoryProvider<ResgitrationRepo>(
        create: (context) => ResgitrationRepo(),
      ),
      RepositoryProvider<DiskRepo>(
        create: (context) => DiskRepo(),
      ),
    ], child: child);
  }
}
