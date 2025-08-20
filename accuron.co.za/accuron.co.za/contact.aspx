<%@ Page Title="" Language="C#" MasterPageFile="~/masterpage.master" AutoEventWireup="true" CodeFile="contact.aspx.cs" Inherits="contact" %>

<asp:Content ID="Head" ContentPlaceHolderID="Head" runat="Server">
</asp:Content>
<asp:Content ID="Body" ContentPlaceHolderID="Body" runat="Server">
    <section id="contact" class="contact section page-top">
        <div class="container section-title" data-aos="fade-up">
            <span class="description-title">Contact</span>
            <h2>Contact</h2>
            <p>Necessitatibus eius consequatur ex aliquid fuga eum quidem sint consectetur velit</p>
        </div>
        <div class="container" data-aos="fade-up" data-aos-delay="100">

            <div class="row g-5">
                <div class="col-lg-6">
                    <div class="content" data-aos="fade-up" data-aos-delay="200">
                        <div class="section-category mb-3">Contact US</div>
                        <h2 class="display-5 mb-4">Nemo enim ipsam voluptatem quia voluptas aspernatur</h2>
                        <p class="lead mb-4">Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam.</p>

                        <div class="contact-info mt-5">
                            <div class="info-item d-flex mb-3" data-aos="fade-up" data-aos-delay="300">
                                <i class="bi bi-envelope-at me-3"></i>
                                <span>info@example.com</span>
                            </div>

                            <div class="info-item d-flex mb-3" data-aos="fade-up" data-aos-delay="400">
                                <i class="bi bi-telephone me-3"></i>
                                <span>+1 5589 55488 558</span>
                            </div>

                            <div class="info-item d-flex mb-4" data-aos="fade-up" data-aos-delay="500">
                                <i class="bi bi-geo-alt me-3"></i>
                                <span>A108 Adam Street, New York, NY 535022</span>
                            </div>

                            <a href="#" class="map-link d-inline-flex align-items-center" data-aos="fade-up" data-aos-delay="600">Open Map
                  <i class="bi bi-arrow-right ms-2"></i>
                            </a>
                        </div>
                    </div>
                </div>

                <div class="col-lg-6">
                    <div class="contact-form card" data-aos="fade-up" data-aos-delay="300">
                        <div class="card-body p-4 p-lg-5">

                            <div class="row">
                                <div class="col-md-12">
                                    Full Name
                            <asp:TextBox runat="server" CssClass="form-control" ID="FullName"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="revFullName"
                                        ControlToValidate="FullName"
                                        ValidationExpression="[a-zA-Z ]*$"
                                        Display="Static"
                                        EnableClientScript="true"
                                        ErrorMessage="Please enter valid full name."
                                        runat="server"
                                        ForeColor="Red" />
                                </div>

                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    Email Address
                            <asp:TextBox runat="server" CssClass="form-control" ID="EmailAddress"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="revEmail"
                                        ControlToValidate="EmailAddress"
                                        ValidationExpression="\s*\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*\s*"
                                        Display="Static"
                                        EnableClientScript="true"
                                        ErrorMessage="Please enter valid email address"
                                        runat="server"
                                        ForeColor="Red" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    Contact Number
                            <asp:TextBox runat="server" CssClass="form-control" ID="ContactNumber"></asp:TextBox>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    Message
                            <asp:TextBox runat="server" CssClass="form-control" ID="Message" TextMode="MultiLine" Height="100"></asp:TextBox>
                                    <asp:TextBox runat="server" ID="bName" CssClass="bName"></asp:TextBox>
                                </div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:Label runat="server" ID="Test"></asp:Label><asp:TextBox runat="server" ID="Answer" Width="80" PlaceHolder="?"></asp:TextBox>
                                </div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:Button runat="server" ID="Submit" Text="Submit" OnClick="Submit_Click" CssClass="btn btn-primary" />
                                </div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:Label runat="server" ID="Status"></asp:Label>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>

            </div>

        </div>
    </section>
    <asp:HiddenField runat="server" ID="Ans" />
</asp:Content>

