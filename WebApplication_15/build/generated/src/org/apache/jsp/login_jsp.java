package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import utils.AuthUtils;
import dto.UserDTO;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(2);
    _jspx_dependants.add("/header.jsp");
    _jspx_dependants.add("/footer.jsp");
  }

  private org.apache.jasper.runtime.TagHandlerPool _jspx_tagPool_c_if_test;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _jspx_tagPool_c_if_test = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
  }

  public void _jspDestroy() {
    _jspx_tagPool_c_if_test.release();
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Đăng nhập</title>\n");
      out.write("        <style>\n");
      out.write("            .login-container {\n");
      out.write("                min-height: 500px;\n");
      out.write("                display: flex;\n");
      out.write("                justify-content: center;\n");
      out.write("                align-items: center;\n");
      out.write("                background-color: #f5f5f5;\n");
      out.write("                padding: 20px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .login-form {\n");
      out.write("                background: white;\n");
      out.write("                padding: 30px;\n");
      out.write("                border-radius: 8px;\n");
      out.write("                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);\n");
      out.write("                width: 100%;\n");
      out.write("                max-width: 400px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .form-group {\n");
      out.write("                margin-bottom: 20px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .form-group label {\n");
      out.write("                display: block;\n");
      out.write("                margin-bottom: 8px;\n");
      out.write("                font-weight: 500;\n");
      out.write("                color: #333;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .form-group input {\n");
      out.write("                width: 100%;\n");
      out.write("                padding: 10px;\n");
      out.write("                border: 1px solid #ddd;\n");
      out.write("                border-radius: 4px;\n");
      out.write("                font-size: 16px;\n");
      out.write("                transition: border-color 0.3s;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .form-group input:focus {\n");
      out.write("                border-color: #4CAF50;\n");
      out.write("                outline: none;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .submit-btn {\n");
      out.write("                background-color: #4CAF50;\n");
      out.write("                color: white;\n");
      out.write("                padding: 12px 20px;\n");
      out.write("                border: none;\n");
      out.write("                border-radius: 4px;\n");
      out.write("                cursor: pointer;\n");
      out.write("                width: 100%;\n");
      out.write("                font-size: 16px;\n");
      out.write("                transition: background-color 0.3s;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .submit-btn:hover {\n");
      out.write("                background-color: #45a049;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .form-title {\n");
      out.write("                text-align: center;\n");
      out.write("                margin-bottom: 30px;\n");
      out.write("                color: #333;\n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<style>\n");
      out.write("    * {\n");
      out.write("        margin: 0;\n");
      out.write("        padding: 0;\n");
      out.write("        box-sizing: border-box;\n");
      out.write("    }\n");
      out.write("\n");
      out.write("    .header {\n");
      out.write("        background-color: #2c3e50;\n");
      out.write("        padding: 1rem 0;\n");
      out.write("        width: 100%;\n");
      out.write("        top: 0;\n");
      out.write("    }\n");
      out.write("\n");
      out.write("    .container {\n");
      out.write("        max-width: 1200px;\n");
      out.write("        margin: 0 auto;\n");
      out.write("        padding: 0 1rem;\n");
      out.write("    }\n");
      out.write("\n");
      out.write("    .nav {\n");
      out.write("        display: flex;\n");
      out.write("        justify-content: space-between;\n");
      out.write("        align-items: center;\n");
      out.write("    }\n");
      out.write("\n");
      out.write("    .logo {\n");
      out.write("        color: #fff;\n");
      out.write("        font-size: 1.5rem;\n");
      out.write("        font-weight: bold;\n");
      out.write("        text-decoration: none;\n");
      out.write("    }\n");
      out.write("\n");
      out.write("    .menu {\n");
      out.write("        display: flex;\n");
      out.write("        list-style: none;\n");
      out.write("        gap: 2rem;\n");
      out.write("    }\n");
      out.write("\n");
      out.write("    .menu-item a {\n");
      out.write("        color: #fff;\n");
      out.write("        text-decoration: none;\n");
      out.write("        font-size: 1rem;\n");
      out.write("        transition: color 0.3s ease;\n");
      out.write("    }\n");
      out.write("\n");
      out.write("    .menu-item a:hover {\n");
      out.write("        color: #3498db;\n");
      out.write("    }\n");
      out.write("\n");
      out.write("    .search-bar {\n");
      out.write("        display: flex;\n");
      out.write("        align-items: center;\n");
      out.write("        background: #fff;\n");
      out.write("        border-radius: 20px;\n");
      out.write("        padding: 0.5rem 1rem;\n");
      out.write("    }\n");
      out.write("\n");
      out.write("    .search-input {\n");
      out.write("        border: none;\n");
      out.write("        outline: none;\n");
      out.write("        padding: 0.2rem;\n");
      out.write("        width: 200px;\n");
      out.write("    }\n");
      out.write("\n");
      out.write("    .search-button {\n");
      out.write("        background: none;\n");
      out.write("        border: none;\n");
      out.write("        cursor: pointer;\n");
      out.write("        color: #2c3e50;\n");
      out.write("    }\n");
      out.write("\n");
      out.write("    /* Styles for welcome and logout */\n");
      out.write("    .user-section {\n");
      out.write("        display: flex;\n");
      out.write("        align-items: center;\n");
      out.write("        gap: 1rem;\n");
      out.write("        margin-left: 1.5rem;\n");
      out.write("    }\n");
      out.write("\n");
      out.write("    .welcome-text {\n");
      out.write("        color: #fff;\n");
      out.write("        font-size: 0.95rem;\n");
      out.write("    }\n");
      out.write("\n");
      out.write("    .user-name {\n");
      out.write("        color: #3498db;\n");
      out.write("        font-weight: bold;\n");
      out.write("    }\n");
      out.write("\n");
      out.write("    .logout-btn {\n");
      out.write("        background-color: #e74c3c;\n");
      out.write("        color: white;\n");
      out.write("        border: none;\n");
      out.write("        border-radius: 4px;\n");
      out.write("        padding: 0.4rem 0.8rem;\n");
      out.write("        font-size: 0.85rem;\n");
      out.write("        cursor: pointer;\n");
      out.write("        transition: background-color 0.3s;\n");
      out.write("    }\n");
      out.write("\n");
      out.write("    .logout-btn:hover {\n");
      out.write("        background-color: #c0392b;\n");
      out.write("    }\n");
      out.write("\n");
      out.write("    /* Adjust layout for user section */\n");
      out.write("    .right-section {\n");
      out.write("        display: flex;\n");
      out.write("        align-items: center;\n");
      out.write("    }\n");
      out.write("</style>\n");
      out.write("\n");
      out.write("<header class=\"header\">\n");
      out.write("\n");
      out.write("    <div class=\"container\">\n");
      out.write("        <nav class=\"nav\">\n");
      out.write("            <a href=\"#\" class=\"logo\">SHOP ONLINE</a>\n");
      out.write("            <ul class=\"menu\">\n");
      out.write("                <li class=\"menu-item\"><a href=\"#\">Trang chủ</a></li>\n");
      out.write("                <li class=\"menu-item\"><a href=\"#\">Sản phẩm</a></li>\n");
      out.write("                <li class=\"menu-item\"><a href=\"#\">Giỏ hàng</a></li>\n");
      out.write("                <li class=\"menu-item\"><a href=\"#\">Liên hệ</a></li>\n");
      out.write("            </ul>\n");
      out.write("            <div class=\"right-section\">\n");
      out.write("                <div class=\"search-bar\">\n");
      out.write("                    <input type=\"text\" class=\"search-input\" placeholder=\"Tìm kiếm...\">\n");
      out.write("                    <button class=\"search-button\">🔍</button>\n");
      out.write("                </div>\n");
      out.write("                ");
      if (_jspx_meth_c_if_0(_jspx_page_context))
        return;
      out.write("\n");
      out.write("            </div>\n");
      out.write("        </nav>\n");
      out.write("    </div>\n");
      out.write("</header>");
      out.write("\n");
      out.write("        <div class=\"login-container\">\n");
      out.write("            <div class=\"login-form\">\n");
      out.write("                <h2 class=\"form-title\">Đăng nhập</h2>\n");
      out.write("                <form action=\"MainController\" method=\"post\">\n");
      out.write("                    <input type=\"hidden\" name=\"action\" value=\"login\" />\n");
      out.write("\n");
      out.write("                    <div class=\"form-group\">\n");
      out.write("                        <label for=\"userId\">Tên đăng nhập</label>\n");
      out.write("                        <input type=\"text\" id=\"userId\" name=\"txtUserID\" required />\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                    <div class=\"form-group\">\n");
      out.write("                        <label for=\"password\">Mật khẩu</label>\n");
      out.write("                        <input type=\"password\" id=\"password\" name=\"txtPassword\" required />\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                    <button type=\"submit\" class=\"submit-btn\">Đăng nhập</button>\n");
      out.write("                </form>\n");
      out.write("                ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${requestScope.message==null?\"\":requestScope.message}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        ");
      out.write("\n");
      out.write("\n");
      out.write("<style>\n");
      out.write("    .footer {\n");
      out.write("        background-color: #2c3e50;\n");
      out.write("        color: #fff;\n");
      out.write("        padding: 3rem 0;\n");
      out.write("        margin-top: 2rem;\n");
      out.write("    }\n");
      out.write("\n");
      out.write("    .footer-container {\n");
      out.write("        max-width: 1200px;\n");
      out.write("        margin: 0 auto;\n");
      out.write("        padding: 0 1rem;\n");
      out.write("        display: grid;\n");
      out.write("        grid-template-columns: repeat(4, 1fr);\n");
      out.write("        gap: 2rem;\n");
      out.write("    }\n");
      out.write("\n");
      out.write("    .footer-section h3 {\n");
      out.write("        font-size: 1.2rem;\n");
      out.write("        margin-bottom: 1rem;\n");
      out.write("        color: #3498db;\n");
      out.write("    }\n");
      out.write("\n");
      out.write("    .footer-section p {\n");
      out.write("        margin-bottom: 0.5rem;\n");
      out.write("        font-size: 0.9rem;\n");
      out.write("        line-height: 1.5;\n");
      out.write("    }\n");
      out.write("\n");
      out.write("    .footer-links {\n");
      out.write("        list-style: none;\n");
      out.write("    }\n");
      out.write("\n");
      out.write("    .footer-links li {\n");
      out.write("        margin-bottom: 0.5rem;\n");
      out.write("    }\n");
      out.write("\n");
      out.write("    .footer-links a {\n");
      out.write("        color: #fff;\n");
      out.write("        text-decoration: none;\n");
      out.write("        transition: color 0.3s ease;\n");
      out.write("    }\n");
      out.write("\n");
      out.write("    .footer-links a:hover {\n");
      out.write("        color: #3498db;\n");
      out.write("    }\n");
      out.write("\n");
      out.write("    .social-links {\n");
      out.write("        display: flex;\n");
      out.write("        gap: 1rem;\n");
      out.write("        margin-top: 1rem;\n");
      out.write("    }\n");
      out.write("\n");
      out.write("    .social-links a {\n");
      out.write("        color: #fff;\n");
      out.write("        text-decoration: none;\n");
      out.write("        font-size: 1.5rem;\n");
      out.write("    }\n");
      out.write("\n");
      out.write("    .copyright {\n");
      out.write("        text-align: center;\n");
      out.write("        padding-top: 2rem;\n");
      out.write("        margin-top: 2rem;\n");
      out.write("        border-top: 1px solid #34495e;\n");
      out.write("        font-size: 0.9rem;\n");
      out.write("    }\n");
      out.write("</style>\n");
      out.write("\n");
      out.write("<footer class=\"footer\">\n");
      out.write("    <div class=\"footer-container\">\n");
      out.write("        <div class=\"footer-section\">\n");
      out.write("            <h3>Về chúng tôi</h3>\n");
      out.write("            <p>Shop Online là điểm đến tin cậy cho những sản phẩm chất lượng với giá cả hợp lý. Chúng tôi cam kết mang đến trải nghiệm mua sắm tốt nhất cho khách hàng.</p>\n");
      out.write("        </div>\n");
      out.write("        \n");
      out.write("        <div class=\"footer-section\">\n");
      out.write("            <h3>Liên kết nhanh</h3>\n");
      out.write("            <ul class=\"footer-links\">\n");
      out.write("                <li><a href=\"#\">Trang chủ</a></li>\n");
      out.write("                <li><a href=\"#\">Sản phẩm</a></li>\n");
      out.write("                <li><a href=\"#\">Giỏ hàng</a></li>\n");
      out.write("                <li><a href=\"#\">Chính sách</a></li>\n");
      out.write("            </ul>\n");
      out.write("        </div>\n");
      out.write("        \n");
      out.write("        <div class=\"footer-section\">\n");
      out.write("            <h3>Liên hệ</h3>\n");
      out.write("            <p>Địa chỉ: 123 Đường ABC, Quận XYZ</p>\n");
      out.write("            <p>Email: contact@shoponline.com</p>\n");
      out.write("            <p>Điện thoại: (84) 123-456-789</p>\n");
      out.write("        </div>\n");
      out.write("        \n");
      out.write("        <div class=\"footer-section\">\n");
      out.write("            <h3>Theo dõi chúng tôi</h3>\n");
      out.write("            <p>Cập nhật tin tức mới nhất và khuyến mãi từ chúng tôi</p>\n");
      out.write("            <div class=\"social-links\">\n");
      out.write("                <a href=\"#\">📱</a>\n");
      out.write("                <a href=\"#\">💬</a>\n");
      out.write("                <a href=\"#\">📷</a>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("    \n");
      out.write("    <div class=\"copyright\">\n");
      out.write("        <p>&copy; 2024 Shop Online. Tất cả quyền được bảo lưu.</p>\n");
      out.write("    </div>\n");
      out.write("</footer>");
      out.write("\n");
      out.write("        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "footer.jsp", out, false);
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }

  private boolean _jspx_meth_c_if_0(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:if
    org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_if_0 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _jspx_tagPool_c_if_test.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
    _jspx_th_c_if_0.setPageContext(_jspx_page_context);
    _jspx_th_c_if_0.setParent(null);
    _jspx_th_c_if_0.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${not empty sessionScope.user}", java.lang.Boolean.class, (PageContext)_jspx_page_context, null)).booleanValue());
    int _jspx_eval_c_if_0 = _jspx_th_c_if_0.doStartTag();
    if (_jspx_eval_c_if_0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("\n");
        out.write("                <div class=\"user-section\">\n");
        out.write("                    <span class=\"welcome-text\">Xin chào, <span class=\"user-name\">");
        out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${user.fullName}", java.lang.String.class, (PageContext)_jspx_page_context, null));
        out.write("</span>!</span>\n");
        out.write("                    <form action=\"MainController\" method=\"post\" style=\"margin: 0;\">\n");
        out.write("                        <input type=\"hidden\" name=\"action\" value=\"logout\"/>\n");
        out.write("                        <input type=\"submit\" value=\"Đăng xuất\" class=\"logout-btn\"/>\n");
        out.write("                    </form>\n");
        out.write("                </div>\n");
        out.write("                ");
        int evalDoAfterBody = _jspx_th_c_if_0.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_c_if_0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _jspx_tagPool_c_if_test.reuse(_jspx_th_c_if_0);
      return true;
    }
    _jspx_tagPool_c_if_test.reuse(_jspx_th_c_if_0);
    return false;
  }
}
