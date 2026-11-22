import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

const _defaultRakazoUrl = 'https://replace-with-your-rakazo-host.example';

void main() {
  const configuredUrl = String.fromEnvironment('RAKAZO_URL');
  runApp(AvaApp(
    rakazoUrl: configuredUrl.isEmpty ? _defaultRakazoUrl : configuredUrl,
  ));
}

class AvaApp extends StatelessWidget {
  const AvaApp({super.key, required this.rakazoUrl});

  final String rakazoUrl;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ava',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        scaffoldBackgroundColor: const Color(0xfff7f7f7),
        useMaterial3: true,
      ),
      home: AvaLauncher(rakazoUrl: rakazoUrl),
    );
  }
}

class AvaLauncher extends StatefulWidget {
  const AvaLauncher({super.key, required this.rakazoUrl});

  final String rakazoUrl;

  @override
  State<AvaLauncher> createState() => _AvaLauncherState();
}

class _AvaLauncherState extends State<AvaLauncher> {
  String? _error;

  Future<void> _openRakazo() async {
    final uri = Uri.tryParse(widget.rakazoUrl);
    if (uri == null || !uri.hasScheme) {
      setState(() => _error = 'Set a valid RAKAZO_URL before opening Ava.');
      return;
    }
    final opened = await launchUrl(uri, mode: LaunchMode.platformDefault);
    if (!opened && mounted) {
      setState(() => _error = 'This device could not open the Rakazo address.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 420),
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/ava_icon.svg', width: 112, height: 112),
                const SizedBox(height: 24),
                Text('Ava', style: Theme.of(context).textTheme.displaySmall),
                const SizedBox(height: 8),
                Text(
                  'Open your forked Rakazo app.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 28),
                FilledButton.icon(
                  onPressed: _openRakazo,
                  icon: const Icon(Icons.open_in_new),
                  label: const Text('Open Rakazo'),
                ),
                if (_error != null) ...[
                  const SizedBox(height: 16),
                  Text(_error!, textAlign: TextAlign.center),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
