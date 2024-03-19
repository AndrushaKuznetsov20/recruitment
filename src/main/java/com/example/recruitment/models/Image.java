package com.example.recruitment.models;

import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "Images")
@Data
public class Image {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long Id;
    @Column(name = "Name")
    private String Name;
    @Column(name = "OriginalFileName")
    private String OriginalFileName;
    @Column(name = "Size")
    private Long Size;
    @Column(name = "ContentType")
    private String ContentType;
    @Column(name = "isPreviewImage")
    private boolean isPreviewImage;
    @Lob
    private byte[] Bytes;
    @ManyToOne(cascade = CascadeType.REFRESH, fetch = FetchType.EAGER)
    private PositionProfile positionProfile;
}
