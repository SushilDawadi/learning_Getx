import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'package:learning_getx/DemoController.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    DemoController controller = Get.put(DemoController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: SingleChildScrollView(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("EXAMPLE 1 "),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    controller.number.value++;
                  },
                  child: const Text(
                    '+',
                    style: TextStyle(fontSize: 36),
                  ),
                ),
                Obx(
                  () => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      controller.number.toString(),
                      style: TextStyle(fontSize: 36),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.number.value--;
                  },
                  child: const Text(
                    '-',
                    style: TextStyle(fontSize: 36),
                  ),
                ),
              ],
            ),
            const Text("EXAMPLE 2 "),
            Padding(
              padding: EdgeInsets.all(45.0),
              child: TextField(
                controller: controller.nameController,
              ),
            ),
            Obx(
              () => Text(controller.name.toString()),
            ),
            ElevatedButton(
                onPressed: () {
                  controller.setName();
                },
                child: Text("Submit")),

            // EXAMPLE 3
            Obx(() => Slider(
                  value: controller.sliderValue.value,
                  min: 0,
                  max: 100,
                  onChanged: (value) {
                    controller.sliderValue.value = value;
                  },
                )),

            Obx(
              () => Text(
                  "Your Value is : ${controller.sliderValue.toStringAsFixed(0)}"),
            ),
            Obx(() => DropdownButton(
                value: controller.downValue.value,
                items: const [
                  DropdownMenuItem(
                    child: Text("Pokhara"),
                    value: "pokhara",
                  ),
                  DropdownMenuItem(
                    child: Text("Butwol"),
                    value: "butwol",
                  ),
                  DropdownMenuItem(
                    child: Text("Kathmandu"),
                    value: "Kathmandu",
                  )
                ],
                onChanged: (value) {
                  controller.downValue.value = value.toString();
                })),

            Obx(() => Text("Your Value is : ${controller.downValue.value}")),

            // EXAMPLE 4
            Container(
              height: Get.height / 4,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(child: Text("Container")),
            ),
            Obx(
              () => ElevatedButton(
                onPressed: () {
                  controller.changeTheme();
                },
                child: controller.isDarkMode.value
                    ? const Text("Go To Light Theme")
                    : const Text("Go To Dark Theme"),
              ),
            ),
            Obx(() => Switch(
                activeColor: Colors.green,
                value: controller.isDarkMode.value,
                onChanged: (value) {
                  controller.changeTheme();
                })),

            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
