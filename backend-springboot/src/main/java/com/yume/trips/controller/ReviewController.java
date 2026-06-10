package com.yume.trips.controller;

import com.yume.trips.entity.Review;
import com.yume.trips.service.ReviewService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.util.List;

@RestController
@RequestMapping("/api/reviews")
public class ReviewController {

    private final ReviewService reviewService;

    public ReviewController(ReviewService reviewService) {
        this.reviewService = reviewService;
    }

    @PostMapping
    public ResponseEntity<?> addReview(
            @RequestParam Long itemId,
            @RequestParam String itemType,
            @RequestParam Integer rating,
            @RequestBody String comment,
            Principal principal) {
        try {
            Review review = reviewService.addReview(itemId, itemType, rating, comment, principal.getName());
            return new ResponseEntity<>(review, HttpStatus.CREATED);
        } catch (Exception e) {
            return new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }
    }

    @GetMapping("/destination/{id}")
    public ResponseEntity<List<Review>> getReviewsByItem(@PathVariable Long id) {
        return ResponseEntity.ok(reviewService.getReviewsByItem(id));
    }

    @PatchMapping("/{id}/helpful")
    public ResponseEntity<?> markHelpful(@PathVariable Long id) {
        try {
            Review review = reviewService.markHelpful(id);
            return ResponseEntity.ok(review);
        } catch (Exception e) {
            return new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }
    }
}
