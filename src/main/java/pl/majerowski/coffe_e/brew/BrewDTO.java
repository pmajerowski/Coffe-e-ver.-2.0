package pl.majerowski.coffe_e.brew;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class BrewDTO {
    private Long brewTypeId;
    private Long brewMethodId;
    private Long coffeeId;
    private double desiredAmount;
    private double coffeeGrounds;
    private String message;
}
