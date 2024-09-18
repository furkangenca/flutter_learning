import 'package:flutter/material.dart';

@immutable
abstract class CounterState {
  final int count;

  CounterState(this.count);
}

class CounterInitial extends CounterState {
  CounterInitial(int count) : super(count);
}

