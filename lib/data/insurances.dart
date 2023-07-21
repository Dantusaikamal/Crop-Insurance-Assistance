class InsuranceProvider {
  final String name;
  final String description;
  final String imageUrl;

  InsuranceProvider({
    required this.name,
    required this.description,
    required this.imageUrl,
  });
}

List<InsuranceProvider> insuranceProviders = [
  InsuranceProvider(
    name: 'Provider 1',
    description: 'Description of Provider 1',
    imageUrl: 'assets/images/provider1.png',
  ),
  InsuranceProvider(
    name: 'Provider 2',
    description: 'Description of Provider 2',
    imageUrl: 'assets/images/provider2.png',
  ),
  // Add more insurance providers as needed
];
