package pl.majerowski.coffe_e.brewType;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import pl.majerowski.coffe_e.brewMethod.BrewMethod;
import pl.majerowski.coffe_e.coffee.Coffee;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "brew_types")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class BrewType {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    @OneToMany(mappedBy = "brewType", fetch = FetchType.EAGER)
    @JsonIgnore
    private Set<BrewMethod> brewMethods = new HashSet<>();
    @ManyToMany(mappedBy = "brewTypes", fetch = FetchType.EAGER)
    @JsonIgnore
    private Set<Coffee> coffees = new HashSet<>();

    @Override
    public String toString() {
        return "BrewType{" +
                "id=" + id +
                ", name='" + name + '\'' +
                '}';
    }
}
