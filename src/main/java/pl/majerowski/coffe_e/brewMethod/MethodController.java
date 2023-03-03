package pl.majerowski.coffe_e.brewMethod;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.majerowski.coffe_e.brewType.BrewType;
import pl.majerowski.coffe_e.brewType.JpaBrewingTypeService;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/method")
public class MethodController {
    private final JpaBrewMethodService jpaBrewMethodService;
    private final JpaBrewingTypeService jpaBrewingTypeService;
    private final GrindSizeRepository grindSizeRepository;

    public MethodController(JpaBrewMethodService jpaBrewMethodService, JpaBrewingTypeService jpaBrewingTypeService, GrindSizeRepository grindSizeRepository) {
        this.jpaBrewMethodService = jpaBrewMethodService;
        this.jpaBrewingTypeService = jpaBrewingTypeService;
        this.grindSizeRepository = grindSizeRepository;
    }

    // -> All methods list
    @GetMapping("/list")
    public String showMethods(Model model) {
        List<BrewMethod> methods = jpaBrewMethodService.getAllMethods();
        model.addAttribute("methods", methods);
        return "/app/method/list";
    }

    @GetMapping("/recipe")
    public String showRecipe(@RequestParam Long methodId, Model model) {
        BrewMethod brewMethod = jpaBrewMethodService.getMethod(methodId);
        model.addAttribute("brewMethod", brewMethod);
        return "/app/method/recipe_details";
    }

    @PostMapping("/recipe/save")
    @ResponseBody
    public String saveRecipe(BrewMethod brewMethod, BindingResult bindingResult) {
        return brewMethod.toString();
    }


    // -> New method add form
    @GetMapping("/new")
    public String newMethod(Model model) {
        BrewMethod brewMethod = new BrewMethod();
        model.addAttribute("brewMethod", brewMethod);
        return "app/method/new";
    }

    // -> Save new method to database
    @Transactional
    @PostMapping("/save")
    public String saveMethod(@Valid BrewMethod brewMethod, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "app/method/new";
        }
        jpaBrewMethodService.addMethod(brewMethod);
        return "redirect:/method/list";
    }

    // -> Edit method form
    @GetMapping("/edit/{id}")
    public String editMethod(@PathVariable Long id, Model model) {
        BrewMethod brewMethod = jpaBrewMethodService.getMethod(id);
        model.addAttribute("brewMethod", brewMethod);
        return "/app/method/edit";
    }

    // -> Save edited method to database
    @PostMapping("/edit/save")
    public String saveEditedMethod(@Valid BrewMethod brewMethod, BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
            model.addAttribute("brewMethod", brewMethod);
            return "/app/method/edit";
        }
        jpaBrewMethodService.addMethod(brewMethod);
        return "redirect:/method/list";
    }

    // -> Delete method confirmation
    @GetMapping("/confirm/{id}")
    public String deleteConfirm(@PathVariable Long id, Model model) {
        model.addAttribute("id", id);
        return "/app/method/deleteConfirm";
    }

    // -> Delete method from database
    @RequestMapping("/delete/{id}")
    public String deleteCoffee(@PathVariable Long id) {
        jpaBrewMethodService.deleteMethod(id);
        return "redirect:/method/list";
    }


    @ModelAttribute("brewingTypesList")
    public List<BrewType> brewTypes() {
        return jpaBrewingTypeService.getAllBrewTypes();
    }

    @ModelAttribute("grindSizes")
    public List<GrindSize> grindSizes() { return grindSizeRepository.findAll(); }
}
