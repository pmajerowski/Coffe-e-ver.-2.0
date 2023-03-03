package pl.majerowski.coffe_e;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.majerowski.coffe_e.user.User;


import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/")
public class HomeController {

    @GetMapping("")
    public String landingPage() {
        return "landing";
    }

    @GetMapping("/about")
    public String about() {
        return "about";
    }

    @GetMapping("/dashboard")
    public String dashboard(HttpSession session, Model model) {
        Object userObject = session.getAttribute("user");
        if (userObject == null) {
            return "redirect:/login";
        }
        User user = (User) userObject;
        model.addAttribute("user", user);

        return "app/dashboard";
    }
}