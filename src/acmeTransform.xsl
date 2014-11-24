<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html"/>
  <xsl:template match="invoices">
        <html>
            <head>
                <title>Invoices!</title>
                <style type = "text/css">
                    th, td {
                        text-align: center;                  
                    }
                    tr {
                        background-color: lightblue;
                    }
                    .red {
                        color: red;
                    font-weight: bold;
                    }
                </style>
            </head>
            <body>
                <p class='red'>Overdue invoices: <xsl:value-of select="count(//invoices/invoice[@status = 'O'])"/></p>
                <table border="1">
                    <tr>
                        <th>Code</th>
                        <th>Date</th>
                        <th>Customer Name</th>
                        <th>Description</th>
                        <th>Value</th>
                        <th>Status</th>    
                    </tr>
			<xsl:apply-templates select = "invoice" >
                            <xsl:sort select="@date" order="ascending" />
                            <xsl:sort select="@value" order="descending" />
                        </xsl:apply-templates>
		</table>
            </body>
        </html>
    </xsl:template>
    <xsl:template match = "invoice">
                    <tr>
                        <!--xsl:for-each select="@*"-->
                            <td><em><xsl:value-of select="@invoice-code" /></em></td>
                            <td><em><xsl:value-of select="@date" /></em></td>
                            <td><em><xsl:value-of select="concat(@customer-surname, ' ' , @customer-first-name)" /></em></td>
                            <td><em><xsl:value-of select="@description" /></em></td>
                            <td><em><xsl:value-of select="@value" /></em></td>
                            
                                <xsl:choose>
                                    <xsl:when test="@status='O'">
                                        <td style="color:red;">
                                            <em>OVERDUE</em>
                                        </td>
                                    </xsl:when>
                                    <xsl:when test="@status='P'">
                                        <td>
                                            <em>PAID</em>
                                        </td>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <td>
                                            <em>UNPAID</em>
                                        </td>
                                            
                                    </xsl:otherwise>
                                </xsl:choose>
                        <!--/xsl:for-each-->

                    </tr>
                </xsl:template>
</xsl:stylesheet> 