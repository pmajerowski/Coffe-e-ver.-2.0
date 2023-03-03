package pl.majerowski.coffe_e.processing;

import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class JpaProcessingService implements ProcessingService {
    private final ProcessingRepository processingRepository;

    public JpaProcessingService(ProcessingRepository processingRepository) {
        this.processingRepository = processingRepository;
    }

    @Override
    public List<Processing> getAllProcessingTypes() {
        return processingRepository.findAll();
    }

    @Override
    public Processing getProcessing(Long processingId) {
        return processingRepository.findById(processingId).orElse(null);
    }

    @Override
    public void addProcessing(Processing processing) {
        processingRepository.save(processing);
    }
}
