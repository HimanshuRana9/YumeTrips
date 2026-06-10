package com.yume.trips.dto;

import jakarta.validation.constraints.NotNull;
import lombok.*;
import java.time.LocalDate;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class BookingRequest {

    @NotNull(message = "Booking type is required")
    private String bookingType; // HOTEL or PACKAGE

    @NotNull(message = "Reference ID is required")
    private Long referenceId; // Hotel ID or Package ID

    @NotNull(message = "Start date is required")
    private LocalDate startDate;

    private LocalDate endDate; // Optional for packages, required for hotels

    @NotNull(message = "Total price is required")
    private Double totalPrice;
}
