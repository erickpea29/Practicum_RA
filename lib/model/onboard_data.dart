class OnBoarding {
  final String title;
  final String subtitle;
  final String image;

  OnBoarding({
    required this.title,
    required this.subtitle,
    required this.image,
  });
}

List<OnBoarding> onboardingContents = [
  OnBoarding(
    title: 'Bienvenido a tu\n Guía Interactiva \nVirtual',
    subtitle: 'Desliza Para Continuar  → ',
    image: 'assets/images/Test1.png',
  ),
  OnBoarding(
    title: 'Adéntrate en una experiencia de Realidad Aumentada',
    subtitle: 'Solo apunta tu dispositivo \n y da inicio a esta experiencia',
    image: 'assets/images/Test2.png',
  ),
  OnBoarding(
    title: 'Experimenta una nueva \n forma de aprendizaje',
    subtitle: 'Y descubre la importancia\n de estudiar Derecho Romano',
    image: 'assets/images/Test3_1.png',
  ),
  OnBoarding(
    title: '¿Estas listo?',
    subtitle: '¡Comencemos!',
    image: 'assets/images/Test4_1.png',
  ),
];
