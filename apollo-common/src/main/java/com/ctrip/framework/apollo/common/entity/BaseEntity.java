package com.ctrip.framework.apollo.common.entity;

import com.google.common.base.MoreObjects;
import com.google.common.base.MoreObjects.ToStringHelper;

import javax.persistence.*;
import java.util.Date;

@MappedSuperclass
@Inheritance(strategy = InheritanceType.TABLE_PER_CLASS)
public abstract class BaseEntity {
    @Column(name = "IsDeleted", columnDefinition = "Bit default '0'")
    protected boolean isDeleted = false;

    @Column(name = "DataChange_CreatedBy", nullable = false)
    private String dataChangeCreatedBy;

    @Column(name = "DataChange_CreatedTime", nullable = false)
    private Date dataChangeCreatedTime;

    @Column(name = "DataChange_LastModifiedBy")
    private String dataChangeLastModifiedBy;

    @Column(name = "DataChange_LastTime")
    private Date dataChangeLastModifiedTime;

    public String getDataChangeCreatedBy() {
        return dataChangeCreatedBy;
    }

    public Date getDataChangeCreatedTime() {
        return dataChangeCreatedTime;
    }

    public String getDataChangeLastModifiedBy() {
        return dataChangeLastModifiedBy;
    }

    public Date getDataChangeLastModifiedTime() {
        return dataChangeLastModifiedTime;
    }


    public boolean isDeleted() {
        return isDeleted;
    }

    public void setDataChangeCreatedBy(String dataChangeCreatedBy) {
        this.dataChangeCreatedBy = dataChangeCreatedBy;
    }

    public void setDataChangeCreatedTime(Date dataChangeCreatedTime) {
        this.dataChangeCreatedTime = dataChangeCreatedTime;
    }

    public void setDataChangeLastModifiedBy(String dataChangeLastModifiedBy) {
        this.dataChangeLastModifiedBy = dataChangeLastModifiedBy;
    }

    public void setDataChangeLastModifiedTime(Date dataChangeLastModifiedTime) {
        this.dataChangeLastModifiedTime = dataChangeLastModifiedTime;
    }

    public void setDeleted(boolean deleted) {
        isDeleted = deleted;
    }

    @PrePersist
    protected void prePersist() {
        if (this.dataChangeCreatedTime == null) {
            dataChangeCreatedTime = new Date();
        }
        if (this.dataChangeLastModifiedTime == null) {
            dataChangeLastModifiedTime = new Date();
        }
    }

    @PreUpdate
    protected void preUpdate() {
        this.dataChangeLastModifiedTime = new Date();
    }

    @PreRemove
    protected void preRemove() {
        this.dataChangeLastModifiedTime = new Date();
    }

    protected ToStringHelper toStringHelper() {
        return MoreObjects.toStringHelper(this).omitNullValues()
                .add("dataChangeCreatedBy", dataChangeCreatedBy)
                .add("dataChangeCreatedTime", dataChangeCreatedTime)
                .add("dataChangeLastModifiedBy", dataChangeLastModifiedBy)
                .add("dataChangeLastModifiedTime", dataChangeLastModifiedTime);
    }

    @Override
    public String toString() {
        return toStringHelper().toString();
    }
}
