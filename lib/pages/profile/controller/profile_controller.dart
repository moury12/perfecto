import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../my-orders/my_order_details_page.dart';

class ProfileController extends GetxController {
  static ProfileController get to => Get.find();
  RxBool sameAddress = false.obs;
  RxList<Process> processes = [
    Process(name: '1', isComplete: true, topic: 'Ordered'),
    Process(name: '2', isComplete: false, topic: 'Processing'),
    Process(name: '3', isComplete: false, topic: 'Shipped'),
    Process(name: '4', isComplete: false, topic: 'Estimated Delivery'),
  ].obs;
   addStepAtIndex1() {

    processes.insert(2, Process(name: '3', isComplete: false, topic: 'Cancellation Requested'));
    processes[1].isComplete=true;
    currentStep.value=2;
    // Set the current step to the newly added step

  }
  RxInt currentStep =1.obs;
  void markStepAsCompleted(int index) {if(currentStep<processes.length){

      currentStep = (currentStep + 1);
      processes[index].isComplete = true;
   }else{

  }
  }

  RxInt rating = 0.obs;
}
