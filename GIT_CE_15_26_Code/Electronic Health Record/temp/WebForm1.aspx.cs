using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Electronic_Health_Record.temp
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void GetModels(System.Object sender, System.EventArgs e)
        {
            Int16 I;


            for (I = 0; I <= cblManufacturer.Items.Count - 1; I++)
            {
                if (cblManufacturer.Items[I].Selected)
                {
                    hfManu.Value = cblManufacturer.Items[I].Value;
                    Label lblManu = new Label();
                    lblManu.ID = "lbl_" + cblManufacturer.Items[I].Value;
                    lblManu.Text = "Models for Manufacturer: " + cblManufacturer.Items[I].Value;
                    PlaceHolder1.Controls.Add(lblManu);


                    CheckBoxList cblModels = new CheckBoxList();
                    cblModels.ID = "cbl_" + cblManufacturer.Items[I].Value;
                    cblModels.DataSource = SqlDataSource2;
                    cblModels.DataTextField = "Model";
                    cblModels.DataBind();


                    PlaceHolder1.Controls.Add(cblModels);
                }
            }
        }
    }
}