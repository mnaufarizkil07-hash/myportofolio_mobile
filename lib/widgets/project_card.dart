import 'package:flutter/material.dart';
import 'package:myportofolio_mobile/screens/experience_form.dart';
import 'package:myportofolio_mobile/screens/project_form.dart';
import 'package:myportofolio_mobile/screens/project_list_screen.dart';
import 'package:myportofolio_mobile/services/auth_state.dart';
import 'package:myportofolio_mobile/widgets/auth_guard.dart';
import 'package:provider/provider.dart';

// Model untuk merepresentasikan atribut tombol menu aksi
class ItemHomepage {
  final String name;
  final IconData icon;
  final Color color;

  const ItemHomepage(this.name, this.icon, this.color);
}

class ItemCard extends StatelessWidget {
  final ItemHomepage item;

  const ItemCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () async {
          // Menampilkan pesan pop-up (SnackBar) di bawah layar
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text('Kamu telah menekan tombol ${item.name}!'),
              ),
            );

          // Navigate ke halaman yang sesuai
          if (item.name == 'Lihat Proyek') {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProjectListScreen(),
              ),
            );
          } else if (item.name == 'Tambah Proyek') {
            final navigator = Navigator.of(context);
            final loggedIn = await ensureLoggedIn(context);
            if (!loggedIn) return;
            navigator.push(
              MaterialPageRoute(builder: (context) => const ProjectFormPage()),
            );
          } else if (item.name == 'Tambah Pengalaman') {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ExperienceFormPage(),
              ),
            );
          } else if (item.name == 'Logout') {
            final authState = context.read<AuthState>();
            final messenger = ScaffoldMessenger.of(context);
            if (!authState.isLoggedIn) {
              messenger
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  const SnackBar(content: Text('Kamu belum login!')),
                );
              return;
            }
            await authState.logout();
            messenger
              ..hideCurrentSnackBar()
              ..showSnackBar(const SnackBar(content: Text('Berhasil logout!')));
          }
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(item.icon, color: Colors.white, size: 30.0),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
