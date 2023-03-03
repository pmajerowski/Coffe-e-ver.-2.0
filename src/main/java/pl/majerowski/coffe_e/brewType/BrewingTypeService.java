package pl.majerowski.coffe_e.brewType;
import java.util.List;

public interface BrewingTypeService {
    List<BrewType> getAllBrewTypes();
    BrewType getBrewType(Long brewTypeId);
    void addBrewType(BrewType brewType);
}
