import 'package:flutter/material.dart';

class NamesView extends StatefulWidget {
  const NamesView({super.key});

  @override
  State<NamesView> createState() => _NamesViewState();
}

class _NamesViewState extends State<NamesView> {
  final List<String> _names = ['André'];
  final _name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Lista de Nomes',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _name,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _names.add(_name.text);
                      _name.text = '';
                    });
                  },
                  icon: const Icon(
                    Icons.add,
                    size: 24,
                  ),
                ),
                hintText: 'insira um nome',
                hintStyle: const TextStyle(
                  fontSize: 24,
                ),
              ),
              style: const TextStyle(
                fontSize: 24,
                decoration: TextDecoration.none,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: _names.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      radius: 24,
                      child: Text(
                        _names[index][0],
                        style:
                            const TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ),
                    title: Text(
                      _names[index],
                      style: const TextStyle(fontSize: 24),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, size: 32),
                      onPressed: () {
                        setState(() {
                          _names.removeAt(index);
                        });
                      },
                    ),
                  );
                },
                shrinkWrap: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
