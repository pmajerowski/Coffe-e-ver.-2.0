package pl.majerowski.coffe_e.user;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Controller
public class UserController {
    private final JpaUserService jpaUserService;

    public UserController(JpaUserService jpaUserService) {
        this.jpaUserService = jpaUserService;
    }

    @GetMapping("/register")
    public String registerGet(Model model) {
        User user = new User();
        model.addAttribute("user", user);
        return "register";
    }

    @PostMapping("/register")
    public String registerPost(@Valid User user, BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
            return "register";
        }
        jpaUserService.addUser(user);
        return "redirect:/login";
    }

    @GetMapping("/login")
    public String login(Model model) {
        User user = new User();
        model.addAttribute("user", user);
        return "login";
    }

    @PostMapping("/login")
    public String login(User userToCompare, Model model, HttpSession session) {
        String givenEmail = userToCompare.getEmail();
        User user = jpaUserService.getUserByEmail(givenEmail);

        if (user == null) {
            String message = "Wrong email.";
            session.setAttribute("message", message);

            return "redirect:/login";
        }

        if (!userToCompare.getPassword().equals(user.getPassword())) {
            String message = "Wrong password.";
            session.setAttribute("message", message);
            return "redirect:/login";
        }

        session.setAttribute("user", user);
        session.removeAttribute("message");
        return "app/dashboard";
    }

    @RequestMapping("/user")
    public String userDetails(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        model.addAttribute("user", user);
        return "app/user/user";
    }

    @PostMapping("/user")
    public String editUser(User user) {
        jpaUserService.editUser(user);
        return "redirect:/login";
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        session.removeAttribute("user");
        return "landing";
    }

    @GetMapping("/user/confirm/{id}")
    public String deleteConfirm(@PathVariable Long id, Model model) {
        model.addAttribute("id", id);
        return "/app/user/deleteConfirm";
    }

    // -> Delete coffee from database
    @RequestMapping("/user/delete/{id}")
    public String deleteUser(@PathVariable Long id) {
        jpaUserService.deleteUser(id);
        return "redirect:/";
    }
}
