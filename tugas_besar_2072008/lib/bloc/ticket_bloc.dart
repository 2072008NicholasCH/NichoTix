import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ticket_event.dart';
part 'ticket_state.dart';
part 'ticket_bloc.freezed.dart';

class TicketBloc extends Bloc<TicketEvent, TicketState> {
  TicketBloc() : super(const _Initial()) {
    on<TicketEvent>(
      (event, emit) {
        emit(
          state.when(
            initial: () => TicketState.running(DateTime.now(), " ", []),
            running: (waktu, tempat, kursi) {
              return event.when(
                started: ((waktu, tempat, kursi) =>
                    TicketState.running(waktu, tempat, kursi)),
              );
            },
          ),
        );
      },
    );
  }
}
