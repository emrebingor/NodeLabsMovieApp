part of '../profile_screen.dart';

final class _UserInformationRowWidget extends StatelessWidget {
  const _UserInformationRowWidget({
    required this.user,
  });

  final User? user;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        SizedBox(
          width: 60,
          height: 60,
          child: ClipOval(
            child: Image.network(
              user?.photoUrl ?? '',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Icon(Icons.person),
            ),
          ),
        ),

        const SizedBox(width: 10),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user?.name ?? '',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),

              Text(
                "ID:${user?.id ?? ''}",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.5),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
        ),

        const SizedBox(width: 10),

        InkWell(
          onTap: () => context.push(RoutePaths.profileDetail),
          child: Container(
            height: 36,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 19),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              "Fotoğraf Ekle",
              style: TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ],
    );
  }
}