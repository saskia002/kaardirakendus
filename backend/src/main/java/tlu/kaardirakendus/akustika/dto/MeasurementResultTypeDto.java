package tlu.kaardirakendus.akustika.dto;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class MeasurementResultTypeDto {
    /*
        currently not used in GET, maybe useful for POST
     */
    private Integer id;

    private String type;

}