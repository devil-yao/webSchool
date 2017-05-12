package com.dwh.tech.entity;

public class Question {

	private Integer id;
	private String title;
	private String choiceA;
	private String choiceB;
	private String choiceC;
	private String choiceD;
	private String answer;
	private Integer typeId;
	
	public Integer getTypeId() {
		return typeId;
	}
	public void setTypeId(Integer typeId) {
		this.typeId = typeId;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getChoiceA() {
		return choiceA;
	}
	public void setChoiceA(String choiceA) {
		this.choiceA = choiceA;
	}
	public String getChoiceB() {
		return choiceB;
	}
	public void setChoiceB(String choiceB) {
		this.choiceB = choiceB;
	}
	public String getChoiceC() {
		return choiceC;
	}
	public void setChoiceC(String choiceC) {
		this.choiceC = choiceC;
	}
	public String getChoiceD() {
		return choiceD;
	}
	public void setChoiceD(String choiceD) {
		this.choiceD = choiceD;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	@Override
	public String toString() {
		return "Question [id=" + id + ", title=" + title + ", choiceA=" + choiceA + ", choiceB=" + choiceB
				+ ", choiceC=" + choiceC + ", choiceD=" + choiceD + ", answer=" + answer + ", typeId=" + typeId + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((answer == null) ? 0 : answer.hashCode());
		result = prime * result + ((choiceA == null) ? 0 : choiceA.hashCode());
		result = prime * result + ((choiceB == null) ? 0 : choiceB.hashCode());
		result = prime * result + ((choiceC == null) ? 0 : choiceC.hashCode());
		result = prime * result + ((choiceD == null) ? 0 : choiceD.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((title == null) ? 0 : title.hashCode());
		result = prime * result + ((typeId == null) ? 0 : typeId.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Question other = (Question) obj;
		if (answer == null) {
			if (other.answer != null)
				return false;
		} else if (!answer.equals(other.answer))
			return false;
		if (choiceA == null) {
			if (other.choiceA != null)
				return false;
		} else if (!choiceA.equals(other.choiceA))
			return false;
		if (choiceB == null) {
			if (other.choiceB != null)
				return false;
		} else if (!choiceB.equals(other.choiceB))
			return false;
		if (choiceC == null) {
			if (other.choiceC != null)
				return false;
		} else if (!choiceC.equals(other.choiceC))
			return false;
		if (choiceD == null) {
			if (other.choiceD != null)
				return false;
		} else if (!choiceD.equals(other.choiceD))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (title == null) {
			if (other.title != null)
				return false;
		} else if (!title.equals(other.title))
			return false;
		if (typeId == null) {
			if (other.typeId != null)
				return false;
		} else if (!typeId.equals(other.typeId))
			return false;
		return true;
	}
	
}
