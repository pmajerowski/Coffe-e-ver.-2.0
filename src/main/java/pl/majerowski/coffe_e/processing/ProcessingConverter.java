package pl.majerowski.coffe_e.processing;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;


@Component
public class ProcessingConverter implements Converter<String, Processing> {
    private final JpaProcessingService jpaProcessingService;

    @Autowired
    public ProcessingConverter(JpaProcessingService jpaProcessingService) {
        this.jpaProcessingService = jpaProcessingService;
    }

    @Override
    public Processing convert(String source) {
        return jpaProcessingService.getProcessing(Long.parseLong(source));
    }
}
