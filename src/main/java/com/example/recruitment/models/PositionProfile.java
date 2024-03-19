package com.example.recruitment.models;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "PositionProfile")
public class PositionProfile {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Id;
    @Column(name = "title")
    private String title;
    @Column(name = "Description", columnDefinition = "text")
    private String Description;
    @Column(name = "Wage")
    private int Wage;
    @Column(name = "Schedule")
    private String Schedule;
    @Column(name = "Requirements", columnDefinition = "text")
    private String Requirements;
    @Column(name = "Experience")
    private String Experience;
    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "positionProfile")
    private List<Image> images = new ArrayList<>();
    @ManyToOne(cascade = CascadeType.REFRESH, fetch = FetchType.LAZY)
    @JoinColumn
    private User user;
    private Long previewImageId;
    private LocalDateTime dateOfCreated;

    public PositionProfile() {
    }

    @PrePersist
    private void init() {
        dateOfCreated = LocalDateTime.now();
    }

    public void addImageToPositionProfile(Image image) {
        image.setPositionProfile(this);
        images.add(image);
    }

    public Long getId() {
        return this.Id;
    }

    public String getTitle() {
        return this.title;
    }

    public String getDescription() {
        return this.Description;
    }

    public int getWage() {
        return this.Wage;
    }

    public String getSchedule() {
        return this.Schedule;
    }

    public String getRequirements() {
        return this.Requirements;
    }

    public String getExperience() {
        return this.Experience;
    }

    public List<Image> getImages() {
        return this.images;
    }

    public User getUser() {
        return this.user;
    }

    public Long getPreviewImageId() {
        return this.previewImageId;
    }

    public LocalDateTime getDateOfCreated() {
        return this.dateOfCreated;
    }

    public void setId(Long Id) {
        this.Id = Id;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }

    public void setWage(int Wage) {
        this.Wage = Wage;
    }

    public void setSchedule(String Schedule) {
        this.Schedule = Schedule;
    }

    public void setRequirements(String Requirements) {
        this.Requirements = Requirements;
    }

    public void setExperience(String Experience) {
        this.Experience = Experience;
    }

    public void setImages(List<Image> images) {
        this.images = images;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public void setPreviewImageId(Long previewImageId) {
        this.previewImageId = previewImageId;
    }

    public void setDateOfCreated(LocalDateTime dateOfCreated) {
        this.dateOfCreated = dateOfCreated;
    }

    public boolean equals(final Object o) {
        if (o == this) return true;
        if (!(o instanceof PositionProfile)) return false;
        final PositionProfile other = (PositionProfile) o;
        if (!other.canEqual((Object) this)) return false;
        final Object this$Id = this.getId();
        final Object other$Id = other.getId();
        if (this$Id == null ? other$Id != null : !this$Id.equals(other$Id)) return false;
        final Object this$title = this.getTitle();
        final Object other$title = other.getTitle();
        if (this$title == null ? other$title != null : !this$title.equals(other$title)) return false;
        final Object this$Description = this.getDescription();
        final Object other$Description = other.getDescription();
        if (this$Description == null ? other$Description != null : !this$Description.equals(other$Description))
            return false;
        if (this.getWage() != other.getWage()) return false;
        final Object this$Schedule = this.getSchedule();
        final Object other$Schedule = other.getSchedule();
        if (this$Schedule == null ? other$Schedule != null : !this$Schedule.equals(other$Schedule)) return false;
        final Object this$Requirements = this.getRequirements();
        final Object other$Requirements = other.getRequirements();
        if (this$Requirements == null ? other$Requirements != null : !this$Requirements.equals(other$Requirements))
            return false;
        final Object this$Experience = this.getExperience();
        final Object other$Experience = other.getExperience();
        if (this$Experience == null ? other$Experience != null : !this$Experience.equals(other$Experience))
            return false;
        final Object this$images = this.getImages();
        final Object other$images = other.getImages();
        if (this$images == null ? other$images != null : !this$images.equals(other$images)) return false;
        final Object this$user = this.getUser();
        final Object other$user = other.getUser();
        if (this$user == null ? other$user != null : !this$user.equals(other$user)) return false;
        final Object this$previewImageId = this.getPreviewImageId();
        final Object other$previewImageId = other.getPreviewImageId();
        if (this$previewImageId == null ? other$previewImageId != null : !this$previewImageId.equals(other$previewImageId))
            return false;
        final Object this$dateOfCreated = this.getDateOfCreated();
        final Object other$dateOfCreated = other.getDateOfCreated();
        if (this$dateOfCreated == null ? other$dateOfCreated != null : !this$dateOfCreated.equals(other$dateOfCreated))
            return false;
        return true;
    }

    protected boolean canEqual(final Object other) {
        return other instanceof PositionProfile;
    }

    public int hashCode() {
        final int PRIME = 59;
        int result = 1;
        final Object $Id = this.getId();
        result = result * PRIME + ($Id == null ? 43 : $Id.hashCode());
        final Object $title = this.getTitle();
        result = result * PRIME + ($title == null ? 43 : $title.hashCode());
        final Object $Description = this.getDescription();
        result = result * PRIME + ($Description == null ? 43 : $Description.hashCode());
        result = result * PRIME + this.getWage();
        final Object $Schedule = this.getSchedule();
        result = result * PRIME + ($Schedule == null ? 43 : $Schedule.hashCode());
        final Object $Requirements = this.getRequirements();
        result = result * PRIME + ($Requirements == null ? 43 : $Requirements.hashCode());
        final Object $Experience = this.getExperience();
        result = result * PRIME + ($Experience == null ? 43 : $Experience.hashCode());
        final Object $images = this.getImages();
        result = result * PRIME + ($images == null ? 43 : $images.hashCode());
        final Object $user = this.getUser();
        result = result * PRIME + ($user == null ? 43 : $user.hashCode());
        final Object $previewImageId = this.getPreviewImageId();
        result = result * PRIME + ($previewImageId == null ? 43 : $previewImageId.hashCode());
        final Object $dateOfCreated = this.getDateOfCreated();
        result = result * PRIME + ($dateOfCreated == null ? 43 : $dateOfCreated.hashCode());
        return result;
    }

    public String toString() {
        return "PositionProfile(Id=" + this.getId() + ", title=" + this.getTitle() + ", Description=" + this.getDescription() + ", Wage=" + this.getWage() + ", Schedule=" + this.getSchedule() + ", Requirements=" + this.getRequirements() + ", Experience=" + this.getExperience() + ", images=" + this.getImages() + ", user=" + this.getUser() + ", previewImageId=" + this.getPreviewImageId() + ", dateOfCreated=" + this.getDateOfCreated() + ")";
    }
}
