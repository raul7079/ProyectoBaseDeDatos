package objetoscrm;

public class Grupos {

	private String idGrupo;
	private int idTutor;
	private String etapa;

	public Grupos(String idGrupo, int idTutor, String etapa) {
		super();
		this.idGrupo = idGrupo;
		this.idTutor = idTutor;
		this.etapa = etapa;
	}

	public Grupos(String idg, String idt, String etp) {
		super();
		int idtnum=0;
		try {
			idtnum=Integer.parseInt(idt);
		} catch (Exception e) { idtnum=-1; }
		this.idGrupo = idg;
		this.idTutor = idtnum;
		this.etapa = etp;
	}

	public String getIdGrupo() {
		return idGrupo;
	}

	public void setIdGrupo(String idGrupo) {
		this.idGrupo = idGrupo;
	}

	public int getIdTutor() {
		return idTutor;
	}

	public void setIdTutor(int idTutor) {
		this.idTutor = idTutor;
	}

	public String getetapa() {
		return etapa;
	}

	public void setetapa(String etapa) {
		this.etapa = etapa;
	}
	
}

