package com.yume.trips.entity;

import jakarta.persistence.*;
import lombok.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "destinations")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Destination {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, unique = true, length = 100)
    private String name;

    @Column(length = 255)
    private String image;

    @Column(columnDefinition = "TEXT")
    private String description;

    @Column(length = 150)
    private String location;

    @Column(length = 100)
    private String country;

    @Column(length = 50)
    private String category;

    @Column
    private Double price;

    @Column
    private Double rating;

    @Column(name = "total_reviews")
    private Integer totalReviews;

    @Column(name = "is_featured")
    private Boolean isFeatured;

    @Column(name = "popular_tags", length = 255)
    private String popularTags; // Comma-separated tags

    @Column(name = "created_at", updatable = false)
    private LocalDateTime createdAt;

    @Column(name = "updated_at")
    private LocalDateTime updatedAt;

    @PrePersist
    protected void onCreate() {
        createdAt = LocalDateTime.now();
        updatedAt = LocalDateTime.now();
        if (rating == null) rating = 4.0;
        if (totalReviews == null) totalReviews = 0;
        if (isFeatured == null) isFeatured = false;
        if (price == null) price = 0.0;
    }

    @PreUpdate
    protected void onUpdate() {
        updatedAt = LocalDateTime.now();
    }
}
