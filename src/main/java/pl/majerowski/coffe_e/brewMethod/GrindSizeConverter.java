package pl.majerowski.coffe_e.brewMethod;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

@Component
public class GrindSizeConverter implements Converter<String, GrindSize> {
    private final GrindSizeRepository grindSizeRepository;

    @Autowired
    public GrindSizeConverter(GrindSizeRepository grindSizeRepository) {
        this.grindSizeRepository = grindSizeRepository;
    }

    @Override
    public GrindSize convert(String source) {
        return grindSizeRepository.findById(Long.parseLong(source)).orElse(null);
    }
}
