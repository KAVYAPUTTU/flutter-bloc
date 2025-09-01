part of 'counter_bloc.dart';

sealed class CounterEvents {}

final class CounterIncremented extends CounterEvents {}

final class CounterDecremented extends CounterEvents {}
