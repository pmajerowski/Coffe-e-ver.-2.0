package pl.majerowski.coffe_e.brewMethod;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;

@Entity
@Table(name = "grind_sizes")
@Getter
@Setter
@ToString
public class GrindSize {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
}
