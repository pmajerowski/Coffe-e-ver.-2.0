package pl.majerowski.coffe_e.brewMethod;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.format.annotation.NumberFormat;
import pl.majerowski.coffe_e.brewType.BrewType;

import javax.persistence.*;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Entity
@Table(name = "brew_methods")
@Getter
@Setter
@NoArgsConstructor
public class BrewMethod {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @NotEmpty
    private String name;
    @ManyToOne(fetch = FetchType.EAGER)
    private BrewType brewType;
    @Size(min = 30, max = 4000)
    private String recipe;
    @NotNull
    @NumberFormat
    private int ratio;
    @ManyToOne
    GrindSize grindSize;
    @NotNull
    @NumberFormat
    @Column(name = "water_temperature")
    private int waterTemperature;
    @NotEmpty
    @Column(name = "brew_time")
    private String brewTime;

    @Override
    public String toString() {
        return "BrewMethod{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", brewType=" + brewType +
                ", recipe='" + recipe + '\'' +
                ", ratio=" + ratio +
                ", grindSize=" + grindSize +
                ", waterTemperature=" + waterTemperature +
                ", brewTime='" + brewTime + '\'' +
                '}';
    }
}
