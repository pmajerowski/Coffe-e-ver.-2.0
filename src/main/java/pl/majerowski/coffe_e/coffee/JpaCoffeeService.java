package pl.majerowski.coffe_e.coffee;

import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Primary
public class JpaCoffeeService implements CoffeeService {
    private final CoffeeRepository coffeeRepository;

    public JpaCoffeeService(CoffeeRepository coffeeRepository) {
        this.coffeeRepository = coffeeRepository;
    }

    @Override
    public List<Coffee> getAllCoffees() {
        return coffeeRepository.findAll();
    }

    public List<Coffee> getAllAvailableCoffees() {
        return coffeeRepository.findAvailableCoffees();
    }

    @Override
    public Coffee getCoffee(Long coffeeId) {
        return coffeeRepository.findById(coffeeId).orElse(null);
    }

    @Override
    public void addCoffee(Coffee coffee) {
        coffeeRepository.save(coffee);
    }

    @Override
    public void editCoffee(Coffee coffee) {
        coffeeRepository.save(coffee);
    }

    @Override
    public void deleteCoffee(Long coffeeId) {
        coffeeRepository.deleteById(coffeeId);
    }

    public List<Coffee> getAllCoffeesSortByName() {
        return coffeeRepository.findAllByOrderByName();
    }

    public List<Coffee> getAllCoffeesSortByOrigin() {
        return coffeeRepository.findAllByOrderByOrigin();
    }

    public List<Coffee> getAllCoffeesSortByProcessing() {
        return coffeeRepository.findAllByOrderBOrderByProcessing();
    }

    public List<Coffee> getAllCoffeesSortByRating() {
        return coffeeRepository.findAllByOrderByRating();
    }

    public List<Coffee> getAllCoffeesSortByQuantity() {
        return coffeeRepository.findAllByOrderByQuantity();
    }

    public List<Coffee> getAllCoffeesSortByFlavourNotes() {
        return coffeeRepository.findAllByOrderByFlavourNotes();
    }

    public List<Coffee> getAllCoffeesSortByBrewType() {
        return coffeeRepository.findAllByOrderByBrewType();
    }

    public List<Long> getBrewTypesForSelectedCoffee(Long coffeeId) {
        return coffeeRepository.findBrewTypesForSelectedCoffee(coffeeId);
    }

    public void updateRatingOfCoffee(int rating, Long coffeeId) {
        coffeeRepository.updateCoffeeRating(rating, coffeeId);
    }

    public void updateQuantityOfCoffee(double quantity, Long coffeeId) {
        coffeeRepository.updateCoffeeQuantity(quantity, coffeeId);
    }
}
