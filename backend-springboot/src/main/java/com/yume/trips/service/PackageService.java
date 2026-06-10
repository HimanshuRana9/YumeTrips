package com.yume.trips.service;

import com.yume.trips.entity.Package;
import com.yume.trips.repository.PackageRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.util.List;

@Service
public class PackageService {

    private final PackageRepository packageRepository;

    public PackageService(PackageRepository packageRepository) {
        this.packageRepository = packageRepository;
    }

    public List<Package> getAllPackages(String destination) {
        if (StringUtils.hasText(destination)) {
            return packageRepository.findByDestination_NameContainingIgnoreCase(destination);
        }
        return packageRepository.findAll();
    }

    public List<Package> getFeaturedPackages() {
        return packageRepository.findByIsFeaturedTrue();
    }

    public Package getPackageById(Long id) {
        return packageRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Package not found with id: " + id));
    }

    @Transactional
    public Package createPackage(Package tourPackage) {
        return packageRepository.save(tourPackage);
    }
}
