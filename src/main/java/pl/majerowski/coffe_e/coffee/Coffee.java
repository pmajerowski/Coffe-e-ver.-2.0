package pl.majerowski.coffe_e.coffee;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import pl.majerowski.coffe_e.brewType.BrewType;
import pl.majerowski.coffe_e.processing.Processing;

import javax.persistence.*;
import javax.validation.constraints.NotEmpty;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "coffees")
@Getter
@Setter
@NoArgsConstructor
public class Coffee {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @NotEmpty
    private String name;
    @NotEmpty
    private String origin;
    @ManyToOne(fetch = FetchType.EAGER)
    Processing processing;
    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(name = "coffee_brewtype",
            joinColumns = @JoinColumn(name = "coffee_id"),
            inverseJoinColumns = @JoinColumn(name = "brewtype_id"))
    Set<BrewType> brewTypes = new HashSet<>();
    @Column(name = "flavour_notes")
    private String flavourNotes;
    private int rating;
    private double quantity;

    @Override
    public String toString() {
        return "Coffee{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", origin='" + origin + '\'' +
                ", flavourNotes='" + flavourNotes + '\'' +
                ", rating=" + rating +
                ", quantity=" + quantity +
                '}';
    }

    public String getNameOrigin() {
        return name + " " + origin;
    }
}