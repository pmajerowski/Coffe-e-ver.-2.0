package pl.majerowski.coffe_e.coffee;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import pl.majerowski.coffe_e.brewMethod.BrewMethod;
import pl.majerowski.coffe_e.brewType.BrewType;
import pl.majerowski.coffe_e.brewType.JpaBrewingTypeService;

import java.util.Set;

@RestController
public class CoffeeJsonController {
    private final JpaCoffeeService jpaCoffeeService;

    private final JpaBrewingTypeService jpaBrewingTypeService;

    public CoffeeJsonController(JpaCoffeeService jpaCoffeeService,
                                JpaBrewingTypeService jpaBrewTypeService) {
        this.jpaCoffeeService = jpaCoffeeService;
        this.jpaBrewingTypeService = jpaBrewTypeService;
    }

    @GetMapping("/get/brewTypes/coffee/{coffeeId}")
    public Set<BrewType> getTypes(@PathVariable Long coffeeId) {
        Coffee coffee = jpaCoffeeService.getCoffee(coffeeId);
        return coffee.getBrewTypes();
    }


    @GetMapping("/get/brewMethods/brewType/{brewTypeId}")
    public Set<BrewMethod> getMethods(@PathVariable Long brewTypeId) {
        BrewType brewType = jpaBrewingTypeService.getBrewType(brewTypeId);
        return brewType.getBrewMethods();
    }

}
