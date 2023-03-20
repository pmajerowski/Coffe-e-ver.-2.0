package pl.majerowski.coffe_e.brewMethod;

import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Primary
public class JpaBrewMethodService implements BrewMethodService {
    private final BrewMethodRepository brewMethodRepository;

    public JpaBrewMethodService(BrewMethodRepository brewMethodRepository) {
        this.brewMethodRepository = brewMethodRepository;
    }

    @Override
    public List<BrewMethod> getAllMethods() {
        return brewMethodRepository.findAll();
    }

    @Override
    public BrewMethod getMethod(Long methodId) {
        return brewMethodRepository.findById(methodId).orElse(null);
    }

    @Override
    public void addMethod(BrewMethod brewMethod) {
        brewMethodRepository.save(brewMethod);
    }

    @Override
    public void deleteMethod(Long methodId) {
        brewMethodRepository.deleteById(methodId);
    }

    public List<BrewMethod> getAllMethodsSortByName() {
        return brewMethodRepository.findBrewMethodsByOrderByName();
    }

    public List<BrewMethod> getAllMethodsSortByBrewType() {
        return brewMethodRepository.findBrewMethodsByOrderByBrewType();
    }

    public List<BrewMethod> getAllMethodsSortByBrewTime() {
        return brewMethodRepository.findBrewMethodsByOrderByBrewTime();
    }

    public List<BrewMethod> getAllMethodsSortByRatio() {
        return brewMethodRepository.findBrewMethodsByOrderByRatio();
    }

    public List<BrewMethod> getAllMethodsSortByGrindSize() {
        return brewMethodRepository.findBrewMethodsByOrderByGrindSize();
    }

    public List<BrewMethod> getAllMethodsSortByWaterTemperature() {
        return brewMethodRepository.findBrewMethodsByOrderByWaterTemperature();
    }
}
