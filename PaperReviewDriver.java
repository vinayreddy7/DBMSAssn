package com.paperreview;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class PaperReviewDriver {

	public static void main(String[] args) {
		Connection conn = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");

			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/CONFERENCE_REVIEW", "root", "2705");

			getPapAuthDetByAutId("Nani@gmail.com", conn);

			getRevDetForRecomToPub(conn);

			getCntOfSubPaper(conn);

			addNewPapSub(conn, "vinay@gmail.com", "Vinay", "Kasam", "Spring Boot",
					"Spring Boot is an open source Java-based framework used to create a micro Service", "boot_vinay");

			delAuthTableFirstRow(conn);
		} catch (SQLException se) {
			System.out.println(se.getMessage());
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (conn != null)
					conn.close();
			} catch (SQLException se) {
				System.out.println(se.getMessage());
			}
		}

	}

	public static void getPapAuthDetByAutId(String key, Connection conn) {
		Statement stmt = null;
		try {
			stmt = conn.createStatement();
			String sql;
			sql = "select p.paper_id, p.title, p.abstract, a.author_email, a.firstName, a.lastName from Paper p inner join author a on p.author_email=a.author_email where a.author_email='"
					+ key + "';";
			ResultSet rs = stmt.executeQuery(sql);

			while (rs.next()) {
				int paperId = rs.getInt("paper_id");
				String title = rs.getString("title");
				String abstract1 = rs.getString("abstract");
				String authorEmail = rs.getString("author_email");
				String firstName = rs.getString("firstName");
				String lastName = rs.getString("lastName");

				System.out.print("Paper ID: " + paperId);
				System.out.print(",Title: " + title);
				System.out.print(",Abstract: " + abstract1);
				System.out.println(",Author Email: " + authorEmail);
				System.out.print(",First Name: " + firstName);
				System.out.print(",Last Name: " + lastName);
			}
			rs.close();
			stmt.close();
		} catch (SQLException se) {
			System.out.println(se.getMessage());
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (stmt != null)
					stmt.close();
			} catch (SQLException se2) {
				System.out.println(se2.getMessage());
			}
		}
	}

	public static void getRevDetForRecomToPub(Connection conn) {
		Statement stmt = null;
		try {
			stmt = conn.createStatement();
			String sql = "select r.* from review r inner join paper p on p.paper_id=r.paper_id where r.recommendation is NOT NULL;";
			ResultSet rs = stmt.executeQuery(sql);

			while (rs.next()) {
				int reviewId = rs.getInt("review_id");
				String reviewerEmail = rs.getString("reviewer_email");
				String recommendation = rs.getString("recommendation");
				String meritscore = rs.getString("meritscore");
				String readabilityscore = rs.getString("readabilityscore");
				String originalityscore = rs.getString("originalityscore");
				String relevancescore = rs.getString("relevancescore");
				int paperId = rs.getInt("paper_id");

				System.out.print("ReviewID: " + reviewId);
				System.out.print(",ReviewerEmail: " + reviewerEmail);
				System.out.print(",Recommendation: " + recommendation);
				System.out.println(",Merit Score: " + meritscore);
				System.out.print(",Readability Score: " + readabilityscore);
				System.out.print(",Originality Score: " + originalityscore);
				System.out.print(",Relevance Score: " + relevancescore);
				System.out.print(",Paper Id: " + paperId);
			}
			rs.close();
			stmt.close();
		} catch (SQLException se) {
			System.out.println(se.getMessage());
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (stmt != null)
					stmt.close();
			} catch (SQLException se2) {
				System.out.println(se2.getMessage());
			}
		}
	}

	public static void getCntOfSubPaper(Connection conn) {
		Statement stmt = null;
		try {
			stmt = conn.createStatement();
			String sql;
			sql = "select count(*) as count from review;";
			ResultSet rs = stmt.executeQuery(sql);

			while (rs.next()) {
				int count = rs.getInt("count");

				System.out.print("Count of All Papers Submitted: " + count);
			}
			rs.close();
			stmt.close();
		} catch (SQLException se) {
			System.out.println(se.getMessage());
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (stmt != null)
					stmt.close();
			} catch (SQLException se2) {
				System.out.println(se2.getMessage());
			}
		}
	}

	public static void addNewPapSub(Connection conn, String authorEmail, String firstName, String lastName,
			String title, String abstract1, String filename) {
		Statement stmt = null;
		try {
			stmt = conn.createStatement();

			String authorSql = "INSERT INTO AUTHOR VALUES ('" + authorEmail + "', '" + firstName + "','" + lastName
					+ "');";
			System.out.println("Author Query: " + authorSql);
			int status = stmt.executeUpdate(authorSql);
			if (status > 0)
				System.out.print("Successfully registered an author");

			String paperSql = "INSERT INTO PAPER VALUES (NULL, '" + authorEmail + "', '" + title + "','" + abstract1
					+ "', '" + filename + "');";
			status = stmt.executeUpdate(paperSql);
			if (status > 0)
				System.out.print("Successfully submitted a paper");
		} catch (SQLException se) {
			System.out.println(se.getMessage());
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (stmt != null)
					stmt.close();
			} catch (SQLException se2) {
				System.out.println(se2.getMessage());
			}
		}
	}

	public static void delAuthTableFirstRow(Connection conn) {
		Statement stmt = null;
		try {
			stmt = conn.createStatement();

			String authorSql = "DELETE FROM author LIMIT 1;";
			int status = stmt.executeUpdate(authorSql);

			if (status > 0)
				System.out.print("Successfully deleted first row of table author");

		} catch (SQLException se) {
			System.out.println(se.getMessage());
			System.out.println(
					"First Author cannot be deleted since there is already a paper row assigned to this author");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (stmt != null)
					stmt.close();
			} catch (SQLException se2) {
				System.out.println(se2.getMessage());
			}
		}
	}
}