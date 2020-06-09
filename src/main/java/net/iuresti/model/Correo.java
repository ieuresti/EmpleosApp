package net.iuresti.model;

public class Correo {
	
	// Direccón de Email Destino (to)
	private String para;
	
	// Direccón de Email Origen (from)
	private String de;
	
	// El asunto del mensaje (subject)
	private String asunto; 
	
	// El cuerpo del correo (text)
	private String texto;

	public String getPara() {
		return para;
	}

	public void setPara(String para) {
		this.para = para;
	}

	public String getDe() {
		return de;
	}

	public void setDe(String de) {
		this.de = de;
	}

	public String getAsunto() {
		return asunto;
	}

	public void setAsunto(String asunto) {
		this.asunto = asunto;
	}

	public String getTexto() {
		return texto;
	}

	public void setTexto(String texto) {
		this.texto = texto;
	}

	@Override
	public String toString() {
		return "Correo [para=" + para + ", de=" + de + ", asunto=" + asunto + ", texto=" + texto + "]";
	}

}
