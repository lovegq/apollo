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
@Table(name = "audit")
@SQLDelete(sql = "Update audit set deleted = 1 where id = ?")
@Where(clause = "deleted = 0")
public class Audit extends BaseEntity {

    public enum OP {
        INSERT, UPDATE, DELETE
    }

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private long id;
    @Column(name = "entity_name", nullable = false)
    private String entityName;

    @Column(name = "entity_id")
    private Long entityId;

    @Column(name = "op_name", nullable = false)
    private String opName;

    @Column(name = "comment")
    private String comment;

    public String getComment() {
        return comment;
    }

    public Long getEntityId() {
        return entityId;
    }

    public String getEntityName() {
        return entityName;
    }

    public String getOpName() {
        return opName;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public void setEntityId(Long entityId) {
        this.entityId = entityId;
    }

    public void setEntityName(String entityName) {
        this.entityName = entityName;
    }

    public void setOpName(String opName) {
        this.opName = opName;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    @Override
    public String toString() {
        return toStringHelper().add("entityName", entityName).add("entityId", entityId)
                .add("opName", opName).add("comment", comment).toString();
    }
}
