<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" encoding="UTF-8" />
    <xsl:template match="/festival"> { "items": [ <xsl:for-each select="performers/performer">
        {"id":"<xsl:value-of select="@id" />","name":"<xsl:value-of select="@name" />","country":"<xsl:value-of
                select="@country" />","genre":"<xsl:value-of select="@genre" />","bio":"<xsl:value-of
                select="bio" />"}<xsl:if test="position()!=last()">,</xsl:if></xsl:for-each> ],
        "page": 1, "pageSize": <xsl:value-of select="count(performers/performer)" />, "totalItems": <xsl:value-of
            select="count(performers/performer)" /> } </xsl:template>
</xsl:stylesheet>