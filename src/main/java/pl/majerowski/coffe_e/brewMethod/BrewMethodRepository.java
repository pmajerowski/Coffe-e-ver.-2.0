package pl.majerowski.coffe_e.brewMethod;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BrewMethodRepository extends JpaRepository<BrewMethod, Long> {
    @Query("select bm from BrewMethod bm order by bm.name")
    List<BrewMethod> findBrewMethodsByOrderByName();

    @Query("select bm from BrewMethod bm order by bm.brewType.name")
    List<BrewMethod> findBrewMethodsByOrderByBrewType();

    @Query("select bm from BrewMethod bm order by bm.brewTime")
    List<BrewMethod> findBrewMethodsByOrderByBrewTime();

    @Query("select bm from BrewMethod bm order by bm.ratio")
    List<BrewMethod> findBrewMethodsByOrderByRatio();

    @Query("select bm from BrewMethod bm order by bm.grindSize.name")
    List<BrewMethod> findBrewMethodsByOrderByGrindSize();

    @Query("select bm from BrewMethod bm order by bm.waterTemperature desc")
    List<BrewMethod> findBrewMethodsByOrderByWaterTemperature();

}
