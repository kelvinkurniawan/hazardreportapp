/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ksm.hazardreportapp.entities;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author YOGA
 */
@Entity
@Table(name = "reports")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Reports.findAll", query = "SELECT r FROM Reports r")
    , @NamedQuery(name = "Reports.findById", query = "SELECT r FROM Reports r WHERE r.id = :id")
    , @NamedQuery(name = "Reports.findByDate", query = "SELECT r FROM Reports r WHERE r.date = :date")
    , @NamedQuery(name = "Reports.findByOriginator", query = "SELECT r FROM Reports r WHERE r.originator = :originator")
    , @NamedQuery(name = "Reports.findByDescription", query = "SELECT r FROM Reports r WHERE r.description = :description")})
public class Reports implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @Column(name = "date")
    @Temporal(TemporalType.DATE)
    private Date date;
    @Basic(optional = false)
    @Column(name = "originator")
    private String originator;
    @Basic(optional = false)
    @Column(name = "description")
    private String description;
    @JoinColumn(name = "room", referencedColumnName = "id")
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private Rooms room;
    @JoinColumn(name = "priority", referencedColumnName = "id")
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private Priority priority;
    @JoinColumn(name = "current_status", referencedColumnName = "id")
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private Statuses currentStatus;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "report", fetch = FetchType.LAZY)
    private List<ImageAttachments> imageAttachmentsList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "report", fetch = FetchType.LAZY)
    private List<ReportProgresses> reportProgressesList;

    public Reports() {
    }

    public Reports(Integer id) {
        this.id = id;
    }

    public Reports(Integer id, Date date, String originator, String description) {
        this.id = id;
        this.date = date;
        this.originator = originator;
        this.description = description;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getOriginator() {
        return originator;
    }

    public void setOriginator(String originator) {
        this.originator = originator;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Rooms getRoom() {
        return room;
    }

    public void setRoom(Rooms room) {
        this.room = room;
    }

    public Priority getPriority() {
        return priority;
    }

    public void setPriority(Priority priority) {
        this.priority = priority;
    }

    public Statuses getCurrentStatus() {
        return currentStatus;
    }

    public void setCurrentStatus(Statuses currentStatus) {
        this.currentStatus = currentStatus;
    }

    @XmlTransient
    public List<ImageAttachments> getImageAttachmentsList() {
        return imageAttachmentsList;
    }

    public void setImageAttachmentsList(List<ImageAttachments> imageAttachmentsList) {
        this.imageAttachmentsList = imageAttachmentsList;
    }

    @XmlTransient
    public List<ReportProgresses> getReportProgressesList() {
        return reportProgressesList;
    }

    public void setReportProgressesList(List<ReportProgresses> reportProgressesList) {
        this.reportProgressesList = reportProgressesList;
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
        if (!(object instanceof Reports)) {
            return false;
        }
        Reports other = (Reports) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.ksm.hazardreportapp.entities.Reports[ id=" + id + " ]";
    }
    
}
