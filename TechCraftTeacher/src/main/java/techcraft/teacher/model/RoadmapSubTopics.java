package techcraft.teacher.model; 

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id; 

@Entity
public class RoadmapSubTopics {
	
	@Id
	private int subTopicId;
	
	@Column(length = 50)
	private String topic;
	
	@Column(length = 50)
	private String subTopic;

	@Column(length = 500)
	private String description;
	
	@Column(length = 50)
	private String resource;

	public RoadmapSubTopics() {
		super();
		// TODO Auto-generated constructor stub
	}

	public RoadmapSubTopics(String topic, String subTopic, String description, String resource) {
		super();
		this.topic = topic;
		this.subTopic = subTopic;
		this.description = description;
		this.resource = resource;
	}

	public int getSubTopicId() {
		return subTopicId;
	}

	public void setSubTopicId(int subTopicId) {
		this.subTopicId = subTopicId;
	}

	public String getTopic() {
		return topic;
	}

	public void setTopic(String topic) {
		this.topic = topic;
	}

	public String getSubTopic() {
		return subTopic;
	}

	public void setSubTopic(String subTopic) {
		this.subTopic = subTopic;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getResource() {
		return resource;
	}

	public void setResource(String resource) {
		this.resource = resource;
	}

	
}
