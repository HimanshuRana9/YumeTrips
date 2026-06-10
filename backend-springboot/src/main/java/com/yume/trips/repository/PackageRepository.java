package com.yume.trips.repository;

import com.yume.trips.entity.Package;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface PackageRepository extends JpaRepository<Package, Long> {
    List<Package> findByIsFeaturedTrue();
    List<Package> findByDestination_NameContainingIgnoreCase(String destinationName);
}
