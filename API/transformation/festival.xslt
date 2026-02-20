<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" encoding="UTF-8" />
    <xsl:template match="/festival"> { "id": "<xsl:value-of select="@id" />", "name": "<xsl:value-of
            select="@name" />", "edition": <xsl:value-of select="@edition" />, "city": "<xsl:value-of
            select="@city" />", "startDate": "<xsl:value-of select="@startDate" />", "endDate": "<xsl:value-of
            select="@endDate" />", "description": "<xsl:value-of select="description" />",
        "tickets": [ <xsl:for-each select="tickets/ticket">{"type":"<xsl:value-of select="@type" />
        ","price":<xsl:value-of select="@price" />}<xsl:if test="position()!=last()">,</xsl:if></xsl:for-each>
        ], "links": { "web": "<xsl:value-of select="links/link[@rel='web']" />", "instagram": "<xsl:value-of
            select="links/link[@rel='instagram']" />" } } </xsl:template>
</xsl:stylesheet>