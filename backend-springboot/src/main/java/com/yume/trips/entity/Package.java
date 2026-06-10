package com.yume.trips.entity;

import jakarta.persistence.*;
import lombok.*;
import java.time.LocalDateTime;
import java.util.List;

@Entity
@Table(name = "packages")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Package {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, length = 150)
    private String title;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "destination_id")
    private Destination destination;

    private Integer days;

    @Column(nullable = false)
    private Double price;

    @Column(columnDefinition = "TEXT")
    private String details;

    @Column(length = 255)
    private String image;

    @Column(name = "is_featured")
    private Boolean isFeatured;

    @Column
    private Double rating;

    @ElementCollection(fetch = FetchType.EAGER)
    @CollectionTable(name = "package_inclusions", joinColumns = @JoinColumn(name = "package_id"))
    @Column(name = "inclusion")
    private List<String> inclusions;

    @ElementCollection(fetch = FetchType.EAGER)
    @CollectionTable(name = "package_exclusions", joinColumns = @JoinColumn(name = "package_id"))
    @Column(name = "exclusion")
    private List<String> exclusions;

    @Column(name = "created_at", updatable = false)
    private LocalDateTime createdAt;

    @Column(name = "updated_at")
    private LocalDateTime updatedAt;

    @PrePersist
    protected void onCreate() {
        createdAt = LocalDateTime.now();
        updatedAt = LocalDateTime.now();
        if (days == null) days = 1;
        if (isFeatured == null) isFeatured = false;
        if (rating == null) rating = 4.0;
    }

    @PreUpdate
    protected void onUpdate() {
        updatedAt = LocalDateTime.now();
    }
}
