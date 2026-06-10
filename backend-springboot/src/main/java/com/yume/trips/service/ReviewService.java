package com.yume.trips.service;

import com.yume.trips.entity.Review;
import com.yume.trips.entity.User;
import com.yume.trips.repository.*;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class ReviewService {

    private final ReviewRepository reviewRepository;
    private final UserRepository userRepository;
    private final DestinationRepository destinationRepository;
    private final PackageRepository packageRepository;
    private final HotelRepository hotelRepository;

    public ReviewService(ReviewRepository reviewRepository, UserRepository userRepository,
                         DestinationRepository destinationRepository, PackageRepository packageRepository,
                         HotelRepository hotelRepository) {
        this.reviewRepository = reviewRepository;
        this.userRepository = userRepository;
        this.destinationRepository = destinationRepository;
        this.packageRepository = packageRepository;
        this.hotelRepository = hotelRepository;
    }

    @Transactional
    public Review addReview(Long itemId, String itemType, Integer rating, String comment, String email) {
        User user = userRepository.findByEmail(email)
                .orElseThrow(() -> new RuntimeException("User not found with email: " + email));

        Review.ReviewBuilder builder = Review.builder()
                .user(user)
                .rating(rating)
                .comment(comment)
                .helpful(0);

        if ("destination".equalsIgnoreCase(itemType)) {
            builder.destination(destinationRepository.findById(itemId)
                    .orElseThrow(() -> new RuntimeException("Destination not found")));
        } else if ("package".equalsIgnoreCase(itemType)) {
            builder.pkg(packageRepository.findById(itemId)
                    .orElseThrow(() -> new RuntimeException("Package not found")));
        } else if ("hotel".equalsIgnoreCase(itemType)) {
            builder.hotel(hotelRepository.findById(itemId)
                    .orElseThrow(() -> new RuntimeException("Hotel not found")));
        }

        return reviewRepository.save(builder.build());
    }

    public List<Review> getReviewsByItem(Long itemId) {
        return reviewRepository.findByItemId(itemId);
    }

    @Transactional
    public Review markHelpful(Long id) {
        Review review = reviewRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Review not found with id: " + id));
        review.setHelpful(review.getHelpful() + 1);
        return reviewRepository.save(review);
    }
}
