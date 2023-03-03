package pl.majerowski.coffe_e.brewType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

@Component
public class BrewingTypeConverter implements Converter<String, BrewType> {
    private final JpaBrewingTypeService jpaBrewingTypeService;

    @Autowired
    public BrewingTypeConverter(JpaBrewingTypeService jpaBrewingTypeService) {
        this.jpaBrewingTypeService = jpaBrewingTypeService;
    }

    @Override
    public BrewType convert(String source) {
        return jpaBrewingTypeService.getBrewType(Long.parseLong(source));
    }
}