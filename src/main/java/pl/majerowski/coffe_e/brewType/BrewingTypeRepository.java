package pl.majerowski.coffe_e.brewType;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BrewingTypeRepository extends JpaRepository<BrewType, Long> {
}
