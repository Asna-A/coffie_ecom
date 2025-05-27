import 'package:coffie_ecom/app.dart';
import 'package:coffie_ecom/domain/core/dependency_injection/di_configuration.dart';
import 'package:flutter/material.dart';

void main() async {
  await configureInjection();
  runApp(const MyApp());
}
