<xsl:stylesheet xmlns:xsl = "http://www.w3.org/1999/XSL/Transform" version = "1.0">
	<xsl:output method="html" doctype-system="about:legacy-compat" encoding="UTF-8" indent="yes" />
	<!-- Import include files -->
	<xsl:include href="includes/head.xsl"/>
	<xsl:include href="includes/header.xsl"/>
	<xsl:include href="includes/footer.xsl"/>

	<xsl:include href="includes/mountnav.xsl"/>

	<xsl:template match="/icestats">
		<html>

			<xsl:call-template name="head">
				<xsl:with-param name="title">Configuration</xsl:with-param>
			</xsl:call-template>

			<body>
				<!-- Header/Menu -->
				<xsl:call-template name="header" />

				<div class="section">
					<h2>Configuration</h2>

					<div class="article">
						<xsl:if test="/icestats/errors>0">
							<h3>Errors</h3>

							<ul>
								<xsl:for-each select="/icestats/errors/*">
									<li>
										Problem saving <xsl:value-of select="name()" /> field
									</li>
								</xsl:for-each>
							</ul>
						</xsl:if>

						<form method="post">
							<h3>General Settings</h3>

							<table class="table-block">
								<thead>
									<tr>
										<th>Key</th>
										<th>Value</th>
									</tr>
								</thead>
								<tbody>
									<xsl:for-each select="/icestats/general/*">
										<tr>
											<td>
												<xsl:value-of select="name()" />
											</td>
											<td>
												<input type="text">
													<xsl:attribute name="value">
														<xsl:value-of select="text()" />
													</xsl:attribute>
													<xsl:attribute name="placeholder">
														<xsl:value-of select="@placeholder" />
													</xsl:attribute>
													<xsl:attribute name="name">
														<xsl:value-of select="name()" />
													</xsl:attribute>
												</input>
											</td>
										</tr>
									</xsl:for-each>
								</tbody>
							</table>

							<h3>Limits</h3>

							<table class="table-block">
								<thead>
									<tr>
										<th>Key</th>
										<th>Value</th>
									</tr>
								</thead>
								<tbody>
									<xsl:for-each select="/icestats/limits/*">
										<tr>
											<td>
												<xsl:value-of select="name()" />
											</td>
											<td>
												<input type="text">
													<xsl:attribute name="value">
														<xsl:value-of select="text()" />
													</xsl:attribute>
													<xsl:attribute name="placeholder">
														<xsl:value-of select="@placeholder" />
													</xsl:attribute>
													<xsl:attribute name="name">
														<xsl:value-of select="name(..)" />.<xsl:value-of select="name()" />
													</xsl:attribute>
												</input>
											</td>
										</tr>
									</xsl:for-each>
								</tbody>
							</table>

							<input type="submit" value="Update Configuration" />
						</form>
					</div>
				</div>

				<!-- Footer -->
				<xsl:call-template name="footer" />

			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>