import 'package:node_labs_movie_app/enum/image_path_enum.dart';
import 'package:node_labs_movie_app/utils/extension/image_path_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:node_labs_movie_app/utils/extension/color_extension.dart';

final class AppBarWidget extends StatelessWidget implements PreferredSizeWidget{
  const AppBarWidget({super.key, required this.title, this.isActionVisible, this.actionOnTap, this.isLeadingVisible});
  final String title;
  final bool? isActionVisible;
  final bool? isLeadingVisible;
  final VoidCallback? actionOnTap;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      leading: isLeadingVisible ?? true ? InkWell(
        onTap: () => context.pop(),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: CircleAvatar(
            backgroundColor: ColorExtension.white.withOpacity(0.1),
            child: SvgPicture.asset(ImagePathEnum.LEFT_ARROW_ICON.getImagePath),
          ),
        ),
      ) : SizedBox.shrink(),
      title: Text(
        title,
        style:
        TextStyle(
          color: ColorExtension.white,
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
      ),
      actions: [
        isActionVisible ?? false ? InkWell(
          onTap: actionOnTap,
          child: Container(
            margin: const EdgeInsets.only(right: 16),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: ColorExtension.red,
                borderRadius: BorderRadius.circular(53)
            ),
            child: Row(
              children: [
                SvgPicture.asset(ImagePathEnum.DIAMOND.getImagePath),
                const SizedBox(width: 4),
                Text(
                  "Sınırlı Teklif",
                  style: TextStyle(
                    color: ColorExtension.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
          ),
        ) : SizedBox.shrink()
      ],
    );
  }
}
