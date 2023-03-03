package pl.majerowski.coffe_e.processing;


import java.util.List;

public interface ProcessingService {
    List<Processing> getAllProcessingTypes();
    Processing getProcessing(Long processingId);
    void addProcessing(Processing processing);
}
