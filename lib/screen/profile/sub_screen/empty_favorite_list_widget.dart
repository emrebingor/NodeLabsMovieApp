part of '../profile_screen.dart';

final class _EmptyListWidget extends StatelessWidget {
  const _EmptyListWidget();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Column(
        children: [
          SizedBox(
            height: 50,
            width: 50,
            child: Icon(Icons.movie, color: Colors.white),
          ),
          Text(
            'Favorilerinizden film yok lütfen film ekleyiniz.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}