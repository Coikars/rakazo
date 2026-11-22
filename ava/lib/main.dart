import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_svg/flutter_svg.dart';

const forkUrl = String.fromEnvironment('RAKAZO_URL', defaultValue: 'https://your-rakazo-fork.example');
void main() => runApp(const AvaApp());

class AvaApp extends StatelessWidget {
  const AvaApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Ava', debugShowCheckedModeBanner: false,
    theme: ThemeData(brightness: Brightness.dark, colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF7C4DFF), brightness: Brightness.dark), scaffoldBackgroundColor: const Color(0xFF11131A), useMaterial3: true),
    home: const AvaHomePage(),
  );
}
class AvaHomePage extends StatefulWidget { const AvaHomePage({super.key}); @override State<AvaHomePage> createState() => _AvaHomePageState(); }
class _AvaHomePageState extends State<AvaHomePage> {
  late final TextEditingController _url = TextEditingController(text: forkUrl); String? _error;
  @override void dispose() { _url.dispose(); super.dispose(); }
  Future<void> _openFork() async { final uri = Uri.tryParse(_url.text.trim()); if (uri == null || !(uri.scheme == 'https' || uri.scheme == 'http')) { setState(() => _error = 'Enter the HTTPS address of your Rakazo fork.'); return; } final ok = await launchUrl(uri, mode: LaunchMode.externalApplication); if (!ok && mounted) setState(() => _error = 'Could not open the Rakazo fork.'); }
  @override Widget build(BuildContext context) => Scaffold(body: SafeArea(child: Center(child: ConstrainedBox(constraints: const BoxConstraints(maxWidth: 520), child: Padding(padding: const EdgeInsets.all(28), child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [SvgPicture.asset('assets/ava_icon.svg', width: 112, height: 112), const SizedBox(height: 24), Text('Ava', style: Theme.of(context).textTheme.displaySmall), const SizedBox(height: 8), Text('Your Rakazo fork', style: Theme.of(context).textTheme.titleMedium), const SizedBox(height: 36), TextField(controller: _url, keyboardType: TextInputType.url, decoration: const InputDecoration(labelText: 'Fork address', hintText: 'https://your-fork.example', border: OutlineInputBorder(), prefixIcon: Icon(Icons.link))), if (_error != null) ...[const SizedBox(height: 10), Text(_error!, style: TextStyle(color: Theme.of(context).colorScheme.error))], const SizedBox(height: 20), FilledButton.icon(onPressed: _openFork, icon: const Icon(Icons.open_in_new), label: const Text('Open Rakazo'))]))))));
}
