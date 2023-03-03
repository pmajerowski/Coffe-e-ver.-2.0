package pl.majerowski.coffe_e.coffee;

import java.util.List;

public interface CoffeeService {
    List<Coffee> getAllCoffees();
    Coffee getCoffee(Long coffeeId);
    void addCoffee(Coffee coffee);
    void editCoffee(Coffee coffee);
    void deleteCoffee(Long coffeeId);
}
