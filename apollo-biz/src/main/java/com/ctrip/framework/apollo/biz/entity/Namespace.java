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
@Table(name = "namespace")
@SQLDelete(sql = "Update namespace set deleted = 1 where id = ?")
@Where(clause = "deleted = false")
public class Namespace extends BaseEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private long id;
    @Column(name = "app_id", nullable = false)
    private String appId;

    @Column(name = "cluster_name", nullable = false)
    private String clusterName;

    @Column(name = "namespace_name", nullable = false)
    private String namespaceName;

    public Namespace() {

    }

    public Namespace(String appId, String clusterName, String namespaceName) {
        this.appId = appId;
        this.clusterName = clusterName;
        this.namespaceName = namespaceName;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getAppId() {
        return appId;
    }

    public String getClusterName() {
        return clusterName;
    }

    public String getNamespaceName() {
        return namespaceName;
    }

    public void setAppId(String appId) {
        this.appId = appId;
    }

    public void setClusterName(String clusterName) {
        this.clusterName = clusterName;
    }

    public void setNamespaceName(String namespaceName) {
        this.namespaceName = namespaceName;
    }

    @Override
    public String toString() {
        return toStringHelper().add("appId", appId).add("clusterName", clusterName)
                .add("namespaceName", namespaceName).toString();
    }
}
