package pl.majerowski.coffe_e.brewType;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class JpaBrewingTypeService implements BrewingTypeService {
    private final BrewingTypeRepository brewingTypeRepository;

    public JpaBrewingTypeService(BrewingTypeRepository brewingTypeRepository) {
        this.brewingTypeRepository = brewingTypeRepository;
    }

    @Override
    public List<BrewType> getAllBrewTypes() {
        return brewingTypeRepository.findAll();
    }

    @Override
    public BrewType getBrewType(Long brewTypeId) {
        return brewingTypeRepository.findById(brewTypeId).orElse(null);
    }

    @Override
    public void addBrewType(BrewType brewType) {
        brewingTypeRepository.save(brewType);
    }
}
