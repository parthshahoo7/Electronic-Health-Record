using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DayPilot.Web.Ui.Events.Calendar;
using System.Data;
using BeforeCellRenderEventArgs = DayPilot.Web.Ui.Events.Navigator.BeforeCellRenderEventArgs;
using CommandEventArgs = DayPilot.Web.Ui.Events.CommandEventArgs;

namespace Electronic_Health_Record
{
    
    public partial class appotemp : System.Web.UI.Page
    {
        private DataTable _appointments;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCalendarData();
                LoadNavigatorData();
            }

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
            DayPilotNavigator1.DataIdField = "AppointmentId";
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
            DayPilotCalendar1.DataIdField = "AppointmentId";
            DayPilotCalendar1.DataTextField = "AppointmentPatientName";
            DayPilotCalendar1.DataTagFields = "AppointmentStatus";
            DayPilotCalendar1.DataBind();
            DayPilotCalendar1.Update();
        }

        private void LoadAppointments()
        {
            int id = Convert.ToInt32(Request.QueryString["id"]);  // basic validation
            _appointments = Db.LoadFreeAndMyAppointments(DayPilotNavigator1.VisibleStart, DayPilotNavigator1.VisibleEnd, Session.SessionID);
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

        protected void DayPilotCalendar1_OnBeforeEventRender(object sender, BeforeEventRenderEventArgs e)
        {
            string status = e.Tag["AppointmentStatus"];

            switch (status)
            {
                case "free":
                    e.DurationBarColor = "green";
                    e.Html = "Available";
                    e.ToolTip = "Click to Request This Time Slot";
                    break;
                case "waiting":
                    e.DurationBarColor = "orange";
                    e.Html = "Your appointment, waiting for confirmation";
                    break;
                case "confirmed":
                    e.DurationBarColor = "#f41616";
                    e.Html = "Your appointment, confirmed";
                    break;
            }
        }

    }
}