import 'package:node_labs_movie_app/components/boxes/icon_text_box_widget.dart';
import 'package:node_labs_movie_app/components/boxes/stack_box_component.dart';
import 'package:node_labs_movie_app/components/buttons/button_widget.dart';
import 'package:node_labs_movie_app/components/text_widgets/description_text_widget.dart';
import 'package:node_labs_movie_app/components/text_widgets/title_text_widget.dart';
import 'package:node_labs_movie_app/enum/image_path_enum.dart';
import 'package:flutter/material.dart';
import 'package:node_labs_movie_app/utils/extension/color_extension.dart';

final class OfferScreen extends StatelessWidget {
  const OfferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 17) + const EdgeInsets.only(top: 24, bottom: 30),
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 68, 0, 0),
            Color.fromARGB(255, 0, 0, 0),
            Color.fromARGB(255, 0, 0, 0),
            Color.fromARGB(255, 68, 0, 0),
          ],
        ),
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(24),
          topLeft: Radius.circular(24),
        ),
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TitleTextWidget(
              text: 'Sınırlı Teklif',
            ),
            const SizedBox(height: 5),
            DescriptionTextWidget(
              text: 'Jeton paketi’ni seçerek bonus\n kazanın ve yeni bölümlerin kilidini açın!',
            ),
            const SizedBox(height: 13),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20) + const EdgeInsets.only(top: 20, bottom: 15),
              decoration: BoxDecoration(
                border: Border.all(color: ColorExtension.white.withOpacity(0.1)),
                borderRadius: BorderRadius.circular(8),
                gradient: LinearGradient(
                  colors: [
                    ColorExtension.white.withOpacity(0.1),
                    ColorExtension.white.withOpacity(0.1),
                  ],
                ),
              ),
              child: Column(
                children: [
                  Text(
                    'Alacağınız Bonuslar',
                    style: TextStyle(
                      color: ColorExtension.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 14),
                  Row(
                    children: [
                      IconTextBoxWidget(title: 'Premium\n Hesap', icon: ImagePathEnum.PREMIUM),
                      IconTextBoxWidget(title: 'Daha Fazla Eşleşme', icon: ImagePathEnum.HEARTS),
                      IconTextBoxWidget(title: 'Öne\n Çıkarma', icon: ImagePathEnum.UP_ARROW),
                      IconTextBoxWidget(title: 'Daha Fazla Beğeni', icon: ImagePathEnum.HEART),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 21),
            Text(
              'Kilidi açmak için bir jeton paketi seçin',
              style: TextStyle(
                color: ColorExtension.white,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 25),
            Row(
              children: [
                StackBoxComponent(
                  percentage: '+10%',
                  discountedAmount: '200',
                  amountCoin: '330',
                  amountPrice: '₺99,99',
                  bgGradient: [
                    Color.fromARGB(240, 71, 3, 17),
                    Color.fromARGB(247, 174, 0, 0),
                    Color.fromARGB(242, 174, 0, 0),
                  ],
                  gradient: [
                    Color.fromARGB(229, 53, 3, 11),
                    Color.fromARGB(240, 71, 3, 17),
                  ],
                ),
                const SizedBox(width: 16),
                StackBoxComponent(
                  percentage: '+70%',
                  discountedAmount: '2000',
                  amountCoin: '3.375',
                  amountPrice: '₺799,99',
                  bgGradient: [
                    Color.fromARGB(255, 137, 94, 255),
                    Color.fromARGB(255, 76, 0, 255),
                    Color.fromARGB(234, 174, 0, 0),
                  ],
                  gradient: [
                    Color.fromARGB(255, 76, 0, 255),
                    Color.fromARGB(255, 76, 0, 255),
                  ],
                ),
                const SizedBox(width: 16),
                StackBoxComponent(
                  percentage: '+35%',
                  discountedAmount: '1000',
                  amountCoin: '1.350',
                  amountPrice: '₺399,99',
                  bgGradient: [
                    Color.fromARGB(240, 71, 3, 17),
                    Color.fromARGB(247, 174, 0, 0),
                    Color.fromARGB(242, 174, 0, 0),
                  ],
                  gradient: [
                    Color.fromARGB(229, 53, 3, 11),
                    Color.fromARGB(240, 71, 3, 17),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 18),
            ButtonWidget(onTap: () {}, title: 'Tüm Jetonları Gör'),
          ],
        ),
      ),
    );
  }
}
