package pl.majerowski.coffe_e.coffee;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

@Component
public class CoffeeConverter implements Converter<String, Coffee> {
    private final JpaCoffeeService jpaCoffeeService;

    @Autowired
    public CoffeeConverter(JpaCoffeeService jpaBrewingTypeService) {
        this.jpaCoffeeService = jpaBrewingTypeService;
    }

    @Override
    public Coffee convert(String source) {
        return jpaCoffeeService.getCoffee(Long.parseLong(source));
    }
}