import 'package:geolocator/geolocator.dart';

class LocationService {
  /// Solicita e verifica a permissão de localização.
  Future<bool> solicitarPermissaoLocalizacao() async {
    // Verifica se o serviço de localização do aparelho está ativado.
    final servicoAtivado = await Geolocator.isLocationServiceEnabled();

    if (!servicoAtivado) {
      await Geolocator.openLocationSettings();
      return false;
    }

    LocationPermission permissao = await Geolocator.checkPermission();

    // Se ainda não foi concedida, solicita ao usuário.
    if (permissao == LocationPermission.denied) {
      permissao = await Geolocator.requestPermission();
    }

    // Usuário recusou a permissão.
    if (permissao == LocationPermission.denied) {
      return false;
    }

    // Usuário recusou permanentemente.
    if (permissao == LocationPermission.deniedForever) {
      await Geolocator.openAppSettings();
      return false;
    }

    return true;
  }

  /// Obtém a localização atual do aparelho.
  Future<Position?> obterLocalizacaoAtual() async {
    final permissaoConcedida =
        await solicitarPermissaoLocalizacao();

    if (!permissaoConcedida) {
      return null;
    }

    return Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
      ),
    );
  }
}