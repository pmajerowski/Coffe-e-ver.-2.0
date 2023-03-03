package pl.majerowski.coffe_e.processing;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;


@Entity
@Table(name = "processing_types")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Processing {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;

    @Override
    public String toString() {
        return "Processing{" +
                "id=" + id +
                ", name='" + name + '\'' +
                '}';
    }
}
