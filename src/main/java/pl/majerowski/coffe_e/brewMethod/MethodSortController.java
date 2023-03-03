package pl.majerowski.coffe_e.brewMethod;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/method/list")
public class MethodSortController {
    private final JpaBrewMethodService jpaBrewMethodService;

    public MethodSortController(JpaBrewMethodService jpaBrewMethodService) {
        this.jpaBrewMethodService = jpaBrewMethodService;
    }

    @GetMapping("/sortByName")
    public String sortByName(Model model) {
        List<BrewMethod> methods = jpaBrewMethodService.getAllMethodsSortByName();
        model.addAttribute("methods", methods);
        return "/app/method/list";
    }

    @GetMapping("/sortByBrewType")
    public String sortByBrewType(Model model) {
        List<BrewMethod> methods = jpaBrewMethodService.getAllMethodsSortByBrewType();
        model.addAttribute("methods", methods);
        return "/app/method/list";
    }

    @GetMapping("/sortByBrewTime")
    public String sortByBrewTime(Model model) {
        List<BrewMethod> methods = jpaBrewMethodService.getAllMethodsSortByBrewTime();
        model.addAttribute("methods", methods);
        return "/app/method/list";
    }

    @GetMapping("/sortByRatio")
    public String sortByRatio(Model model) {
        List<BrewMethod> methods = jpaBrewMethodService.getAllMethodsSortByRatio();
        model.addAttribute("methods", methods);
        return "/app/method/list";
    }

    @GetMapping("/sortByGrindSize")
    public String sortByGrindSize(Model model) {
        List<BrewMethod> methods = jpaBrewMethodService.getAllMethodsSortByGrindSize();
        model.addAttribute("methods", methods);
        return "/app/method/list";
    }

    @GetMapping("/sortByWaterTemperature")
    public String sortByWaterTemperature(Model model) {
        List<BrewMethod> methods = jpaBrewMethodService.getAllMethodsSortByWaterTemperature();
        model.addAttribute("methods", methods);
        return "/app/method/list";
    }
}
