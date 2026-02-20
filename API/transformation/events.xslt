<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" encoding="UTF-8" />
    <xsl:template match="/festival"> { "items": [ <xsl:for-each select="events/event">{"id":"<xsl:value-of
                select="@id" />","title":"<xsl:value-of select="@title" />","performerId":"<xsl:value-of
                select="@performerId" />","venueId":"<xsl:value-of select="@venueId" />","day":"<xsl:value-of
                select="@day" />","startTime":"<xsl:value-of select="@startTime" />","durationMin":<xsl:value-of
                select="@durationMin" />,"type":"<xsl:value-of select="@type" />","description":"<xsl:value-of
                select="description" />"}<xsl:if test="position()!=last()">,</xsl:if></xsl:for-each>
        ], "page": 1, "pageSize": <xsl:value-of select="count(events/event)" />, "totalItems": <xsl:value-of
            select="count(events/event)" /> } </xsl:template>
</xsl:stylesheet>