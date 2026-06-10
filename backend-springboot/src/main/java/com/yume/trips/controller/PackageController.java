package com.yume.trips.controller;

import com.yume.trips.entity.Package;
import com.yume.trips.service.PackageService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/api/packages")
public class PackageController {

    private final PackageService packageService;

    public PackageController(PackageService packageService) {
        this.packageService = packageService;
    }

    @GetMapping
    public ResponseEntity<List<Package>> getAllPackages(@RequestParam(required = false) String destination) {
        return ResponseEntity.ok(packageService.getAllPackages(destination));
    }

    @GetMapping("/featured")
    public ResponseEntity<List<Package>> getFeaturedPackages() {
        return ResponseEntity.ok(packageService.getFeaturedPackages());
    }

    @GetMapping("/{id}")
    public ResponseEntity<Package> getPackageById(@PathVariable Long id) {
        return ResponseEntity.ok(packageService.getPackageById(id));
    }

    @PostMapping
    public ResponseEntity<Package> createPackage(@RequestBody Package tourPackage) {
        return new ResponseEntity<>(packageService.createPackage(tourPackage), HttpStatus.CREATED);
    }
}
