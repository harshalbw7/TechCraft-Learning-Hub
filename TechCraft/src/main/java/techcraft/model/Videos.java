package techcraft.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Videos {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int videoId;
	
	@Column(length = 30)
	private String technology;

	@Column(length = 200)
	private String topic;
	
	@Column(length = 15)
	private String resource;
	 
	public Videos() {
		super(); 
	}

	public Videos(String technology, String topic, String resource) {
		super();
		this.technology = technology;
		this.topic = topic;
		this.resource = resource;
	}

	public int getVideoId() {
		return videoId;
	}

	public void setVideoId(int videoId) {
		this.videoId = videoId;
	}

	public String getTechnology() {
		return technology;
	}

	public void setTechnology(String technology) {
		this.technology = technology;
	}

	public String getTopic() {
		return topic;
	}

	public void setTopic(String topic) {
		this.topic = topic;
	}

	public String getResource() {
		return resource;
	}

	public void setResource(String resource) {
		this.resource = resource;
	}	
	
}
