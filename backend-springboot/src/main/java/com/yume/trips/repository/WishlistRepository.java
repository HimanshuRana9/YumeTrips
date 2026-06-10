package com.yume.trips.repository;

import com.yume.trips.entity.Wishlist;
import com.yume.trips.entity.WishlistItemType;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;
import java.util.Optional;

@Repository
public interface WishlistRepository extends JpaRepository<Wishlist, Long> {
    List<Wishlist> findByUserId(Long userId);
    boolean existsByUserIdAndItemTypeAndItemId(Long userId, WishlistItemType itemType, Long itemId);
    Optional<Wishlist> findByUserIdAndItemTypeAndItemId(Long userId, WishlistItemType itemType, Long itemId);
}
