using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class contact : System.Web.UI.Page
{
    string errorMessage = "Oops! An error has occurred while sending the enquiry message. Please contact us via telephone/mobile or directly email us. We apologise for any inconvenience caused.";
    string successMessage = "Your message has been sent successfully. We will get back to you as soon as possible. Thank You.";

    protected void Page_Load(object sender, EventArgs e)
    {
        Page.MaintainScrollPositionOnPostBack = true;

        if (!Page.IsPostBack)
        {
            CreateTest();
        }
    }

    private void CreateTest()
    {
        Random random = new Random();
        int value1 = random.Next(1, 10);
        int value2 = random.Next(1, 10);
        Ans.Value = (value1 + value2).ToString();
        Test.Text = value1.ToString() + " + " + value2.ToString() + " = ";
    }

    protected void Submit_Click(object sender, EventArgs e)
    {
        Status.ForeColor = System.Drawing.Color.Red;

        if (!string.IsNullOrEmpty(bName.Text))
        {
            Status.Text = errorMessage;
            return;
        }

        if (string.IsNullOrEmpty(FullName.Text))
        {
            Status.Text = "Please enter a full name.";
            return;
        }

        if (string.IsNullOrEmpty(EmailAddress.Text))
        {
            Status.Text = "Please enter a email address.";
            return;
        }

        if (string.IsNullOrEmpty(ContactNumber.Text))
        {
            Status.Text = "Please enter a contact number.";
            return;
        }

        if (Answer.Text != Ans.Value.ToString())
        {
            Status.Text = "Your answer is incorrect.";
            return;
        }

        Email email = new Email();

        try
        {
            Dictionary<string, string> parameters = new Dictionary<string, string>()
            {
                { "Full Name", FullName.Text},
                { "Email Address", EmailAddress.Text},
                { "Contact Number", ContactNumber.Text},
                { "Message", Message.Text},
            };

            email.SendMail(
                "Website Contact Us Notification (" + HttpContext.Current.Request.Url.Host + ")",
                email.EmailTemplate("Website Contact Us Notification", parameters, HttpContext.Current.Request.Url.Host));

            FullName.Text = "";
            EmailAddress.Text = "";
            ContactNumber.Text = "";
            Message.Text = "";
            CreateTest();

            Status.ForeColor = System.Drawing.Color.Green;
            Status.Text = successMessage;
        }
        catch
        {
            Status.Text = errorMessage;
            CreateTest();
            return;
        }
    }
}
