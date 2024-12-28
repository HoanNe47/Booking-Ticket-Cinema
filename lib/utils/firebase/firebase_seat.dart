import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_ticket/model/seat_model.dart';
import 'package:movie_ticket/utils/checker/network_checker.dart';
import 'package:movie_ticket/utils/common_value/collection_name.dart';
import 'package:movie_ticket/utils/common_value/common_message.dart';
import 'package:movie_ticket/utils/common_value/common_status.dart';
import 'package:movie_ticket/utils/firebase/firebase_instance.dart';
import 'package:uuid/uuid.dart';

Future<String> handleCommonErrorFirebase(
    {required void Function() handleFunc}) async {
  String errorNetwork = await CheckersUtils.checkNetworkError();
  if (errorNetwork.isEmpty) {
    try {
      handleFunc();
    } on FirebaseAuthException catch (e) {
      return e.message ?? CommonMessage.commonError;
    } catch (_) {
      return CommonMessage.commonError;
    }
    return '';
  } else {
    return errorNetwork;
  }
}

class SeatService {
//   SeatService() {
//   addSeat(SeatModel("DrtqOa0OAmYKb5ZsdlQw", "9cec0dc0-c22c-11ef-bae4-319a31c0c11a", 6, 6, [
//     SeatDetailModel("1", "1", CommonStatus.available),
//     SeatDetailModel("1", "2", CommonStatus.available),
//     SeatDetailModel("1", "3", CommonStatus.available),
//     SeatDetailModel("1", "4", CommonStatus.available),
//     SeatDetailModel("1", "5", CommonStatus.available),
//     SeatDetailModel("1", "6", CommonStatus.available),
//     SeatDetailModel("2", "1", CommonStatus.available),
//     SeatDetailModel("2", "2", CommonStatus.available),
//     SeatDetailModel("2", "3", CommonStatus.available),
//     SeatDetailModel("2", "4", CommonStatus.available),
//     SeatDetailModel("2", "5", CommonStatus.available),
//     SeatDetailModel("2", "6", CommonStatus.available),
//     SeatDetailModel("3", "1", CommonStatus.available),
//     SeatDetailModel("3", "2", CommonStatus.available),
//     SeatDetailModel("3", "3", CommonStatus.available),
//     SeatDetailModel("3", "4", CommonStatus.available),
//     SeatDetailModel("3", "5", CommonStatus.available),
//     SeatDetailModel("3", "6", CommonStatus.available),
//     SeatDetailModel("4", "1", CommonStatus.available),
//     SeatDetailModel("4", "2", CommonStatus.available),
//     SeatDetailModel("4", "3", CommonStatus.available),
//     SeatDetailModel("4", "4", CommonStatus.available),
//     SeatDetailModel("4", "5", CommonStatus.available),
//     SeatDetailModel("4", "6", CommonStatus.available),
//     SeatDetailModel("5", "1", CommonStatus.available),
//     SeatDetailModel("5", "2", CommonStatus.available),
//     SeatDetailModel("5", "3", CommonStatus.available),
//     SeatDetailModel("5", "4", CommonStatus.available),
//     SeatDetailModel("5", "5", CommonStatus.available),
//     SeatDetailModel("5", "6", CommonStatus.available),
//     SeatDetailModel("6", "1", CommonStatus.available),
//     SeatDetailModel("6", "2", CommonStatus.available),
//     SeatDetailModel("6", "3", CommonStatus.available),
//     SeatDetailModel("6", "4", CommonStatus.available),
//     SeatDetailModel("6", "5", CommonStatus.available),
//     SeatDetailModel("6", "6", CommonStatus.available),
//   ]));
// }
  //# Add seat
  Future<String> addSeat(SeatModel seat) async {
    return await handleCommonErrorFirebase(handleFunc: () async {
      await fireStoreInstance
          .collection(CollectionName.seats)
          .doc(const Uuid().v1())
          .set(seat.toMap());
    });
  }

  //# Update seat
  Future<String> updateSeat(SeatModel seat) async {
    return await handleCommonErrorFirebase(handleFunc: () async {
      await fireStoreInstance
          .collection(CollectionName.seats)
          .doc(seat.id)
          .update(seat.toMap());
    });
  }

  //# Get by id
  Future<SeatModel?> getSeatById(String id) async {
    SeatModel? seat;
    await handleCommonErrorFirebase(handleFunc: () async {
      DocumentSnapshot snapshot = await fireStoreInstance
          .collection(CollectionName.seats)
          .doc(id)
          .get();
      if (snapshot.exists) {
        seat = SeatModel.fromDocument(snapshot);
      }
    });

    return seat;
  }

  // Get seats by movieId
  Future<SeatModel?> getSeatsByMovieId(String movieId) async {
    final QuerySnapshot querySnapshot = await fireStoreInstance
        .collection(CollectionName.seats)
        .where('movieId', isEqualTo: movieId)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      return SeatModel.fromDocument(querySnapshot.docs.first);
    }
    return null;
  }

  // Delete seat by id
  Future<String> deleteSeat(String id) async {
    return await handleCommonErrorFirebase(handleFunc: () async {
      await fireStoreInstance.collection(CollectionName.seats).doc(id).delete();
    });
  }

  //# Update status "booked"
  Future<String> updateSeatsStatus(
      String movieId, List<String> seatNumbers) async {
    return await handleCommonErrorFirebase(handleFunc: () async {
      final QuerySnapshot querySnapshot = await fireStoreInstance
          .collection(CollectionName.seats)
          .where('movieId', isEqualTo: movieId)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        final DocumentSnapshot seatDoc = querySnapshot.docs.first;
        final List<dynamic> seatDetails = seatDoc['seatDetails'];

        List<Map<String, dynamic>> updatedSeats = seatDetails.map((seat) {
          if (seatNumbers.contains('${seat['row']}${seat['column']}')) {
            seat['status'] = CommonStatus.booked;
          }
          return seat as Map<String, dynamic>;
        }).toList();

        await fireStoreInstance
            .collection(CollectionName.seats)
            .doc(seatDoc.id)
            .update({'seatDetails': updatedSeats});
      }
    });
  }
}