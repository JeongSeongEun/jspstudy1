package chap7;
/*
Bean≈¨∑°Ω∫
getProperty
	getAbc(): "abc"
setProperty
	setAbc(object): "abc"
*/
public class Book {
	private String name;
	private String title;
	private String content;
	public String getName() { //getProperty: name
		return name;
	}
	public void setName(String name) { //setProperty: name
		this.name = name;
	}
	public String getTitle() { ////getProperty: title
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Override
	public String toString() {
		return "Book [name=" + name + ", title=" + title + ", content=" + content + "]";
	}
	
}
