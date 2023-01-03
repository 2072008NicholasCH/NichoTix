part of 'ticket_bloc.dart';

@freezed
class TicketEvent with _$TicketEvent {
  const factory TicketEvent.started(
      DateTime waktu, String tempat, List<String> kursi) = _Started;
}
