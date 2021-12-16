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
@Table(name = "privilege")
@SQLDelete(sql = "Update privilege set is_deleted = 1 where id = ?")
@Where(clause = "is_deleted = 0")
public class Privilege extends BaseEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private long id;

    @Column(name = "name", nullable = false)
    private String name;

    @Column(name = "privil_type", nullable = false)
    private String privilType;

    @Column(name = "namespace_id")
    private long namespaceId;

    public String getName() {
        return name;
    }

    public long getNamespaceId() {
        return namespaceId;
    }

    public String getPrivilType() {
        return privilType;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setNamespaceId(long namespaceId) {
        this.namespaceId = namespaceId;
    }

    public void setPrivilType(String privilType) {
        this.privilType = privilType;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    @Override
    public String toString() {
        return toStringHelper().add("namespaceId", namespaceId).add("privilType", privilType)
                .add("name", name).toString();
    }
}
