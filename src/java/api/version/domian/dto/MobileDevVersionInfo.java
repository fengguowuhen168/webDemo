/**
 * 中国邮政新一代寄递平台 <br/>
 * <br/>
 * 子系统名: <br/>
 * 模 块 名: <br/>
 * 文件名称: MobileDevVersionInfo.java <br/>
 * 创建日期: 2017年2月19日下午5:24:29 <br/>
 * 创 建 人: thinkpad <br/>
 * 版权所有: 2017 中国邮政集团公司 保留所有权利 <br/>
 */

package api.version.domian.dto;

import java.io.Serializable;
import java.util.Date;

/**
 * 名称：类的中文名称 <br>
 * 功能：对类的功能进行说明 <br/>
 * <br/>
 * 
 * @since JDK 1.7
 * @see
 * @author thinkpad
 */
public class MobileDevVersionInfo implements Serializable {


    /** serialVersionUID: 用一句话描述这个变量的作用 */
    private static final long serialVersionUID = 1L;
    private String            versionId;            // 版本编号
    private int               versionCode;          // 版本序号
    private String            appType;              // 应用类型
    private String            versionDesc;          // 版本描述
    private Date              publishDate;          // 发布时间
    private String            downloadUrl;          // 应用下载路径
    private Date              uploadDate;           // 上传时间
    private String            uploader;             // 上传人
    private String            uploaderName;         // 上传人名称
    private String            isNewFlag;            // 是否为最新版本
    private long              createUserId;         // 创建人编号
    private Date              gmtCreated;           // 创建时间
    private long              modifyUserId;         // 修改人编号
    private Date              gmtModified;          // 修改时间

    /** @return 返回 versionId. */
    public String getVersionId() {
        return versionId;
    }

    /**
     * @param versionId
     *            设置 versionId .
     */
    public void setVersionId(String versionId) {
        this.versionId = versionId;
    }


    /** @return 返回 versionCode. */
    public int getVersionCode() {
        return versionCode;
    }

    /**
     * @param versionCode
     *            设置 versionCode .
     */
    public void setVersionCode(int versionCode) {
        this.versionCode = versionCode;
    }

    /** @return 返回 appType. */
    public String getAppType() {
        return appType;
    }

    /**
     * @param appType
     *            设置 appType .
     */
    public void setAppType(String appType) {
        this.appType = appType;
    }

    /** @return 返回 versionDesc. */
    public String getVersionDesc() {
        return versionDesc;
    }

    /**
     * @param versionDesc
     *            设置 versionDesc .
     */
    public void setVersionDesc(String versionDesc) {
        this.versionDesc = versionDesc;
    }

    /** @return 返回 publishDate. */
    public Date getPublishDate() {
        return publishDate;
    }

    /**
     * @param publishDate
     *            设置 publishDate .
     */
    public void setPublishDate(Date publishDate) {
        this.publishDate = publishDate;
    }

    /** @return 返回 downloadUrl. */
    public String getDownloadUrl() {
        return downloadUrl;
    }

    /**
     * @param downloadUrl
     *            设置 downloadUrl .
     */
    public void setDownloadUrl(String downloadUrl) {
        this.downloadUrl = downloadUrl;
    }

    /** @return 返回 uploadDate. */
    public Date getUploadDate() {
        return uploadDate;
    }

    /**
     * @param uploadDate
     *            设置 uploadDate .
     */
    public void setUploadDate(Date uploadDate) {
        this.uploadDate = uploadDate;
    }

    /** @return 返回 uploader. */
    public String getUploader() {
        return uploader;
    }

    /**
     * @param uploader
     *            设置 uploader .
     */
    public void setUploader(String uploader) {
        this.uploader = uploader;
    }

    /** @return 返回 uploaderName. */
    public String getUploaderName() {
        return uploaderName;
    }

    /**
     * @param uploaderName
     *            设置 uploaderName .
     */
    public void setUploaderName(String uploaderName) {
        this.uploaderName = uploaderName;
    }

    /** @return 返回 isNewFlag. */
    public String getIsNewFlag() {
        return isNewFlag;
    }

    /**
     * @param isNewFlag
     *            设置 isNewFlag .
     */
    public void setIsNewFlag(String isNewFlag) {
        this.isNewFlag = isNewFlag;
    }

    /** @return 返回 createUserId. */
    public long getCreateUserId() {
        return createUserId;
    }

    /**
     * @param createUserId
     *            设置 createUserId .
     */
    public void setCreateUserId(long createUserId) {
        this.createUserId = createUserId;
    }

    /** @return 返回 gmtCreated. */
    public Date getGmtCreated() {
        return gmtCreated;
    }

    /**
     * @param gmtCreated
     *            设置 gmtCreated .
     */
    public void setGmtCreated(Date gmtCreated) {
        this.gmtCreated = gmtCreated;
    }

    /** @return 返回 modifyUserId. */
    public long getModifyUserId() {
        return modifyUserId;
    }

    /**
     * @param modifyUserId
     *            设置 modifyUserId .
     */
    public void setModifyUserId(long modifyUserId) {
        this.modifyUserId = modifyUserId;
    }

    /** @return 返回 gmtModified. */
    public Date getGmtModified() {
        return gmtModified;
    }

    /**
     * @param gmtModified
     *            设置 gmtModified .
     */
    public void setGmtModified(Date gmtModified) {
        this.gmtModified = gmtModified;
    }

    /** @return 返回 serialversionuid. */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }


    /*
     * (non-Javadoc)
     * 
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
        return "MobileDevVersionInfo [versionId=" + versionId + ", versionCode=" + versionCode
            + ", appType=" + appType + ", versionDesc=" + versionDesc + ", publishDate="
            + publishDate + ", downloadUrl=" + downloadUrl + ", uploadDate=" + uploadDate
            + ", uploader=" + uploader + ", uploaderName=" + uploaderName + ", isNewFlag="
            + isNewFlag + ", createUserId=" + createUserId + ", gmtCreated=" + gmtCreated
            + ", modifyUserId=" + modifyUserId + ", gmtModified=" + gmtModified + "]";
    }

    /**
     * 构造方法： MobileDevVersionInfo.
     *
     */
    public MobileDevVersionInfo() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * 构造方法： MobileDevVersionInfo.
     *
     * @param versionId
     * @param versionCode
     * @param appType
     * @param versionDesc
     * @param publishDate
     * @param downloadUrl
     * @param uploadDate
     * @param uploader
     * @param uploaderName
     * @param isNewFlag
     * @param createUserId
     * @param gmtCreated
     * @param modifyUserId
     * @param gmtModified
     */
    public MobileDevVersionInfo(String versionId, int versionCode, String appType,
        String versionDesc, Date publishDate, String downloadUrl, Date uploadDate, String uploader,
        String uploaderName, String isNewFlag, long createUserId, Date gmtCreated,
        long modifyUserId, Date gmtModified) {
        super();
        this.versionId = versionId;
        this.versionCode = versionCode;
        this.appType = appType;
        this.versionDesc = versionDesc;
        this.publishDate = publishDate;
        this.downloadUrl = downloadUrl;
        this.uploadDate = uploadDate;
        this.uploader = uploader;
        this.uploaderName = uploaderName;
        this.isNewFlag = isNewFlag;
        this.createUserId = createUserId;
        this.gmtCreated = gmtCreated;
        this.modifyUserId = modifyUserId;
        this.gmtModified = gmtModified;
    }


}
