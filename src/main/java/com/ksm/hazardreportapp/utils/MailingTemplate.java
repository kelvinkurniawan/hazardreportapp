/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ksm.hazardreportapp.utils;

import java.util.Date;

/**
 *
 * @author kelvi
 */
public class MailingTemplate {

    public static String newReportToHSE(Date date, String originator, String desc, int reportId) {

        String template = "<!DOCTYPE html>"
                + "<html lang='en'>"
                + "  <head>"
                + "    <meta charset='UTF-8' />"
                + "    <meta name='viewport' content='width=device-width, initial-scale=1.0' />"
                + "    <title>Document</title>"
                + "    <style>"
                + "      .title {"
                + "        width: 100%;"
                + "        padding: 10px;"
                + "        background-color: #e3e3e3;"
                + "        color: #66615b;"
                + "      }"
                + "    </style>"
                + "  </head>"
                + "  <body>"
                + "    <div class='title'>"
                + "      <h3>There's new report for you!</h3>"
                + "    </div>"
                + "    <div class='body-text'>"
                + "      <h4>New Report Created!</h4>"
                + "      <p>" + originator + " created new report with :</p>"
                + "      <p>Datetime : " + date + "</p>"
                + "      <p>"
                + "        Desc : " + desc + ""
                + "      </p>"
                + "      <p>for detail you should open hazardApplication or follow this link</p>"
                + "      <a href='http://localhost:8084/admin/report/details/" + reportId + "'>http://localhost:8084/admin/report/details/" + reportId + "</a>"
                + "    </div>"
                + "  </body>"
                + "</html>";

        return template;
    }

    public static String newReportToOriginator(Date date, String originator, String desc, int reportId) {

        String template = "<!DOCTYPE html>"
                + "<html lang='en'>"
                + "  <head>"
                + "    <meta charset='UTF-8' />"
                + "    <meta name='viewport' content='width=device-width, initial-scale=1.0' />"
                + "    <title>Document</title>"
                + "    <style>"
                + "      .title {"
                + "        width: 100%;"
                + "        padding: 10px;"
                + "        background-color: #e3e3e3;"
                + "        color: #66615b;"
                + "      }"
                + "    </style>"
                + "  </head>"
                + "  <body>"
                + "    <div class='title'>"
                + "      <h3>Hei, " + originator + " Your report is sent!</h3>"
                + "    </div>"
                + "    <div class='body-text'>"
                + "      <h4>your report will be processed immediately</h4>"
                + "      <p>Report created with :</p>"
                + "      <p>Datetime : " + date + "</p>"
                + "      <p>"
                + "        Desc : " + desc + ""
                + "      </p>"
                + "      <p>for detail you should open hazardApplication or follow this link</p>"
                + "      <a href='http://localhost:8084/admin/report/details/" + reportId + "'>http://localhost:8084/admin/report/details/" + reportId + "</a>"
                + "    </div>"
                + "  </body>"
                + "</html>";

        return template;
    }

    public static String notifyProgress(Date date, String text, int reportId) {

        String template = "<!DOCTYPE html>"
                + "<html lang='en'>"
                + "  <head>"
                + "    <meta charset='UTF-8' />"
                + "    <meta name='viewport' content='width=device-width, initial-scale=1.0' />"
                + "    <title>Document</title>"
                + "    <style>"
                + "      .title {"
                + "        width: 100%;"
                + "        padding: 10px;"
                + "        background-color: #e3e3e3;"
                + "        color: #66615b;"
                + "      }"
                + "    </style>"
                + "  </head>"
                + "  <body>"
                + "    <div class='title'>"
                + "      <h3>There's new notification for you!</h3>"
                + "    </div>"
                + "    <div class='body-text'>"
                + "      <h4>Your Report Progress Is Updated!</h4>"
                + "      <p>Now your reports is on : </p>"
                + "      <p>Datetime : " + date + "</p>"
                + "      <p>"
                + "        Progress : " + text + ""
                + "      </p>"
                + "      <p>for detail you should open hazardApplication or follow this link</p>"
                + "      <a href='http://localhost:8084/admin/report/details/" + reportId + "'>http://localhost:8084/admin/report/details/" + reportId + "</a>"
                + "    </div>"
                + "  </body>"
                + "</html>";

        return template;
    }

    public static String notifyProgressEnd(Date date, String text, int reportId) {

        String template = "<!DOCTYPE html>"
                + "<html lang='en'>"
                + "  <head>"
                + "    <meta charset='UTF-8' />"
                + "    <meta name='viewport' content='width=device-width, initial-scale=1.0' />"
                + "    <title>Document</title>"
                + "    <style>"
                + "      .title {"
                + "        width: 100%;"
                + "        padding: 10px;"
                + "        background-color: #e3e3e3;"
                + "        color: #66615b;"
                + "      }"
                + "    </style>"
                + "  </head>"
                + "  <body>"
                + "    <div class='title'>"
                + "      <h3>There's new notification for you!</h3>"
                + "    </div>"
                + "    <div class='body-text'>"
                + "      <h4>Your report is closed!</h4>"
                + "      <p>Datetime : " + date + "</p>"
                + "      <p>" + text + "</p>"
                + "      <p>for detail you should open hazardApplication or follow this link</p>"
                + "      <a href='http://localhost:8084/admin/report/details/" + reportId + "'>http://localhost:8084/admin/report/details/" + reportId + "</a>"
                + "    </div>"
                + "  </body>"
                + "</html>";

        return template;
    }
}
