/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ksm.hazardreportapp.entities;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author kelvi
 */
@Entity
@Table(name = "actions", catalog = "hazardreportdb", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Actions.findAll", query = "SELECT a FROM Actions a")
    , @NamedQuery(name = "Actions.findById", query = "SELECT a FROM Actions a WHERE a.id = :id")
    , @NamedQuery(name = "Actions.findByDescription", query = "SELECT a FROM Actions a WHERE a.description = :description")
    , @NamedQuery(name = "Actions.findByResult", query = "SELECT a FROM Actions a WHERE a.result = :result")
    , @NamedQuery(name = "Actions.findByRisk", query = "SELECT a FROM Actions a WHERE a.risk = :risk")
    , @NamedQuery(name = "Actions.findByDate", query = "SELECT a FROM Actions a WHERE a.date = :date")
    , @NamedQuery(name = "Actions.findByActionStatus", query = "SELECT a FROM Actions a WHERE a.actionStatus = :actionStatus")})
public class Actions implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "description")
    private String description;
    @Size(max = 100)
    @Column(name = "result")
    private String result;
    @Size(max = 100)
    @Column(name = "risk")
    private String risk;
    @Basic(optional = false)
    @NotNull
    @Column(name = "date")
    @Temporal(TemporalType.DATE)
    private Date date;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 30)
    @Column(name = "action_status")
    private String actionStatus;
    @JoinColumn(name = "report_progress", referencedColumnName = "id")
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private ReportProgresses reportProgress;
    @JoinColumn(name = "action_type", referencedColumnName = "id")
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private ActionTypes actionType;

    public Actions() {
    }

    public Actions(Integer id) {
        this.id = id;
    }

    public Actions(Integer id, String description, Date date, String actionStatus) {
        this.id = id;
        this.description = description;
        this.date = date;
        this.actionStatus = actionStatus;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public String getRisk() {
        return risk;
    }

    public void setRisk(String risk) {
        this.risk = risk;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getActionStatus() {
        return actionStatus;
    }

    public void setActionStatus(String actionStatus) {
        this.actionStatus = actionStatus;
    }

    public ReportProgresses getReportProgress() {
        return reportProgress;
    }

    public void setReportProgress(ReportProgresses reportProgress) {
        this.reportProgress = reportProgress;
    }

    public ActionTypes getActionType() {
        return actionType;
    }

    public void setActionType(ActionTypes actionType) {
        this.actionType = actionType;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Actions)) {
            return false;
        }
        Actions other = (Actions) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.ksm.hazardreportapp.entities.Actions[ id=" + id + " ]";
    }

}
