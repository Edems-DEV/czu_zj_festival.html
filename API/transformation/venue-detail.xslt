<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:param name="id" select="'v1'" />
    <xsl:output method="text" encoding="UTF-8" />
    <xsl:template match="/festival">
        <xsl:for-each select="venues/venue[@id=$id]"> {"id":"<xsl:value-of select="@id" />","name":"<xsl:value-of
                select="@name" />","city":"<xsl:value-of select="@city" />","address":"<xsl:value-of
                select="address" />","capacity":<xsl:value-of select="@capacity" />} </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>