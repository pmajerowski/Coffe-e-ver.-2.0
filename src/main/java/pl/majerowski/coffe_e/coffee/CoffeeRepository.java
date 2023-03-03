package pl.majerowski.coffe_e.coffee;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CoffeeRepository extends JpaRepository<Coffee, Long> {

    @Query(value = "select * from coffees where quantity > 0.0", nativeQuery = true)
    List<Coffee> findAvailableCoffees();


    @Query("select c from Coffee c order by c.name")
    List<Coffee> findAllByOrderByName();

    @Query("select c from Coffee c order by c.origin")
    List<Coffee> findAllByOrderByOrigin();

    @Query("select c from Coffee c join fetch c.processing p order by p.name")
    List<Coffee> findAllByOrderBOrderByProcessing();

    @Query("select c from Coffee c order by c.rating desc")
    List<Coffee> findAllByOrderByRating();

    @Query("select c from Coffee c order by c.quantity desc")
    List<Coffee> findAllByOrderByQuantity();

    @Query("select c from Coffee c order by c.flavourNotes")
    List<Coffee> findAllByOrderByFlavourNotes();

    @Query("select distinct c from Coffee c join fetch c.brewTypes b order by b.name")
    List<Coffee> findAllByOrderByBrewType();

    @Query(value = "select bt.id, bt.name  from coffees cross " +
            "join coffees_brew_types cbt on coffees.id = cbt.Coffee_id " +
            "join brew_types bt on bt.id = cbt.brewTypes_id where Coffee_id = ?;", nativeQuery = true)
    List<Long> findBrewTypesForSelectedCoffee(Long coffeeId);

    @Modifying(clearAutomatically = true)
    @Query(value = "update coffees set rating = ?1 where id = ?2", nativeQuery = true)
    void updateCoffeeRating(int rating, Long coffeeId);

    @Modifying(clearAutomatically = true)
    @Query(value = "update coffees set quantity = ?1 where id = ?2", nativeQuery = true)
    void updateCoffeeQuantity(double quantity, Long coffeeId);
}
