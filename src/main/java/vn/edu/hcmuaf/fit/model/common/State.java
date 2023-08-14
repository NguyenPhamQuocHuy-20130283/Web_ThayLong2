package vn.edu.hcmuaf.fit.model.common;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class State extends Base<State> {

    private String name;
    private String table;
}
