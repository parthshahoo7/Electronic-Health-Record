using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Db
/// </summary>
public static class Db
{
    static SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["EHRConnectionString"].ConnectionString);
    public static DataTable LoadDoctors()
    {
        SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM [doctor_signup_table] ORDER BY fname",conn);
        DataTable dt = new DataTable();
        da.Fill(dt);

        return dt;
    }

    public static DataRow LoadDoctor(int id)
    {
        SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM [doctor_signup_table] WHERE [d_id] = @id",conn);
        da.SelectCommand.Parameters.AddWithValue("id", id);

        DataTable dt = new DataTable();
        da.Fill(dt);

        if (dt.Rows.Count > 0)
        {
            return dt.Rows[0];
        }
        return null;

    }

    public static DataRow LoadAppointment(int id)
    {
        SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM [appointment_table] WHERE [app_id] = @id",conn);
        da.SelectCommand.Parameters.AddWithValue("id", id);

        DataTable dt = new DataTable();
        da.Fill(dt);

        if (dt.Rows.Count > 0)
        {
            return dt.Rows[0];
        }
        return null;

    }


    public static DataTable LoadAppointmentsForDoctor(int id, DateTime start, DateTime end)
    {
        SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM [appointment_table] WHERE [d_id] = @doctor AND NOT (([AppointmentEnd] <= @start) OR ([AppointmentStart] >= @end))", conn);
        da.SelectCommand.Parameters.AddWithValue("doctor", id);
        da.SelectCommand.Parameters.AddWithValue("start", start);
        da.SelectCommand.Parameters.AddWithValue("end", end);
        DataTable dt = new DataTable();
        da.Fill(dt);

        return dt;
    }

    public static DataTable LoadAppointments(DateTime start, DateTime end)
    {
        SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM [appointment_table] WHERE NOT (([AppointmentEnd] <= @start) OR ([AppointmentStart] >= @end))", conn);
        da.SelectCommand.Parameters.AddWithValue("start", start);
        da.SelectCommand.Parameters.AddWithValue("end", end);
        DataTable dt = new DataTable();
        da.Fill(dt);

        return dt;

    }

    public static DataTable LoadFreeAndMyAppointments(DateTime start, DateTime end, string sessionId)
    {
        SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM [appointment_table] WHERE ([AppointmentStatus] = 'free' OR ([AppointmentStatus] <> 'free' AND [AppointmentPatientSession] = @session)) AND NOT (([AppointmentEnd] <= @start) OR ([AppointmentStart] >= @end))", conn);
        da.SelectCommand.Parameters.AddWithValue("session", sessionId);
        da.SelectCommand.Parameters.AddWithValue("start", start);
        da.SelectCommand.Parameters.AddWithValue("end", end);
        DataTable dt = new DataTable();
        da.Fill(dt);

        return dt;

    }


    public static void CreateAppointment(int doctor, DateTime start, DateTime end)
    {        
            conn.Open();
            SqlCommand cmd = new SqlCommand("INSERT INTO [appointment_table] ([AppointmentStart], [AppointmentEnd], [d_id]) VALUES(@start, @end, @doctor)", conn);
            cmd.Parameters.AddWithValue("start", start);
            cmd.Parameters.AddWithValue("end", end);
            cmd.Parameters.AddWithValue("doctor", doctor);
            cmd.ExecuteNonQuery();

            /*
            cmd = new SqlCommand("select @@identity;", con);
            int id = Convert.ToInt32(cmd.ExecuteScalar());
            return id;
             */
            conn.Close();
        
    }

    public static void DeleteAppointmentsFree(DateTime start, DateTime end)
    {
        
            conn.Open();
            SqlCommand cmd = new SqlCommand("DELETE FROM [appointment_table] WHERE [AppointmentStatus] = 'free' AND NOT (([AppointmentEnd] <= @start) OR ([AppointmentStart] >= @end))", conn);
            cmd.Parameters.AddWithValue("start", start);
            cmd.Parameters.AddWithValue("end", end);
            cmd.ExecuteNonQuery();
            conn.Close();
        
    }

    public static void DeleteAppointmentIfFree(int id)
    {
        
            conn.Open();
            SqlCommand cmd = new SqlCommand("DELETE FROM [appointment_table] WHERE [app_id] = @id AND [AppointmentStatus] = 'free'", conn);
            cmd.Parameters.AddWithValue("id", id);
            cmd.ExecuteNonQuery();
            conn.Close();   
    }

    public static DataRow LoadFirstDoctor()
    {
        SqlDataAdapter da = new SqlDataAdapter("SELECT top 1 * FROM [doctor_signup_table] ORDER BY fname", conn);

        DataTable dt = new DataTable();
        da.Fill(dt);

        if (dt.Rows.Count > 0)
        {
            return dt.Rows[0];
        }
        return null;
    }

    public static void UpdateAppointment(int id, DateTime start, DateTime end, string name, int doctor, string status)
    {
        
            conn.Open();
            SqlCommand cmd = new SqlCommand("UPDATE [appointment_table] SET [AppointmentStart] = @start, [AppointmentEnd] = @end, [AppointmentPatientName] = @name, [AppointmentStatus] = @status WHERE [app_id] = @id", conn);
            cmd.Parameters.AddWithValue("start", start);
            cmd.Parameters.AddWithValue("end", end);
            cmd.Parameters.AddWithValue("name", name);
            cmd.Parameters.AddWithValue("status", status);
            cmd.Parameters.AddWithValue("id", id);
            cmd.ExecuteNonQuery();
            conn.Close();

    }

    public static void DeleteAppointment(int id)
    {
       
            conn.Open();
            SqlCommand cmd = new SqlCommand("DELETE FROM [appointment_table] WHERE [app_id] = @id", conn);
            cmd.Parameters.AddWithValue("id", id);
            cmd.ExecuteNonQuery();
            conn.Close();

    }

    public static void RequestAppointment(int id, string name, string sessionId)
    {
            conn.Open();
            SqlCommand cmd = new SqlCommand("UPDATE [appointment_table] SET [AppointmentPatientName] = @name, [AppointmentStatus] = @status, [AppointmentPatientSession] = @session WHERE [app_id] = @id", conn);
            cmd.Parameters.AddWithValue("name", name);
            cmd.Parameters.AddWithValue("status", "waiting");
            cmd.Parameters.AddWithValue("session", sessionId);
            cmd.Parameters.AddWithValue("id", id);
            cmd.ExecuteNonQuery();
            conn.Close();

    }

    public static void MoveAppointment(string id, DateTime start, DateTime end)
    {
        
            conn.Open();
            SqlCommand cmd = new SqlCommand("UPDATE [appointment_table] SET [AppointmentStart] = @start, [AppointmentEnd] = @end WHERE [app_id] = @id", conn);
            cmd.Parameters.AddWithValue("start", start);
            cmd.Parameters.AddWithValue("end", end);
            cmd.Parameters.AddWithValue("id", id);
            cmd.ExecuteNonQuery();
            conn.Close();

    }
}