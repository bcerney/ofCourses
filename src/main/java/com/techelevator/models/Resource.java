package com.techelevator.models;

public class Resource {
	private long resourceId;
	private String url;
	private String description;
	private String title;
	private long lessonId;
	
	public Resource() {
		
	}

	public Resource(String url, String description, String title, long lessonId) {
		this.url = url;
		this.description = description;
		this.title = title;
		this.lessonId = lessonId;
	}

	public long getResourceId() {
		return resourceId;
	}
	public void setResourceId(long resourceId) {
		this.resourceId = resourceId;
	}
	public String getUrl() {
		return url;
	}
	public String getEmbeddedUrl() {
		String embeddedUrl = "#";
		if(url.contains("youtube") && !url.contains("embed")) {
			embeddedUrl = url.replace("watch?v=", "embed/");
		}
		return embeddedUrl;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public long getLessonId() {
		return lessonId;
	}
	public void setLessonId(long lessonId) {
		this.lessonId = lessonId;
	}
}
