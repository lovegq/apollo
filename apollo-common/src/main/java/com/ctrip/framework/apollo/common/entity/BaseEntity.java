package com.ctrip.framework.apollo.common.entity;

import com.google.common.base.MoreObjects;
import com.google.common.base.MoreObjects.ToStringHelper;

import javax.persistence.*;
import java.util.Date;

@MappedSuperclass
@Inheritance(strategy = InheritanceType.TABLE_PER_CLASS)
public abstract class BaseEntity {
	@Column(name = "deleted")
	protected int deleted = 0;

	@Column(name = "data_change_created_by", nullable = false)
	private String dataChangeCreatedBy;

	@Column(name = "data_change_created_time", nullable = false)
	private Date dataChangeCreatedTime;

	@Column(name = "data_change_last_modified_by")
	private String dataChangeLastModifiedBy;

	@Column(name = "data_change_last_time")
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

	public int getDeleted() {
		return deleted;
	}

	public void setDeleted(int deleted) {
		this.deleted = deleted;
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
		return MoreObjects.toStringHelper(this).omitNullValues().add("dataChangeCreatedBy", dataChangeCreatedBy)
				.add("dataChangeCreatedTime", dataChangeCreatedTime)
				.add("dataChangeLastModifiedBy", dataChangeLastModifiedBy)
				.add("dataChangeLastModifiedTime", dataChangeLastModifiedTime);
	}

	@Override
	public String toString() {
		return toStringHelper().toString();
	}
}
