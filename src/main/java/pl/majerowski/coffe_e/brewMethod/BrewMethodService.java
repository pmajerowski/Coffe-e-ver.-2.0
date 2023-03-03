package pl.majerowski.coffe_e.brewMethod;

import java.util.List;

public interface BrewMethodService {
    List<BrewMethod> getAllMethods();
    BrewMethod getMethod(Long methodId);
    void addMethod(BrewMethod methodId);
    void deleteMethod(Long methodId);
}
