package pl.majerowski.coffe_e.brewMethod;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;


@Component
public class BrewingMethodConverter implements Converter<String, BrewMethod> {
    private final JpaBrewMethodService jpaBrewMethodService;

    @Autowired
    public BrewingMethodConverter(JpaBrewMethodService jpaBrewMethodService) {
        this.jpaBrewMethodService = jpaBrewMethodService;
    }

    @Override
    public BrewMethod convert(String source) {
        return jpaBrewMethodService.getMethod(Long.parseLong(source));
    }
}