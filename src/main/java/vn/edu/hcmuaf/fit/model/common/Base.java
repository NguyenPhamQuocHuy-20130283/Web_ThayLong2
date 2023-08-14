package vn.edu.hcmuaf.fit.model.common;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Base<T> {
    protected int id;
    protected Timestamp created_at;
    protected Timestamp updated_at;

}
