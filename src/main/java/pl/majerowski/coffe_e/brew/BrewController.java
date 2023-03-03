package pl.majerowski.coffe_e.brew;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import pl.majerowski.coffe_e.brewMethod.BrewMethod;
import pl.majerowski.coffe_e.brewMethod.JpaBrewMethodService;
import pl.majerowski.coffe_e.coffee.Coffee;
import pl.majerowski.coffe_e.coffee.JpaCoffeeService;
import pl.majerowski.coffe_e.processing.JpaProcessingService;
import pl.majerowski.coffe_e.processing.Processing;

import java.util.List;

@Controller
@RequestMapping("/brew")
public class BrewController {
    private final JpaCoffeeService jpaCoffeeService;
    private final JpaProcessingService jpaProcessingService;
    private final JpaBrewMethodService jpaBrewMethodService;

    public BrewController(JpaCoffeeService jpaCoffeeService,
                          JpaProcessingService jpaProcessingService,
                          JpaBrewMethodService jpaBrewMethodService) {
        this.jpaCoffeeService = jpaCoffeeService;
        this.jpaProcessingService = jpaProcessingService;
        this.jpaBrewMethodService = jpaBrewMethodService;
    }

    @GetMapping("/select")
    public String brewSelect(@RequestParam(defaultValue = "0") Long coffeeId, Model model, BrewDTO brewDTO) {
        model.addAttribute("coffeeId", coffeeId);
        model.addAttribute("brewDTO", brewDTO);
        return "app/brew/select";
    }


    @GetMapping("/recipe")
    public String recipe(BrewDTO brewDTO, Model model) {
        double coffeeQuantity = jpaCoffeeService.getCoffee(brewDTO.getCoffeeId()).getQuantity();
        BrewMethod brewMethod = jpaBrewMethodService.getMethod(brewDTO.getBrewMethodId());
        double coffeeGrounds = Math.floor(brewDTO.getDesiredAmount()/brewMethod.getRatio());

        if(coffeeGrounds > coffeeQuantity) {
            double maxDesiredAmount =Math.floor(brewMethod.getRatio() * coffeeQuantity);
            String message = String.format(
                    "You have only %s g of this coffee. This is enough for %s ml of desired amount for this method.",
                    coffeeQuantity, maxDesiredAmount);

            brewDTO.setMessage(message);
            brewDTO.setDesiredAmount(maxDesiredAmount);
            model.addAttribute("brewDTO", brewDTO);
            model.addAttribute("coffeeId", brewDTO.getCoffeeId());
            return "app/brew/select";
        }

        double desiredAmount = brewDTO.getDesiredAmount();;
        Coffee coffee = jpaCoffeeService.getCoffee(brewDTO.getCoffeeId());

        brewDTO.setCoffeeGrounds(coffeeGrounds);
        String recipe = brewMethod.getRecipe();
        String parsedRecipe = RecipeParser.parseRecipe(recipe, desiredAmount, coffeeGrounds);

        brewMethod.setRecipe(parsedRecipe);

        model.addAttribute("desiredAmount", brewDTO.getDesiredAmount());
        model.addAttribute("coffeeGrounds", coffeeGrounds);
        model.addAttribute("brewMethod", brewMethod);
        model.addAttribute("coffee", coffee);
        model.addAttribute("brewDTO", brewDTO);

        return "app/brew/recipe";
    }

    @ModelAttribute("processingList")
    public List<Processing> processingList() {
        return jpaProcessingService.getAllProcessingTypes();
    }

    @ModelAttribute("brewingMethods")
    public List<BrewMethod> brewMethods() {
        return jpaBrewMethodService.getAllMethods();
    }

    @ModelAttribute("coffees")
    public List<Coffee> coffees() {
        return jpaCoffeeService.getAllAvailableCoffees();
    }
}
