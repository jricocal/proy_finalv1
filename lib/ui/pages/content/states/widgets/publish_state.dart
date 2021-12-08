import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_sample_3/domain/models/user_status.dart';
import 'package:simple_sample_3/domain/use_cases/controllers/status_controller.dart';

class PublishState extends StatefulWidget {
  const PublishState({Key? key}) : super(key: key);

  @override
  _PublishStateState createState() => _PublishStateState();
}

class _PublishStateState extends State<PublishState> {
  late bool _buttonDisabled;
  late TextEditingController stateController;
  late StatusController statusController;

  @override
  void initState() {
    super.initState();
    _buttonDisabled = true;
    stateController = TextEditingController();
    statusController = Get.find<StatusController>();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Publicar Estado",
              style: Theme.of(context).textTheme.headline2,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: TextField(
                controller: stateController,
                keyboardType: TextInputType.multiline,
                onChanged: (text) {
                  setState(() {
                    text == ""
                        ? _buttonDisabled = true
                        : _buttonDisabled = false;
                  });
                },
                // dynamic text lines
                maxLines: null,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Estado',
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ElevatedButton(
                    child: const Text("Publicar"),
                    onPressed: _buttonDisabled
                        ? null
                        : () {
                            setState(() {
                              _buttonDisabled = true;
                              UserStatus status = UserStatus(
                                picUrl:
                                    'https://uifaces.co/our-content/donated/gPZwCbdS.jpg',
                                name: 'Example',
                                email: 'example@ejemplo.com',
                                message: stateController.text,
                              );
                              statusController.sendStatus(status.toJson()).then(
                                    (value) => Get.back(),
                                  );
                            });
                          },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    stateController.dispose();
    super.dispose();
  }
}
