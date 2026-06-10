package com.yume.trips.service;

import com.yume.trips.dto.BookingRequest;
import com.yume.trips.entity.Booking;
import com.yume.trips.entity.BookingStatus;
import com.yume.trips.entity.BookingType;
import com.yume.trips.entity.User;
import com.yume.trips.repository.BookingRepository;
import com.yume.trips.repository.UserRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class BookingService {

    private final BookingRepository bookingRepository;
    private final UserRepository userRepository;

    public BookingService(BookingRepository bookingRepository, UserRepository userRepository) {
        this.bookingRepository = bookingRepository;
        this.userRepository = userRepository;
    }

    @Transactional
    public Booking createBooking(BookingRequest request, String email) {
        User user = userRepository.findByEmail(email)
                .orElseThrow(() -> new RuntimeException("User not found with email: " + email));

        BookingType type;
        try {
            type = BookingType.valueOf(request.getBookingType().toUpperCase());
        } catch (IllegalArgumentException e) {
            throw new RuntimeException("Invalid booking type: " + request.getBookingType());
        }

        Booking booking = Booking.builder()
                .user(user)
                .bookingType(type)
                .referenceId(request.getReferenceId())
                .startDate(request.getStartDate())
                .endDate(request.getEndDate())
                .totalPrice(request.getTotalPrice())
                .status(BookingStatus.PENDING)
                .build();

        return bookingRepository.save(booking);
    }

    public List<Booking> getBookingsByEmail(String email) {
        return bookingRepository.findByUserEmail(email);
    }

    public List<Booking> getAllBookings() {
        return bookingRepository.findAll();
    }

    @Transactional
    public Booking updateBookingStatus(Long id, BookingStatus status) {
        Booking booking = bookingRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Booking not found with id: " + id));
        booking.setStatus(status);
        return bookingRepository.save(booking);
    }
}
