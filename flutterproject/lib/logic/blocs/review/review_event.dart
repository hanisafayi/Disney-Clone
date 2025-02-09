part of 'review_bloc.dart';

@immutable
sealed class ReviewEvent extends Equatable {
  const ReviewEvent();

  @override
  List<Object> get props => [];
}

final class LoadCarReviews extends ReviewEvent {
  final Car car;
  final int userId;

  LoadCarReviews(this.car, this.userId);
}

final class AddCarRatingReview extends ReviewEvent {
  final Review review;

  AddCarRatingReview(this.review);
}

final class UpdateCarRating extends ReviewEvent {
  final Review review;

  UpdateCarRating(this.review);
}

final class AddCarCommentReview extends ReviewEvent {
  final Review review;

  AddCarCommentReview(this.review);
}

final class UpdateCarCommentReview extends ReviewEvent {
  final Review review;
  final String newComment;

  UpdateCarCommentReview(this.review, this.newComment);
}

final class DeleteCarCommentReview extends ReviewEvent {
  final Review review;

  DeleteCarCommentReview(this.review);
}
