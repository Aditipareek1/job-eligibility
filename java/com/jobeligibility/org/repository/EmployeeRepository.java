package com.jobeligibility.org.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.jobeligibility.org.db.DatabaseConnector;
import com.jobeligibility.org.model.Employee;

public class EmployeeRepository {
	public void saveEmployee(Employee emp) throws SQLException {
		PreparedStatement ps = null;
		Connection con = null;
		try {

			con = DatabaseConnector.getInstance().getConnection();
			ps = con.prepareStatement(
					"insert into form(Name,gender, age, phone, email, country, qualification, workplace, minsalary, jobtype, experience, skills, technicalskills)values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
			ps.setString(1, emp.getName());
			ps.setString(2, emp.getGender());
			ps.setInt(3, emp.getAge());
			ps.setString(4, emp.getPhone());
			ps.setString(5, emp.getEmail());
			ps.setString(6, emp.getCountry());
			ps.setString(7, emp.getQualification());
			ps.setString(8, emp.getWorkplace());
			ps.setInt(9, emp.getMinsalary());
			ps.setString(10, emp.getJobtype());
			ps.setInt(11, emp.getExperience());
			ps.setString(12, emp.getSkills());
			ps.setString(13, emp.getTechnicalskills());
			ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (ps != null) {
				ps.close();
			}
			if (con != null) {
				con.close();
			}
		}

	}

	public Employee getEmployeeByName(String name) throws SQLException {
		PreparedStatement ps = null;
		Connection con = null;
		Employee em = new Employee();
		try {
			con = DatabaseConnector.getInstance().getConnection();
			ps = con.prepareStatement("select *from form where Name =?");
			ps.setString(1, name);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				em.setName(rs.getString(2));
				em.setGender(rs.getString(3));
				em.setAge(rs.getInt(4));
				em.setPhone(rs.getString(5));
				em.setEmail(rs.getString(6));
				em.setCountry(rs.getString(7));
				em.setQualification(rs.getString(8));
				em.setWorkplace(rs.getString(9));
				em.setMinsalary(rs.getInt(10));
				em.setJobtype(rs.getString(11));
				em.setExperience(rs.getInt(12));
				em.setSkills(rs.getString(13));
				em.setTechnicalskills(rs.getString(14));
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
		return em;
	}
}
