package cn.com.jtang.po.custom;

import java.util.List;

/**
 * Created by ZJUXP on 2016-09-18.
 */
public class BatchUploadSequence {
    List<String> successSequence;
    List<String> failureSequence;
    public List<String> getSuccessSequence() {
        return successSequence;
    }

    public void setSuccessSequence(List<String> successSequence) {
        this.successSequence = successSequence;
    }

    public List<String> getFailureSequence() {
        return failureSequence;
    }

    public void setFailureSequence( List<String> failureSequence) {
        this.failureSequence = failureSequence;
    }


}
