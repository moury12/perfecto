import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../my-orders/my_order_details_page.dart';

class ProfileController extends GetxController {
  static ProfileController get to => Get.find();
  RxBool sameAddress = false.obs;
  RxBool isCancel = false.obs;
  RxList<bool> checked = [false, false, false].obs;
  RxList<Process> processes = [
    Process(name: '1', isComplete: true, topic: 'Ordered'),
    Process(name: '2', isComplete: false, topic: 'Accepted'),
    Process(name: '3', isComplete: false, topic: 'Shipped'),
    Process(name: '4', isComplete: false, topic: 'Estimated Delivery'),
  ].obs;

  RxList<Process> cancelProcesses = [
    Process(name: '1', isComplete: true, topic: 'Ordered'),
    Process(name: '5', isComplete: false, topic: 'Cancelled Order'),
  ].obs;
  RxList<Process> Returnprocesses = [
    Process(name: '1', isComplete: true, topic: 'Return Started'),
    Process(name: '2', isComplete: false, topic: 'Drop off the item(s)'),
    Process(name: '3', isComplete: false, topic: 'Item(s) received by Perfecto'),
    Process(name: '4', isComplete: false, topic: 'Refund Sent'),
  ].obs;
  addStepAtIndex1() {
    processes.insert(2, Process(name: '3', isComplete: false, topic: 'Cancellation Requested'));
    processes[1].isComplete = true;
    currentStep.value = 2;
    // Set the current step to the newly added step
  }

  RxInt currentStep = 1.obs;
  RxInt currentStepForReturn = 0.obs;
  RxInt currentStepForCancel = 1.obs;
  void markStepAsCompleted(int index) {
    if (currentStep < processes.length - 1 && !isCancel.value) {
      currentStep = (currentStep + 1);
      processes[index].isComplete = true;
    } else {}
  }

  RxInt rating = 0.obs;
}
