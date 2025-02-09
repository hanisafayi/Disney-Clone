import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutterproject/data.dart';
import 'package:flutterproject/models/car.dart';
import 'package:meta/meta.dart';

import '../../../data/data_providers/users_data_provider.dart';
import '../../../data/repositories/reviews_repository.dart';
import '../../../data/repositories/users_repository.dart';
import '../../../models/car.dart';
import '../../../models/review.dart';

part 'review_event.dart';
part 'review_state.dart';

class ReviewBloc extends Bloc<ReviewEvent, ReviewState> {
  final ReviewsRepository _reviewsRepository;

  ReviewBloc(this._reviewsRepository) : super(ReviewInitial()) {
    on<LoadCarReviews>(_onLoadCarReviews);
    on<AddCarRatingReview>(_onAddCarRatingReview);
    on<UpdateCarRating>(_onUpdateCarRating);
    on<AddCarCommentReview>(_onAddCarCommentReview);
    on<UpdateCarCommentReview>(_onUpdateCarCommentReview);
    on<DeleteCarCommentReview>(_onDeleteCarCommentReview);
  }

  void _onLoadCarReviews(
      LoadCarReviews event, Emitter<ReviewState> emit) async {
    emit(ReviewLoading());
    try {
      final reviews =
          await _reviewsRepository.getReviewsByCarId(event.car.id as int);
      if (reviews.isEmpty) {
        emit(ReviewEmpty(event.car));
        return;
      }

      final returnedValues = []; // userLastRating, averageRating, numReviews

      final sortedReviews = reviews.reversed.toList();
      for (var review in sortedReviews) {
        if (review.userId == event.userId && review.rating != 0) {
          final userLastRating = review.rating;
          returnedValues.add(userLastRating);
          break;
        }
      }
      if (returnedValues.isEmpty) {
        const userLastRating = 0;
        returnedValues.add(userLastRating);
      }
      num sum = 0;
      for (var review in sortedReviews) {
        sum += review.rating;
      }
      final int ratedCarReviews =
          reviews.where((review) => review.rating != 0).length;
      final averageRating = sum / (ratedCarReviews == 0 ? 1 : ratedCarReviews);

      final commentContainingReviews =
          reviews.where((review) => review.comment != "").toList();
      final int numComments = commentContainingReviews.length;

      returnedValues.add(averageRating);
      returnedValues.add(numComments);

      if (returnedValues.length != 3) {
        throw Exception();
      }

      final userIdToUsernameMap = <int, String>{};
      final UsersDataProvider usersDataProvider = UsersDataProvider();
      final UsersRepository usersRepository =
          UsersRepository(usersDataProvider);
      final users = await usersRepository.getUsers();
      for (var user in users) {
        userIdToUsernameMap[user.id!] = user.username;
      }

      emit(ReviewsLoaded(
        reviews: sortedReviews.where((review) => review.comment != "").toList(),
        userIdToUsernameMap: userIdToUsernameMap,
        userLastRating: returnedValues[0],
        averageRating: returnedValues[1],
        numComments: returnedValues[2],
      ));
    } catch (e) {
      emit(ReviewError("Failed to load reviews"));
    }
  }

  void _onAddCarRatingReview(
      AddCarRatingReview event, Emitter<ReviewState> emit) async {
    emit(ReviewLoading());
    try {
      final addedReview = await _reviewsRepository.addReview(Review(
        userId: event.review.userId,
        carId: event.review.carId,
        rating: event.review.rating,
        comment: "",
      ));
      emit(ReviewRatingAddSuccess(addedReview));
    } catch (e) {
      emit(ReviewError("Failed to add rating"));
    }
  }

  void _onUpdateCarRating(
      UpdateCarRating event, Emitter<ReviewState> emit) async {
    emit(ReviewLoading());
    try {
      final allReviews =
          await _reviewsRepository.getReviewsByCarId(event.review.carId);
      final Review reviewToBeUpdated = allReviews.firstWhere((review) =>
          review.userId == event.review.userId && review.comment == "");
      await _reviewsRepository.updateReview(
          reviewToBeUpdated.id!,
          Review(
            userId: event.review.userId,
            carId: event.review.carId,
            rating: event.review.rating,
            comment: reviewToBeUpdated.comment,
          ));
      emit(ReviewRatingUpdateSuccess("${event.review.rating}"));
    } catch (e) {
      emit(ReviewError("Failed to update rating"));
    }
  }

  void _onAddCarCommentReview(
      AddCarCommentReview event, Emitter<ReviewState> emit) async {
    emit(ReviewLoading());
    try {
      await _reviewsRepository.addReview(Review(
        userId: event.review.userId,
        carId: event.review.carId,
        rating: event.review.rating,
        comment: event.review.comment,
      ));
      emit(ReviewCommentAddSuccess("Comment added successfully."));
    } catch (e) {
      emit(ReviewError("Failed to add comment"));
    }
  }

  void _onUpdateCarCommentReview(
      UpdateCarCommentReview event, Emitter<ReviewState> emit) async {
    emit(ReviewLoading());
    try {
      final allReviews =
          await _reviewsRepository.getReviewsByCarId(event.review.carId);
      final Review reviewToBeUpdated = allReviews.firstWhere((review) =>
          review.userId == event.review.userId &&
          review.comment == event.review.comment);
      await _reviewsRepository.updateReview(
          reviewToBeUpdated.id!,
          Review(
            userId: event.review.userId,
            carId: event.review.carId,
            rating: event.review.rating,
            comment: event.newComment,
          ));
      emit(ReviewCommentUpdateSuccess("Comment updated successfully."));
    } catch (e) {
      emit(ReviewError("Failed to update comment"));
    }
  }

  void _onDeleteCarCommentReview(
      DeleteCarCommentReview event, Emitter<ReviewState> emit) async {
    emit(ReviewLoading());
    try {
      final allReviews =
          await _reviewsRepository.getReviewsByCarId(event.review.carId);
      final Review reviewToBeDeleted = allReviews.firstWhere(
        (review) =>
            review.userId == event.review.userId &&
            review.comment == event.review.comment,
      );
      await _reviewsRepository.deleteReview(reviewToBeDeleted.id!);
      emit(ReviewCommentDeleteSuccess("Comment deleted successfully."));
    } catch (e) {
      emit(ReviewError("Failed to delete comment"));
    }
  }
}
