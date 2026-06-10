package com.yume.trips.repository;

import com.yume.trips.entity.Review;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface ReviewRepository extends JpaRepository<Review, Long> {
    List<Review> findByDestinationId(Long destinationId);
    List<Review> findByPkgId(Long packageId);
    List<Review> findByHotelId(Long hotelId);

    @Query("SELECT r FROM Review r WHERE r.destination.id = :id OR r.pkg.id = :id OR r.hotel.id = :id")
    List<Review> findByItemId(@Param("id") Long id);
}
