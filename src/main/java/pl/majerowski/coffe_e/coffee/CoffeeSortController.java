package pl.majerowski.coffe_e.coffee;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/coffee/list")
public class CoffeeSortController {
    private final JpaCoffeeService jpaCoffeeService;

    public CoffeeSortController(JpaCoffeeService jpaCoffeeService) {
        this.jpaCoffeeService = jpaCoffeeService;
    }

    @GetMapping("/sortByName")
    public String sortByName(Model model) {
        List<Coffee> coffees = jpaCoffeeService.getAllCoffeesSortByName();
        model.addAttribute("coffees", coffees);
        return "/app/coffee/list";
    }

    @GetMapping("/sortByOrigin")
    public String sortByOrigin(Model model) {
        List<Coffee> coffees = jpaCoffeeService.getAllCoffeesSortByOrigin();
        model.addAttribute("coffees", coffees);
        return "/app/coffee/list";
    }

    @GetMapping("/sortByProcessing")
    public String sortByProcessing(Model model) {
        List<Coffee> coffees = jpaCoffeeService.getAllCoffeesSortByProcessing();
        model.addAttribute("coffees", coffees);
        return "/app/coffee/list";
    }

    @GetMapping("/sortByQuantity")
    public String sortByQuantity(Model model) {
        List<Coffee> coffees = jpaCoffeeService.getAllCoffeesSortByQuantity();
        model.addAttribute("coffees", coffees);
        return "/app/coffee/list";
    }

    @GetMapping("/sortByRating")
    public String sortByRating(Model model) {
        List<Coffee> coffees = jpaCoffeeService.getAllCoffeesSortByRating();
        model.addAttribute("coffees", coffees);
        return "/app/coffee/list";
    }

    @GetMapping("/sortByFlavourNotes")
    public String sortByFlavourNotes(Model model) {
        List<Coffee> coffees = jpaCoffeeService.getAllCoffeesSortByFlavourNotes();
        model.addAttribute("coffees", coffees);
        return "/app/coffee/list";
    }

    @GetMapping("/sortByBrewType")
    public String sortByBrewType(Model model) {
        List<Coffee> coffees = jpaCoffeeService.getAllCoffeesSortByBrewType();
        model.addAttribute("coffees", coffees);
        return "/app/coffee/list";
    }

}