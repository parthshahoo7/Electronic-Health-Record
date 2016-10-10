using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DayPilot.Web.Ui.Events;
using DayPilot.Web.Ui.Events.Calendar;
using BeforeCellRenderEventArgs = DayPilot.Web.Ui.Events.Navigator.BeforeCellRenderEventArgs;
using CommandEventArgs = DayPilot.Web.Ui.Events.CommandEventArgs;



namespace Electronic_Health_Record.Appointment
{
    public partial class Doctor : System.Web.UI.Page
    {
        private DataTable _appointments;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                if (String.IsNullOrEmpty(Request.QueryString["id"]))
                {
                    //Schedule.Visible = false;
                    //return;
                    DataRow first = Db.LoadFirstDoctor();
                    if (first != null)
                    {
                        Response.Redirect("~/Appointment/Doctor.aspx?id=" + first["d_id"], true);
                        return;
                    }
                }

                int id = Convert.ToInt32(Request.QueryString["id"]);  // basic validation
                DropDownListDoctor.SelectedValue = id.ToString();

                DataRow doctor = Db.LoadDoctor(id);
                if (doctor == null)
                {
                    Schedule.Visible = false;
                    return;
                }

                DropDownListDoctor.AppendDataBoundItems = false;

                LoadDoctors();
                LoadNavigatorData();
                LoadCalendarData();
            }
        }
        private void LoadDoctors()
        {
            DropDownListDoctor.DataSource = Db.LoadDoctors();
            DropDownListDoctor.DataTextField = "fname";
            DropDownListDoctor.DataValueField = "d_id";
            DropDownListDoctor.DataBind();
        }

        private void LoadNavigatorData()
        {
            if (_appointments == null)
            {
                LoadAppointments();
            }

            DayPilotNavigator1.DataSource = _appointments;
            DayPilotNavigator1.DataStartField = "AppointmentStart";
            DayPilotNavigator1.DataEndField = "AppointmentEnd";
            DayPilotNavigator1.DataIdField = "app_id";
            DayPilotNavigator1.DataBind();
        }

        private void LoadCalendarData()
        {
            if (_appointments == null)
            {
                LoadAppointments();
            }

            DayPilotCalendar1.DataSource = _appointments;
            DayPilotCalendar1.DataStartField = "AppointmentStart";
            DayPilotCalendar1.DataEndField = "AppointmentEnd";
            DayPilotCalendar1.DataIdField = "app_id";
            DayPilotCalendar1.DataTextField = "p_id";
            DayPilotCalendar1.DataTagFields = "AppointmentStatus";
            DayPilotCalendar1.DataBind();
            DayPilotCalendar1.Update();
        }

        private void LoadAppointments()
        {
            int id = Convert.ToInt32(Request.QueryString["id"]);  // basic validation
            _appointments = Db.LoadAppointmentsForDoctor(id, DayPilotNavigator1.VisibleStart, DayPilotNavigator1.VisibleEnd);
        }

        protected void DayPilotCalendar1_OnCommand(object sender, CommandEventArgs e)
        {
            switch (e.Command)
            {
                case "navigate":
                    DayPilotCalendar1.StartDate = (DateTime)e.Data["day"];
                    LoadCalendarData();
                    break;
                case "refresh":
                    LoadCalendarData();
                    break;
            }
        }

        protected void DayPilotNavigator1_OnBeforeCellRender(object sender, BeforeCellRenderEventArgs e)
        {
        }

        protected void DropDownListDoctor_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            string selected = DropDownListDoctor.SelectedValue;
            if (selected == "NONE")
            {
                Response.Redirect("~/Appointment/Doctor.aspx", true);
                return;
            }

            Response.Redirect("~/Appointment/Doctor.aspx?id=" + selected, true);
        }

        protected void DayPilotCalendar1_OnTimeRangeSelected(object sender, TimeRangeSelectedEventArgs e)
        {
            int doctor = Convert.ToInt32(Request.QueryString["id"]);

            Db.CreateAppointment(doctor, e.Start, e.End);

            LoadCalendarData();

        }

        protected void DayPilotCalendar1_OnBeforeEventRender(object sender, BeforeEventRenderEventArgs e)
        {
            string status = e.Tag["AppointmentStatus"];
            switch (status)
            {
                case "free":
                    e.DurationBarColor = "green";
                    break;
                case "waiting":
                    e.DurationBarColor = "orange";
                    break;
                case "confirmed":
                    e.DurationBarColor = "#f41616";  // red            
                    break;
            }
        }

        protected void DayPilotCalendar1_OnEventMove(object sender, EventMoveEventArgs e)
        {
            Db.MoveAppointment(e.Id, e.NewStart, e.NewEnd);
            LoadCalendarData();
        }

        protected void DayPilotCalendar1_OnEventResize(object sender, EventResizeEventArgs e)
        {
            Db.MoveAppointment(e.Id, e.NewStart, e.NewEnd);
            LoadCalendarData();
        }
    }
}