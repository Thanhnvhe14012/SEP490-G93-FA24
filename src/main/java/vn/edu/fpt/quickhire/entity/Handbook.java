package vn.edu.fpt.quickhire.entity;

import jakarta.persistence.*;
import lombok.Data;

import java.util.Date;

@Entity
@Table(name = "handbook")
@Data
public class Handbook {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    // Mapping thông tin biến với tên cột trong Database
    @Column(name = "title")
    private String title;

    @Column(name = "content")
    private String content;

    @Column(name = "imageUrl")
    private String imageUrl;

    @Column(name = "createdAt")
    private Date createdAt;

}
