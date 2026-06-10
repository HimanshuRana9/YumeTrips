package com.yume.trips.repository;

import com.yume.trips.entity.Hotel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface HotelRepository extends JpaRepository<Hotel, Long> {
    List<Hotel> findByLocationContainingIgnoreCase(String location);
    
    @Query("SELECT h FROM Hotel h WHERE LOWER(h.name) LIKE LOWER(CONCAT('%', :search, '%')) OR LOWER(h.location) LIKE LOWER(CONCAT('%', :search, '%'))")
    List<Hotel> searchByNameOrLocation(@Param("search") String search);
}
