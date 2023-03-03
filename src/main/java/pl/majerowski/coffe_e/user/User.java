package pl.majerowski.coffe_e.user;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.Size;

@Entity
@Table(name = "users")
@Getter
@Setter
@ToString
@NoArgsConstructor
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Size(min = 2, message = "Name must be at least 2 characters long.", max = 20)
    private String name;
    @Email
    private String email;
    @Size(min = 8, message = "Password must be at least 9 characters long.")
    private String password;

}
