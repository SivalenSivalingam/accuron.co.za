using System;
using System.Collections.Generic;
using System.Configuration;
using System.Net;
using System.Net.Mail;
using System.Text;

public class Email
{
    public bool SendMail(string subject, string body)
    {
        using (MailMessage mailMessage = new MailMessage())
        {
            mailMessage.From = new MailAddress(ConfigurationManager.AppSettings["Email"]);

            if (!string.IsNullOrEmpty(ConfigurationManager.AppSettings["To"].ToString()))
                mailMessage.To.Add(ConfigurationManager.AppSettings["To"]);

            if (!string.IsNullOrEmpty(ConfigurationManager.AppSettings["Cc"].ToString()))
                mailMessage.CC.Add(ConfigurationManager.AppSettings["Cc"]);

            if (!string.IsNullOrEmpty(ConfigurationManager.AppSettings["Bcc"].ToString()))
                mailMessage.Bcc.Add(ConfigurationManager.AppSettings["Bcc"]);

            mailMessage.Subject = subject;
            mailMessage.IsBodyHtml = true;
            mailMessage.Body = body;

            ServicePointManager.ServerCertificateValidationCallback = new System.Net.Security.RemoteCertificateValidationCallback(RemoteServerCertificateValidationCallback);
            SmtpClient smtpClient = new SmtpClient
            {
                UseDefaultCredentials = true,
                Host = ConfigurationManager.AppSettings["Host"],
                Port = 587,
                EnableSsl = true,
                DeliveryMethod = SmtpDeliveryMethod.Network,
                Credentials = new NetworkCredential(ConfigurationManager.AppSettings["Email"], ConfigurationManager.AppSettings["Password"]),
                Timeout = 20000
            };
            try
            {
                smtpClient.Send(mailMessage);
                return true;
            }
            catch
            {
                return false;
            }
        }
    }

    private bool RemoteServerCertificateValidationCallback(object sender, System.Security.Cryptography.X509Certificates.X509Certificate certificate, System.Security.Cryptography.X509Certificates.X509Chain chain, System.Net.Security.SslPolicyErrors sslPolicyErrors)
    {
        return true;
    }

    public string EmailTemplate(string heading, Dictionary<string, string> parameters, string domain)
    {
        StringBuilder emailHtml = new StringBuilder();

        emailHtml.Append("<div style=\"text-align: center;font-size: 20px;padding: 10px;font-weight: bold;\">" + heading + "</div>");
        emailHtml.Append("<div style=\"text-align: center;font-size: 13px;\">Date Time : " + DateTime.Now.ToString() + "</div>");

        foreach (var parameter in parameters)
        {
            emailHtml.Append("<div style=\"background-color: #ececec;padding: 10px;margin: 5px;\">" + parameter.Key + "</div>");
            emailHtml.Append("<div style=\"background-color: #ffffff;padding: 10px;margin: 5px;\">" + parameter.Value + "</div>");
        }

        emailHtml.Append("<br/>");
        emailHtml.Append("<div style=\"text-align: center;font-size: 13px;padding-top: 12px;\">Please note that this is an automated reply from " + domain + ". Please do not reply directly to this email. Thank You.</div>");

        return emailHtml.ToString();
    }
}