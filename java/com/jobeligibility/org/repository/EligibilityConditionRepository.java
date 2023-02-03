package com.jobeligibility.org.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.jobeligibility.org.db.DatabaseConnector;
import com.jobeligibility.org.model.EligibilityCondition;
import com.jobeligibility.org.model.Employee;

public class EligibilityConditionRepository {
	
	
	public List<EligibilityCondition> getEligibilitycriteria(String jobpost) throws SQLException {
		List<EligibilityCondition> conditions = new ArrayList<EligibilityCondition>(); 
		PreparedStatement ps = null;
		PreparedStatement ps1 = null;
		Connection con = null;
		
		try {
			con = DatabaseConnector.getInstance().getConnection();
			ps1 = con.prepareStatement("select id from jobtype where JobType = ?");
			ps1.setString(1, jobpost);
			ResultSet rs1 = ps1.executeQuery();
			rs1.next();
			int id = rs1.getInt(1);
			
			ps = con.prepareStatement("select sno, field, Operator, Value from eligibilityconditions where id = ?");
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				EligibilityCondition elibiglityCondition = new EligibilityCondition();
				elibiglityCondition.setSno(rs.getInt(1));
				elibiglityCondition.setField(rs.getString(2));
				elibiglityCondition.setOperator(rs.getString(3));
				elibiglityCondition.setValue(rs.getString(4));
				conditions.add(elibiglityCondition);
			}
		}

		catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (ps != null) {
				ps.close();
			}
			if (con != null) {
				con.close();
			}
		}
		return conditions;
	}
}
