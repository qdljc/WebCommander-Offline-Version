<?xml version="1.0" ?>
<!--
Copyright (c) 2012-2014 VMware, Inc.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
-->

<!-- Author: Jerry Liu, liuj@vmware.com -->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:key name="keyEmpByName" match="//functionality" use="." />
	<xsl:output method="html"/>
	<xsl:template match="webcommander">
		<html>
			<head>
			<title>webCommander</title>
				<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
				<link rel="stylesheet" href="/css/googleapis.css" />
				<link rel="stylesheet" href="/webCmd.css" />
				<link rel="stylesheet" href="/css/jquery-ui.css" />
				<link rel="stylesheet" href="/css/animate.css" />
				<link rel="stylesheet" href="css/blue-glass/sidebar.css" />
				<script src="/js/jquery-1.8.3.js"></script>
				<script src="/js/jquery-ui.js"></script>
				<script src="/webCmd.js"></script>
				<script src="/js/jquery.sidebar.js"></script>
				<script src="/js/jquery.githubRepoWidget.min.js"></script>
			</head>
			<body>
				<xsl:call-template name="header"/>
				<div id="container">
					<xsl:call-template name="content"/>
					<xsl:call-template name="footer"/>
				</div>
				<div id="filter-sidebar">
					<div id="category-header">Filter Commands</div>
					<div id="category-list">
						<xsl:for-each select="//functionality[generate-id() = generate-id(key('keyEmpByName', .)[1])]">
							<xsl:sort select="."/>
							<p><input type="checkbox" class="catchk">
								<xsl:attribute name="name">
									<xsl:value-of select="."/>
								</xsl:attribute>
							</input>
							<xsl:text> </xsl:text>
							<xsl:value-of select="."/></p>
						</xsl:for-each>
					</div>
				</div>
				<script type="text/javascript">
					$("div#filter-sidebar").sidebar({
						top:100
					});
        		</script>
			</body>
		</html>
	</xsl:template>
	<xsl:template name="header">
		<div id="logo">
			<img src="images/logo-b.png" />
			> web<span>Commander</span>
			> <a href="workflow.html" class="logo"><font face="courier">workflow</font></a>
			[ <a href="poker/poker.html" class="logo"><span>Poker</span></a> ]
		</div>
	</xsl:template>
	<xsl:template name="content">
		<div class="round-corner">
			<div id="index">
				<ol>
				<xsl:for-each select="command[not(@hidden)]">
					<xsl:sort select="./script" />
					<li>
						<xsl:variable name="functionalityList">
							<xsl:for-each select="./functionalities/functionality">
								<xsl:value-of select="." />
								<xsl:if test="not(position()=last())"><xsl:text> </xsl:text></xsl:if>
							</xsl:for-each>
						</xsl:variable>
						<xsl:attribute name="class">
							<xsl:value-of select="$functionalityList" />
						</xsl:attribute>
						<a class="cmdName" target="_self">
							<xsl:attribute name="href">
								<xsl:choose>
									<xsl:when test="@type = 'workflow'">
										<xsl:value-of select="concat('workflow.html?', script)"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="concat('webCmd.php?command=', @name)"/>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:attribute>
							<xsl:choose>
								<xsl:when test="./functionalities/*[1] = 'VM'">
									<img src="images/icon-vm.png" alt="icon" />
								</xsl:when>
								<xsl:when test="./functionalities/*[1] = 'vSphere'">
									<img src="images/icon-vsphere.png" alt="icon" />
								</xsl:when>
								<xsl:when test="./functionalities/*[1] = 'Snapshot'">
									<img src="images/icon-snapshot.png" alt="icon" />
								</xsl:when>
								<xsl:when test="./functionalities/*[1] = 'Broker'">
									<img src="images/icon-view.png" alt="icon" />
								</xsl:when>
								<xsl:when test="./functionalities/*[1] = 'VMX'">
									<img src="images/icon-vmx.png" alt="icon" />
								</xsl:when>
								<xsl:when test="./functionalities/*[1] = 'Log'">
									<img src="images/icon-log.png" alt="icon" />
								</xsl:when>
								<xsl:when test="./functionalities/*[1] = 'Install'">
									<img src="images/icon-install.png" alt="icon" />
								</xsl:when>
								<xsl:when test="./functionalities/*[1] = 'Uninstall'">
									<img src="images/icon-uninstall.png" alt="icon" />
								</xsl:when>
								<xsl:when test="./functionalities/*[1] = 'Remote_Console'">
									<img src="images/icon-remote.png" alt="icon" />
								</xsl:when>
								<xsl:when test="./functionalities/*[1] = 'AD'">
									<img src="images/icon-ad.png" alt="icon" />
								</xsl:when>
								<xsl:when test="./functionalities/*[1] = 'Build'">
									<img src="images/icon-build.png" alt="icon" />
								</xsl:when>
								<xsl:when test="./functionalities/*[1] = 'Script'">
									<img src="images/icon-script.png" alt="icon" />
								</xsl:when>
								<xsl:when test="./functionalities/*[1] = 'Powershell'">
									<img src="images/icon-powershell.png" alt="icon" />
								</xsl:when>
								<xsl:when test="./functionalities/*[1] = 'SQL_Server'">
									<img src="images/icon-sql.png" alt="icon" />
								</xsl:when>
								<xsl:when test="./functionalities/*[1] = 'Broker_RDS'">
									<img src="images/icon-rds.png" alt="icon" />
								</xsl:when>
								<xsl:when test="./functionalities/*[1] = 'Workflow'">
									<img src="images/icon-run.png" alt="icon" />
								</xsl:when>
								<xsl:when test="./functionalities/*[1] = 'Windows'">
									<img src="images/icon-windows.png" alt="icon" />
								</xsl:when>
								<xsl:when test="./functionalities/*[1] = 'History'">
									<img src="images/icon-show.png" alt="icon" />
								</xsl:when>
								<xsl:otherwise>
									<img src="images/icon-default.jpg" alt="icon" />
								</xsl:otherwise>
							</xsl:choose>
							<xsl:value-of select="@synopsis"/>
						</a>
					</li>
				</xsl:for-each>
				</ol>
			</div>
		</div>
	</xsl:template>
	<xsl:template name="footer">
	</xsl:template>
</xsl:stylesheet>