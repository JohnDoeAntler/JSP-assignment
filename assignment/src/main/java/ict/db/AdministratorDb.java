package ict.db;

/**
 * AdministratorDb
 */
public class AdministratorDb extends UserDb {

	public AdministratorDb(
		String url,
		String username,
		String password
	) {
		super(url, username, password, "administrator");
	}

}