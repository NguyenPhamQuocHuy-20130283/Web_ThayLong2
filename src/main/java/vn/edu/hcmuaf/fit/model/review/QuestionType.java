package vn.edu.hcmuaf.fit.model.review;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import vn.edu.hcmuaf.fit.model.common.Base;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class QuestionType extends Base<QuestionType> {
    private String name;
    private String key;


}
