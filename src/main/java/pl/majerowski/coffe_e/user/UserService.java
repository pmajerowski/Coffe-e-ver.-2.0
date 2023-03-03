package pl.majerowski.coffe_e.user;

public interface UserService {
    User getUser(Long userId);

    void addUser(User user);

    void editUser(User user);

    void deleteUser(Long userId);
}
