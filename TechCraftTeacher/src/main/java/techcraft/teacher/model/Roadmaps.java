package techcraft.teacher.model; 

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id; 

@Entity
public class Roadmaps {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int roadmapId;
	
	@Column(length = 20)
	private String technology;
	
	@Column(length = 200)
	private String description;
	
	@Column(length = 50)
	private String topic;
	
	@Column(length = 10)
	private String duration;
	
	public Roadmaps() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Roadmaps(String technology, String description, String topic, String duration) {
		super();
		this.technology = technology;
		this.description = description;
		this.topic = topic;
		this.duration = duration;
	}

	public int getRoadmapId() {
		return roadmapId;
	}

	public void setRoadmapId(int roadmapId) {
		this.roadmapId = roadmapId;
	}

	public String getTechnology() {
		return technology;
	}

	public void setTechnology(String technology) {
		this.technology = technology;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getTopic() {
		return topic;
	}

	public void setTopic(String topic) {
		this.topic = topic;
	}

	public String getDuration() {
		return duration;
	}

	public void setDuration(String duration) {
		this.duration = duration;
	}

}
