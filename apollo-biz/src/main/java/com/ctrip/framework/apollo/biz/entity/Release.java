/*
 * Copyright 2021 Apollo Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 */
package com.ctrip.framework.apollo.biz.entity;

import com.ctrip.framework.apollo.common.entity.BaseEntity;
import org.hibernate.annotations.SQLDelete;
import org.hibernate.annotations.Where;

import javax.persistence.*;

/**
 * @author Jason Song(song_s@ctrip.com)
 */
@Entity
@Table(name = "release")
@SQLDelete(sql = "Update release set deleted = 1 where id = ?")
@Where(clause = "deleted = false")
public class Release extends BaseEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private long id;
    @Column(name = "release_key", nullable = false)
    private String releaseKey;

    @Column(name = "name", nullable = false)
    private String name;

    @Column(name = "app_id", nullable = false)
    private String appId;

    @Column(name = "cluster_name", nullable = false)
    private String clusterName;

    @Column(name = "namespace_name", nullable = false)
    private String namespaceName;

    @Column(name = "configurations", nullable = false)
    @Lob
    private String configurations;

    @Column(name = "comment", nullable = false)
    private String comment;

    @Column(name = "is_abandoned")
    private boolean isAbandoned;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getReleaseKey() {
        return releaseKey;
    }

    public String getAppId() {
        return appId;
    }

    public String getClusterName() {
        return clusterName;
    }

    public String getComment() {
        return comment;
    }

    public String getConfigurations() {
        return configurations;
    }

    public String getNamespaceName() {
        return namespaceName;
    }

    public String getName() {
        return name;
    }

    public void setReleaseKey(String releaseKey) {
        this.releaseKey = releaseKey;
    }

    public void setAppId(String appId) {
        this.appId = appId;
    }

    public void setClusterName(String clusterName) {
        this.clusterName = clusterName;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public void setConfigurations(String configurations) {
        this.configurations = configurations;
    }

    public void setNamespaceName(String namespaceName) {
        this.namespaceName = namespaceName;
    }

    public void setName(String name) {
        this.name = name;
    }

    public boolean isAbandoned() {
        return isAbandoned;
    }

    public void setAbandoned(boolean abandoned) {
        isAbandoned = abandoned;
    }

    @Override
    public String toString() {
        return toStringHelper().add("name", name).add("appId", appId).add("clusterName", clusterName)
                .add("namespaceName", namespaceName).add("configurations", configurations)
                .add("comment", comment).add("isAbandoned", isAbandoned).toString();
    }
}
