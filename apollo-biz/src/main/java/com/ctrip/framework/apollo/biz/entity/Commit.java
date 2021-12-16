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

@Entity
@Table(name = "commit")
@SQLDelete(sql = "Update commit set is_deleted = 1 where id = ?")
@Where(clause = "is_deleted = 0")
public class Commit extends BaseEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private long id;
    @Lob
    @Column(name = "change_sets", nullable = false)
    private String changeSets;

    @Column(name = "app_id", nullable = false)
    private String appId;

    @Column(name = "cluster_name", nullable = false)
    private String clusterName;

    @Column(name = "namespace_name", nullable = false)
    private String namespaceName;

    @Column(name = "comment")
    private String comment;

    public String getChangeSets() {
        return changeSets;
    }

    public void setChangeSets(String changeSets) {
        this.changeSets = changeSets;
    }

    public String getAppId() {
        return appId;
    }

    public void setAppId(String appId) {
        this.appId = appId;
    }

    public String getClusterName() {
        return clusterName;
    }

    public void setClusterName(String clusterName) {
        this.clusterName = clusterName;
    }

    public String getNamespaceName() {
        return namespaceName;
    }

    public void setNamespaceName(String namespaceName) {
        this.namespaceName = namespaceName;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    @Override
    public String toString() {
        return toStringHelper().add("changeSets", changeSets).add("appId", appId).add("clusterName", clusterName)
                .add("namespaceName", namespaceName).add("comment", comment).toString();
    }
}
