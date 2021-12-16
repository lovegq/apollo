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
@Table(name = "cluster")
@SQLDelete(sql = "Update cluster set deleted = 1 where id = ?")
@Where(clause = "deleted = false")
public class Cluster extends BaseEntity implements Comparable<Cluster> {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private long id;
    @Column(name = "name", nullable = false)
    private String name;

    @Column(name = "app_id", nullable = false)
    private String appId;

    @Column(name = "parent_cluster_id", nullable = false)
    private long parentClusterId;

    public String getAppId() {
        return appId;
    }

    public String getName() {
        return name;
    }

    public void setAppId(String appId) {
        this.appId = appId;
    }

    public void setName(String name) {
        this.name = name;
    }

    public long getParentClusterId() {
        return parentClusterId;
    }

    public void setParentClusterId(long parentClusterId) {
        this.parentClusterId = parentClusterId;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    @Override
    public String toString() {
        return toStringHelper().add("name", name).add("appId", appId)
                .add("parentClusterId", parentClusterId).toString();
    }

    @Override
    public int compareTo(Cluster o) {
        if (o == null || getId() > o.getId()) {
            return 1;
        }

        if (getId() == o.getId()) {
            return 0;
        }

        return -1;
    }
}
