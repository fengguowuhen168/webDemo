package api.common;

import java.util.List;

public class Wrapper<V, E> {
    private String  resCode   = "";
    private String  resMess   = "";
    private V       comment;
    private List<E> detail;
    private String  innerHtml = "";

    /**
     * 构造方法： Wrapper.
     *
     */
    public Wrapper() {
    }


    public String getInnerHtml() {
        return innerHtml;
    }


    public void setInnerHtml(String innerHtml) {
        this.innerHtml = innerHtml;
    }


    /** @return 返回 resCode. */
    public String getResCode() {
        return resCode;
    }

    /**
     * @param resCode
     *            设置 resCode .
     */
    public void setResCode(String resCode) {
        this.resCode = resCode;
    }

    /** @return 返回 resMess. */
    public String getResMess() {
        return resMess;
    }

    /**
     * @param resMess
     *            设置 resMess .
     */
    public void setResMess(String resMess) {
        this.resMess = resMess;
    }

    /** @return 返回 comment. */
    public V getComment() {
        return comment;
    }

    /**
     * @param comment
     *            设置 comment .
     */
    public void setComment(V comment) {
        this.comment = comment;
    }


    /** @return 返回 detail. */
    public List<E> getDetail() {
        return detail;
    }

    /**
     * @param detail
     *            设置 detail .
     */
    public void setDetail(List<E> detail) {
        this.detail = detail;
    }


}
