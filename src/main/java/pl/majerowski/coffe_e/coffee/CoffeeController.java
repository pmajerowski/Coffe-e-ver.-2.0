package pl.majerowski.coffe_e.coffee;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.majerowski.coffe_e.brewType.BrewType;
import pl.majerowski.coffe_e.brewType.JpaBrewingTypeService;
import pl.majerowski.coffe_e.processing.JpaProcessingService;
import pl.majerowski.coffe_e.processing.Processing;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/coffee")
public class CoffeeController {
    private final JpaCoffeeService jpaCoffeeService;
    private final JpaProcessingService jpaProcessingService;
    private final JpaBrewingTypeService jpaBrewingTypeService;

    public CoffeeController(JpaCoffeeService jpaCoffeeService,
                            JpaProcessingService jpaProcessingService,
                            JpaBrewingTypeService jpaBrewTypeService) {
        this.jpaCoffeeService = jpaCoffeeService;
        this.jpaProcessingService = jpaProcessingService;
        this.jpaBrewingTypeService = jpaBrewTypeService;
    }

    // -> All coffees list
    @GetMapping("/list")
    public String showCoffees(Model model) {
        List<Coffee> coffees = jpaCoffeeService.getAllCoffees();
        model.addAttribute("coffees", coffees);
        return "/app/coffee/list";
    }

    // -> New coffee add form
    @GetMapping("/new")
    public String newCoffee(Model model) {
        Coffee coffee = new Coffee();
        model.addAttribute("coffee", coffee);
        return "app/coffee/new";
    }

    // -> Save new coffee to database
    @PostMapping("/save")
    public String saveCoffee(@Valid Coffee coffee, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "app/coffee/new";
        }
        jpaCoffeeService.addCoffee(coffee);
        return "redirect:/coffee/list";
    }

    // -> Edit coffee form
    @GetMapping("/edit/{id}")
    public String editCoffee(@PathVariable Long id, Model model) {
        Coffee coffee = jpaCoffeeService.getCoffee(id);
        model.addAttribute("coffee", coffee);
        return "/app/coffee/edit";
    }

    // -> Save edited coffee to database
    @PostMapping("/edit/save")
    public String saveEditedCoffee(@Valid Coffee coffee, BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
            model.addAttribute("coffee", coffee);
            return "/app/coffee/edit";
        }
        jpaCoffeeService.addCoffee(coffee);
        return "redirect:/coffee/list";
    }

    // -> Delete coffee confirmation
    @GetMapping("/confirm/{id}")
    public String deleteConfirm(@PathVariable Long id, Model model) {
        model.addAttribute("id", id);
        return "/app/coffee/deleteConfirm";
    }

    // -> Delete coffee from database
    @RequestMapping("/delete/{id}")
    public String deleteCoffee(@PathVariable Long id) {
        jpaCoffeeService.deleteCoffee(id);
        return "redirect:/coffee/list";
    }

    // -> RAte coffee after brewing
    @RequestMapping("/rate")
    public String rateCoffee(@RequestParam Long coffeeId, Model model) {
        Coffee coffee = jpaCoffeeService.getCoffee(coffeeId);
        model.addAttribute("coffee", coffee);
        return "app/coffee/rate";
    }

    @Transactional
    @PostMapping("/rate/save")
    public String saveRate(@RequestParam String usedCoffeeGrounds,
                           @RequestParam Long id,
                           @RequestParam double quantity,
                           @RequestParam int rating) {
        double updatedQuantity =
                quantity - Double.parseDouble(usedCoffeeGrounds.substring(0, usedCoffeeGrounds.length()-1));

        jpaCoffeeService.updateRatingOfCoffee(rating, id);
        jpaCoffeeService.updateQuantityOfCoffee(updatedQuantity, id);

        return "redirect:/coffee/list";

    }

    // -> Adding processing list and brewTypes to model

    @ModelAttribute("processingList")
    public List<Processing> processingList() {
        return jpaProcessingService.getAllProcessingTypes();
    }

    @ModelAttribute("brewingTypesList")
    public List<BrewType> brewTypes() {
        return jpaBrewingTypeService.getAllBrewTypes();
    }
}
