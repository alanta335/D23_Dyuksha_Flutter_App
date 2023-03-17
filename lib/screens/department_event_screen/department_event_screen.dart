import 'package:flutter/material.dart';

import '../../widgets/cypberpunk_background_scaffold.dart';
import 'dark_button_group.dart';
import 'image_holder.dart';

class DepartmentEventScreen extends StatelessWidget {
  const DepartmentEventScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CyberpunkBackgroundScaffold(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            SafeArea(child: SizedBox()),
            Expanded(
              flex: 2,
              child: ImageHolder(),
            ),
            Expanded(
              child: DarkButtonGroup(),
            ),
          ],
        ),
      ),
    );
  }
}
