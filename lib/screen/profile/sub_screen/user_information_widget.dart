part of '../profile_screen.dart';

final class _UserInformationRowWidget extends StatelessWidget {
  const _UserInformationRowWidget({
    required this.user,
    required this.onTap,
  });

  final User? user;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        SizedBox(
          width: 60,
          height: 60,
          child: ClipOval(
            child: (user?.photoUrl?.isNotEmpty ?? false) ? Image.network(
              user?.photoUrl ?? '',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Icon(Icons.person),
            ) : Container(
              color: ColorExtension.grey,
              alignment: Alignment.center,
              child: Icon(
                Icons.person,
                size: 30,
                color: ColorExtension.white,
              ),
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
                  color: ColorExtension.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),

              Text(
                "ID:${user?.id ?? ''}",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: ColorExtension.white.withOpacity(0.5),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
        ),

        const SizedBox(width: 10),

        InkWell(
          onTap: onTap,
          child: Container(
            height: 36,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 19),
            decoration: BoxDecoration(
              color: ColorExtension.red,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              "Fotoğraf Ekle",
              style: TextStyle(
                color: ColorExtension.white,
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