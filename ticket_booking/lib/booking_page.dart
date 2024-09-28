import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_booking/booking_list.dart';
import 'package:ticket_booking/ticket_booking/booking_controller.dart';

// ignore: must_be_immutable
class BookingPage extends StatelessWidget {
  BookingPage({super.key});
  BookingController controller = Get.find<BookingController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Hello World'),
         
        ));
  }
}