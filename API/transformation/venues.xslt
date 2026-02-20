<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" encoding="UTF-8" />
    <xsl:template match="/festival"> { "items": [ <xsl:for-each select="venues/venue">{"id":"<xsl:value-of
                select="@id" />","name":"<xsl:value-of select="@name" />","city":"<xsl:value-of
                select="@city" />","address":"<xsl:value-of select="address" />","capacity":<xsl:value-of
                select="@capacity" />}<xsl:if test="position()!=last()">,</xsl:if></xsl:for-each> ],
        "page": 1, "pageSize": <xsl:value-of select="count(venues/venue)" />, "totalItems": <xsl:value-of
            select="count(venues/venue)" /> } </xsl:template>
</xsl:stylesheet>