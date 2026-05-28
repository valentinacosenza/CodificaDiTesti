<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="2.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns="http://www.w3.org/1999/xhtml">
    
    <xsl:output method="html" encoding="UTF-8" omit-xml-declaration="yes" indent="yes"/>
    
    <xsl:template match="/">
        <html>
            <head>
                <title>La Rassegna Settimanale - Edizione digitale</title>
                <link rel="stylesheet" href="style.css" type="text/css" />
                <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
                <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
                <script src="script.js"></script>
            </head>
            <body>
                
                <!-- HEADER con titolo, sottotitolo e menu -->
                <header>
                    <h1><xsl:value-of select="//tei:titleStmt/tei:title[@type='main']" /></h1>
                    <h2><xsl:value-of select="//tei:titleStmt/tei:title[@type='sub']" /></h2>
                    
                    <nav class="navMenu">
                        <ul>
                            <li><a href="#art1">Articolo 1</a></li>
                            <li><a href="#art2">Articolo 2</a></li>
                            <li><a href="#bibliografia">Bibliografia</a></li>
                            <li><a href="#news">Notizie</a></li>
                            <li><a href="#glossario">Glossario</a></li>
                            <li><a href="#info">Info</a></li>
                        </ul>
                    </nav>
                </header>
                
                <!-- TOOLBAR unica per le categorie da evidenziare -->
                <div class="toolbar">
                    <p>Evidenzia nel testo:</p>
                    <button class="cat-btn" data-cat="person-real">Persone reali</button>
                    <button class="cat-btn" data-cat="person-fictional">Personaggi immaginari</button> 
                    <button class="cat-btn" data-cat="place">Luoghi</button> 
                    <button class="cat-btn" data-cat="geog">Luoghi naturali</button> 
                    <button class="cat-btn" data-cat="org">Organizzazioni</button> 
                    <button class="cat-btn" data-cat="work">Opere</button> 
                    <button class="cat-btn" data-cat="journal">Case editrici e Riviste</button> 
                    <button class="cat-btn" data-cat="date">Date</button>
                    <button class="cat-btn" data-cat="theme">Temi e/o Motivi</button> 
                    <button class="cat-btn" data-cat="literary">Correnti letterarie</button> 
                    <button class="cat-btn" data-cat="epithet">Epiteti</button> 
                    <button class="cat-btn" data-cat="foreign">Testo in lingua straniera</button> 
                    <button class="cat-btn" data-cat="quote">Citazioni</button> 
                    <button class="cat-btn" data-cat="archaism">Arcaismi</button>
                    <button class="cat-btn" data-cat="variant">Varianti grafiche</button>
                    <button class="cat-btn" data-cat="abbreviation">Abbreviazioni</button>
                    <button class="cat-btn" data-cat="damaged">Parole danneggiate</button>
                    <button class="cat-btn" data-cat="correction">Correzioni</button>
                    <button class="cat-reset">Reset</button>
                </div>
                
                <!-- ARTICOLO 1 (visibile all'inizio) -->
                <section id="art1" class="page-section active">
                    <h2>Articolo 1 - L'Inchiesta Agraria</h2>
                    
                    <div class="flexbox">
                        <div class="img">
                            <xsl:apply-templates select="//tei:surface[@xml:id='articolo1']" />
                            <xsl:apply-templates select="//tei:surface[@xml:id='articolo1.2']" />
                        </div>
                        <div class="testo">
                            <xsl:apply-templates select="//tei:div[@xml:id='art1']" />
                        </div>
                    </div>
                </section>
                
                <!-- ARTICOLO 2 -->
                <section id="art2" class="page-section">
                    <h2>Articolo 2 - Il desiderio dei campi</h2>
                    
                    <div class="flexbox">
                        <div class="img">
                            <xsl:apply-templates select="//tei:surface[@xml:id='articolo2']" />
                            <xsl:apply-templates select="//tei:surface[@xml:id='articolo2.2']" />
                        </div>
                        <div class="testo">
                            <xsl:apply-templates select="//tei:div[@xml:id='art2']" />
                        </div>
                    </div>
                </section>
                
                <!-- BIBLIOGRAFIA (recensione 1 + recensione 2 insieme) -->
                <section id="bibliografia" class="page-section">
                    <h2>Bibliografia</h2>
                    
                    <div class="flexbox">
                        <div class="img">
                            <xsl:apply-templates select="//tei:surface[@xml:id='biblio1']" />
                            <xsl:apply-templates select="//tei:surface[@xml:id='biblio2']" />
                        </div>
                        <div class="testo">
                            <xsl:apply-templates select="//tei:div[@xml:id='bibliografia']" />
                        </div>
                    </div>
                </section>
                
                <!-- NOTIZIE -->
                <section id="news" class="page-section">
                    <h2>Notizie</h2>
                    
                    <div class="flexbox">
                        <div class="img">
                            <xsl:apply-templates select="//tei:surface[@xml:id='notizie']" />
                        </div>
                        <div class="testo">
                            <xsl:apply-templates select="//tei:div[@xml:id='news']" />
                        </div>
                    </div>
                </section>
                
                <!-- GLOSSARIO -->
                <section id="glossario" class="page-section no-toolbar">
                    <h2>Glossario</h2>
                    
                    <div class="glossario-block">
                        <h3>Persone reali</h3>
                        <ul>
                            <xsl:for-each select="//tei:listPerson[not(@type='fictional')]/tei:person">
                                <li>
                                    <xsl:attribute name="id"><xsl:value-of select="@xml:id" /></xsl:attribute>
                                    <b><xsl:apply-templates select="current()/tei:persName" /></b>
                                    <xsl:if test="current()/tei:occupation">
                                        - <xsl:value-of select="current()/tei:occupation" />
                                    </xsl:if>
                                </li>
                            </xsl:for-each>
                        </ul>
                    </div>
                    
                    <div class="glossario-block">
                        <h3>Personaggi immaginari</h3>
                        <ul>
                            <xsl:for-each select="//tei:listPerson[@type='fictional']/tei:person">
                                <li>
                                    <xsl:attribute name="id"><xsl:value-of select="@xml:id" /></xsl:attribute>
                                    <b><xsl:value-of select="current()/tei:persName" /></b>
                                    <xsl:if test="current()/tei:note">
                                        - <xsl:value-of select="current()/tei:note" />
                                    </xsl:if>
                                </li>
                            </xsl:for-each>
                        </ul>
                    </div>
                    
                    <div class="glossario-block">
                        <h3>Luoghi</h3>
                        <ul>
                            <xsl:for-each select="//tei:listPlace/tei:place">
                                <li>
                                    <xsl:attribute name="id"><xsl:value-of select="@xml:id" /></xsl:attribute>
                                    <b><xsl:value-of select="current()/tei:placeName" /></b>
                                    <xsl:if test="current()/tei:note">
                                        - <xsl:value-of select="current()/tei:note" />
                                    </xsl:if>
                                </li>
                            </xsl:for-each>
                        </ul>
                    </div>
                    
                    <div class="glossario-block">
                        <h3>Organizzazioni e istituzioni</h3>
                        <ul>
                            <xsl:for-each select="//tei:listOrg/tei:org">
                                <li>
                                    <xsl:attribute name="id"><xsl:value-of select="@xml:id" /></xsl:attribute>
                                    <b><xsl:value-of select="current()/tei:orgName" /></b>
                                    <xsl:if test="current()/tei:desc">
                                        - <xsl:value-of select="current()/tei:desc" />
                                    </xsl:if>
                                </li>
                            </xsl:for-each>
                        </ul>
                    </div>
                    
                    <div class="glossario-block">
                        <h3>Opere e pubblicazioni</h3>
                        <ul>
                            <xsl:for-each select="//tei:back//tei:listBibl/tei:bibl">
                                <li>
                                    <xsl:attribute name="id"><xsl:value-of select="@xml:id" /></xsl:attribute>
                                    <i><xsl:value-of select="current()/tei:title" /></i>
                                    <xsl:if test="current()/tei:author">
                                        di <xsl:value-of select="current()/tei:author" />
                                    </xsl:if>
                                    <xsl:if test="current()/tei:date">
                                        (<xsl:value-of select="current()/tei:date" />)
                                    </xsl:if>
                                    <xsl:if test="current()/tei:note">
                                        - <xsl:value-of select="current()/tei:note" />
                                    </xsl:if>
                                </li>
                            </xsl:for-each>
                        </ul>
                    </div>
                    
                    <div class="glossario-block">
                        <h3>Gruppi menzionati</h3>
                        <ul>
                            <xsl:for-each select="//tei:back/tei:div[@type='groups']//tei:item">
                                <li>
                                    <xsl:attribute name="id"><xsl:value-of select="@xml:id" /></xsl:attribute>
                                    <b><xsl:value-of select="current()/tei:label" /></b>
                                    <xsl:if test="current()/tei:note">
                                        - <xsl:value-of select="current()/tei:note" />
                                    </xsl:if>
                                </li>
                            </xsl:for-each>
                        </ul>
                    </div>
                    
                    <div class="glossario-block">
                        <h3>Temi, motivi e correnti</h3>
                        <ul>
                            <xsl:for-each select="//tei:back/tei:div[@type='themes']//tei:item">
                                <li>
                                    <xsl:attribute name="id"><xsl:value-of select="@xml:id" /></xsl:attribute>
                                    <b><xsl:value-of select="current()/tei:term" /></b>
                                    <xsl:if test="current()/tei:gloss">
                                        - <xsl:value-of select="current()/tei:gloss" />
                                    </xsl:if>
                                </li>
                            </xsl:for-each>
                        </ul>
                    </div>
                    
                    <div class="glossario-block">
                        <h3>Forme arcaiche</h3>
                        <ul>
                            <xsl:for-each select="//tei:back/tei:div[@type='archaic']//tei:item">
                                <li>
                                    <xsl:attribute name="id"><xsl:value-of select="@xml:id" /></xsl:attribute>
                                    <b><i><xsl:value-of select="current()/tei:term" /></i></b>
                                    <xsl:if test="current()/tei:gloss">
                                        - <xsl:value-of select="current()/tei:gloss" />
                                    </xsl:if>
                                </li>
                            </xsl:for-each>
                        </ul>
                    </div>
                    
                    <div class="glossario-block">
                        <h3>Varianti grafiche storiche</h3>
                        <ul>
                            <xsl:for-each select="//tei:back/tei:div[@type='graphic_variants']//tei:item">
                                <li>
                                    <xsl:attribute name="id"><xsl:value-of select="@xml:id" /></xsl:attribute>
                                    <b><i><xsl:value-of select="current()/tei:term" /></i></b>
                                    <xsl:if test="current()/tei:gloss">
                                        - <xsl:value-of select="current()/tei:gloss" />
                                    </xsl:if>
                                </li>
                            </xsl:for-each>
                        </ul>
                    </div>
                    
                    <div class="glossario-block">
                        <h3>Epiteti</h3>
                        <ul>
                            <xsl:for-each select="//tei:back/tei:div[@type='epithets']//tei:item">
                                <li>
                                    <xsl:attribute name="id"><xsl:value-of select="@xml:id" /></xsl:attribute>
                                    <b><i><xsl:value-of select="current()/tei:term" /></i></b>
                                    <xsl:if test="current()/tei:gloss">
                                        - <xsl:value-of select="current()/tei:gloss" />
                                    </xsl:if>
                                </li>
                            </xsl:for-each>
                        </ul>
                    </div>
                </section>
                
                <!-- Info sul progetto -->
                <section id="info" class="page-section no-toolbar">
                    <h2>Informazioni sul progetto</h2>
                    
                    <div class="info-block">
                        <h3>Edizione digitale</h3>
                        <p><xsl:value-of select="//tei:editionStmt/tei:edition" /></p>
                        <xsl:for-each select="//tei:editionStmt/tei:respStmt">
                            <p>
                                <b><xsl:value-of select="current()/tei:resp" /></b>
                                <xsl:value-of select="current()/tei:name" />
                            </p>
                        </xsl:for-each>
                    </div>
                    
                    <div class="info-block">
                        <h3>Pubblicazione</h3>
                        <p><b>Editore: </b><xsl:value-of select="//tei:publicationStmt/tei:publisher" /></p>
                        <p><b>Sede: </b><xsl:value-of select="//tei:publicationStmt/tei:pubPlace" /></p>
                        <p><b>Anno: </b><xsl:value-of select="//tei:publicationStmt/tei:date" /></p>
                        <p><b>Licenza: </b><xsl:value-of select="//tei:publicationStmt/tei:availability/tei:p" /></p>
                    </div>
                    
                    <div class="info-block">
                        <h3>La rivista</h3>
                        <p>
                            <i><xsl:value-of select="//tei:sourceDesc/tei:listBibl/tei:biblStruct[1]/tei:monogr/tei:title" /></i>
                        </p>
                        <p><b>Lingua: </b><xsl:value-of select="//tei:sourceDesc//tei:textLang" /></p>
                        <xsl:for-each select="//tei:sourceDesc/tei:listBibl/tei:biblStruct[1]/tei:monogr/tei:respStmt">
                            <p>
                                <b><xsl:value-of select="current()/tei:resp" /></b>
                                <xsl:for-each select="current()/tei:name">
                                    <xsl:value-of select="current()" />
                                    <xsl:if test="position() != last()">, </xsl:if>
                                </xsl:for-each>
                            </p>
                        </xsl:for-each>
                        <p><b>Sedi di pubblicazione: </b>
                            <xsl:for-each select="//tei:sourceDesc/tei:listBibl/tei:biblStruct[1]/tei:monogr/tei:imprint/tei:pubPlace">
                                <xsl:value-of select="current()/tei:placeName" /> 
                                (<xsl:value-of select="current()/tei:date" />)
                                <xsl:if test="position() != last()">; </xsl:if>
                            </xsl:for-each>
                        </p>
                        <p><b>Tipografia: </b><xsl:value-of select="//tei:sourceDesc/tei:listBibl/tei:biblStruct[1]/tei:monogr/tei:imprint/tei:publisher" /></p>
                    </div>
                    
                    <div class="info-block">
                        <h3>Articoli codificati</h3>
                        <ul>
                            <xsl:for-each select="//tei:sourceDesc/tei:listBibl/tei:biblStruct[tei:analytic]">
                                <li>
                                    <b><xsl:value-of select="current()/tei:analytic/tei:title" /></b>
                                    <br />
                                    Vol. <xsl:value-of select="current()/tei:monogr/tei:biblScope[@unit='volume']" />,
                                    Fasc. <xsl:value-of select="current()/tei:monogr/tei:biblScope[@unit='issue']" />,
                                    p. <xsl:value-of select="current()/tei:monogr/tei:biblScope[@unit='page']" />
                                    -
                                    <xsl:value-of select="current()/tei:monogr/tei:imprint/tei:date" />
                                </li>
                            </xsl:for-each>
                        </ul>
                    </div>
                    
                    <div class="info-block">
                        <h3>Descrizione del progetto</h3>
                        <xsl:apply-templates select="//tei:projectDesc/tei:p" />
                    </div>
                    
                    <div class="info-block">
                        <h3>Criteri di codifica</h3>
                        <xsl:apply-templates select="//tei:editorialDecl/tei:p" />
                    </div>
                </section>
                
                <!-- Paginazione: Precedente / Successivo -->
                <div class="pagination">
                    <button class="btn-prev">← Precedente</button>
                    <span class="page-indicator">Articolo 1</span>
                    <button class="btn-next">Successivo →</button>
                </div>
                
                <!-- Footer -->
                <footer>
                    <p>
                        <b>Codifica TEI a cura di: </b>
                        <xsl:value-of select="//tei:editionStmt/tei:respStmt[tei:name/@xml:id='VC']/tei:name" />
                    </p>
                    <p>
                        <b>Coordinamento: </b>
                        <xsl:value-of select="//tei:editionStmt/tei:respStmt[tei:name/@xml:id='AMDG']/tei:name" />
                    </p>
                    <p>
                        <xsl:value-of select="//tei:publicationStmt/tei:publisher" />,
                        <xsl:value-of select="//tei:publicationStmt/tei:date" />
                        - <xsl:value-of select="//tei:publicationStmt/tei:availability/tei:p" />
                    </p>
                </footer>
                
            </body>
        </html>
    </xsl:template>
    
    <!-- Template per le immagini delle pagine (surface) -->
    <xsl:template match="tei:surface">
        <div class="page-container">
            <xsl:element name="img">
                <xsl:attribute name="src"><xsl:value-of select="concat('img/', current()/tei:graphic/@url)" /></xsl:attribute>
                <xsl:attribute name="alt">Pagina <xsl:value-of select="@xml:id" /></xsl:attribute>
            </xsl:element>
            
            <xsl:for-each select="current()/tei:zone">
                <xsl:variable name="img-w" select="number(translate(../tei:graphic/@width, 'px', ''))" />
                <xsl:variable name="img-h" select="number(translate(../tei:graphic/@height, 'px', ''))" />
                
                <xsl:element name="div">
                    <xsl:attribute name="class">zone-overlay</xsl:attribute>
                    <xsl:attribute name="data-facs"><xsl:value-of select="@xml:id" /></xsl:attribute>
                    <xsl:attribute name="style">position: absolute; left: <xsl:value-of select="(@ulx div $img-w) * 100" />%; top: <xsl:value-of select="(@uly div $img-h) * 100" />%; width: <xsl:value-of select="((@lrx - @ulx) div $img-w) * 100" />%; height: <xsl:value-of select="((@lry - @uly) div $img-h) * 100" />%;</xsl:attribute>
                </xsl:element>
            </xsl:for-each>
        </div>
    </xsl:template>
    
    <!-- Page beginning -->
    <xsl:template match="tei:pb">
        <xsl:if test="preceding-sibling::*">
            <xsl:element name="div">
                <xsl:attribute name="class">pb-marker</xsl:attribute>
                -- Cambio pagina --
            </xsl:element>
        </xsl:if>
    </xsl:template>
    
    <!-- Line beginning -->
    <xsl:template match="tei:lb">
        <br />
        <xsl:element name="span">
            <xsl:attribute name="class">lb-marker</xsl:attribute>
            <xsl:attribute name="data-facs">
                <xsl:value-of select="substring-after(@facs, '#')" />
            </xsl:attribute>
        </xsl:element>
    </xsl:template>
    
    <!-- Titolo di articolo o sezione -->
    <xsl:template match="tei:head">
        <xsl:element name="h3">
            <xsl:attribute name="class">article-head</xsl:attribute>
            <xsl:if test="@facs">
                <xsl:attribute name="data-facs">
                    <xsl:value-of select="substring-after(@facs, '#')" />
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates />
        </xsl:element>
    </xsl:template>
    
    <!-- Milestone: sinistra per separatori di nota, centro per separatori di sezione -->
    <xsl:template match="tei:milestone">
        <xsl:element name="hr">
            <xsl:choose>
                <xsl:when test="@unit='footnote-separator'">
                    <xsl:attribute name="class">milestone milestone-footnote</xsl:attribute>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:attribute name="class">milestone milestone-section</xsl:attribute>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:if test="@facs">
                <xsl:attribute name="data-facs">
                    <xsl:value-of select="substring-after(@facs, '#')" />
                </xsl:attribute>
            </xsl:if>
        </xsl:element>
    </xsl:template>
    
    <!-- Note a piè di pagina -->
    <xsl:template match="tei:note">
        <xsl:element name="div">
            <xsl:attribute name="class">footnote</xsl:attribute>
            <xsl:if test="@xml:id">
                <xsl:attribute name="id"><xsl:value-of select="@xml:id" /></xsl:attribute>
            </xsl:if>
            <xsl:if test="@facs">
                <xsl:attribute name="data-facs">
                    <xsl:value-of select="substring-after(@facs, '#')" />
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates />
        </xsl:element>
    </xsl:template>
     
    <!-- Blocchi anonimi -->
    <xsl:template match="tei:ab">
        <xsl:element name="div">
            <xsl:attribute name="class">
                ab ab-<xsl:value-of select="@type" />
            </xsl:attribute>
            <xsl:apply-templates />
        </xsl:element>
    </xsl:template>
    
    <!-- Closer (chiusura articolo) -->
    <xsl:template match="tei:closer">
        <xsl:element name="div">
            <xsl:attribute name="class">closer</xsl:attribute>
            <xsl:apply-templates />
        </xsl:element>
    </xsl:template>
    
    <!-- Signed (firma autore) -->
    <xsl:template match="tei:signed">
        <xsl:element name="div">
            <xsl:attribute name="class">signed</xsl:attribute>
            <xsl:if test="@facs">
                <xsl:attribute name="data-facs">
                    <xsl:value-of select="substring-after(@facs, '#')" />
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates />
        </xsl:element>
    </xsl:template>
    
    <!-- Persone reali -->
    <xsl:template match="tei:persName[not(@type='fictional')]">
        <xsl:element name="span">
            <xsl:attribute name="class">entity person-real</xsl:attribute>
            <xsl:attribute name="data-cat">person-real</xsl:attribute>
            <xsl:if test="@ref">
                <xsl:attribute name="data-ref">
                    <xsl:value-of select="substring-after(@ref, '#')" />
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates />
        </xsl:element>
    </xsl:template>
    
    
    <!-- Personaggi immaginari -->
    <xsl:template match="tei:persName[@type='fictional']">
        <xsl:element name="span">
            <xsl:attribute name="class">entity person-fictional</xsl:attribute>
            <xsl:attribute name="data-cat">person-fictional</xsl:attribute>
            <xsl:if test="@ref">
                <xsl:attribute name="data-ref">
                    <xsl:value-of select="substring-after(@ref, '#')" />
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates />
        </xsl:element>
    </xsl:template>
    
    <!-- Luoghi -->
    <xsl:template match="tei:placeName">
        <xsl:element name="span">
            <xsl:attribute name="class">entity place</xsl:attribute>
            <xsl:attribute name="data-cat">place</xsl:attribute>
            <xsl:if test="@ref">
                <xsl:attribute name="data-ref">
                    <xsl:value-of select="substring-after(@ref, '#')" />
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates />
        </xsl:element>
    </xsl:template>
    
    <!-- Luoghi naturali -->
    <xsl:template match="tei:geogName">
        <xsl:element name="span">
            <xsl:attribute name="class">entity geog</xsl:attribute>
            <xsl:attribute name="data-cat">geog</xsl:attribute>
            <xsl:if test="@ref">
                <xsl:attribute name="data-ref">
                    <xsl:value-of select="substring-after(@ref, '#')" />
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates />
        </xsl:element>
    </xsl:template>
    
    <!-- Organizzazioni -->
    <xsl:template match="tei:orgName">
        <xsl:variable name="idref" select="substring-after(@ref, '#')" />
        <xsl:element name="span">
            <xsl:choose>
                <xsl:when test="//tei:org[@xml:id=$idref][@type='publisher']">
                    <xsl:attribute name="class">entity journal</xsl:attribute>
                    <xsl:attribute name="data-cat">journal</xsl:attribute>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:attribute name="class">entity org</xsl:attribute>
                    <xsl:attribute name="data-cat">org</xsl:attribute>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:if test="@ref">
                <xsl:attribute name="data-ref">
                    <xsl:value-of select="$idref" />
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates />
        </xsl:element>
    </xsl:template>
    
    <!-- Titoli: distinguo riviste (journal) da opere (work) -->
    <xsl:template match="tei:title">
        <xsl:variable name="idref" select="substring-after(@ref, '#')" />
        <xsl:element name="span">
            <xsl:choose>
                <xsl:when test="@type='journal'">
                    <xsl:attribute name="class">entity journal</xsl:attribute>
                    <xsl:attribute name="data-cat">journal</xsl:attribute>
                </xsl:when>
                <xsl:when test="//tei:bibl[@xml:id=$idref]/tei:title[@type='journal']">
                    <xsl:attribute name="class">entity journal</xsl:attribute>
                    <xsl:attribute name="data-cat">journal</xsl:attribute>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:attribute name="class">entity work</xsl:attribute>
                    <xsl:attribute name="data-cat">work</xsl:attribute>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:if test="@ref">
                <xsl:attribute name="data-ref">
                    <xsl:value-of select="$idref" />
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates />
        </xsl:element>
    </xsl:template>
    
    <!-- Date -->
    <xsl:template match="tei:date">
        <xsl:element name="span">
            <xsl:attribute name="class">entity date</xsl:attribute>
            <xsl:attribute name="data-cat">date</xsl:attribute>
            <xsl:if test="@when">
                <xsl:attribute name="data-when"><xsl:value-of select="@when" /></xsl:attribute>
            </xsl:if>
            <xsl:apply-templates />
        </xsl:element>
    </xsl:template>
    
    <!-- Gruppi (rs type="group") -->
    <xsl:template match="tei:rs[@type='group']">
        <xsl:element name="span">
            <xsl:attribute name="class">group</xsl:attribute>
            <xsl:if test="@ref">
                <xsl:attribute name="data-ref">
                    <xsl:value-of select="substring-after(@ref, '#')" />
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates />
        </xsl:element>
    </xsl:template>
    
    <!-- Temi (rs type="theme") -->
    <xsl:template match="tei:rs[@type='theme']">
        <xsl:element name="span">
            <xsl:attribute name="class">entity theme</xsl:attribute>
            <xsl:attribute name="data-cat">theme</xsl:attribute>
            <xsl:apply-templates />
        </xsl:element>
    </xsl:template>
    
    <!-- Epiteti (rs type="epithet") -->
    <xsl:template match="tei:rs[@type='epithet']">
        <xsl:element name="span">
            <xsl:attribute name="class">entity epithet</xsl:attribute>
            <xsl:attribute name="data-cat">epithet</xsl:attribute>
            <xsl:apply-templates />
        </xsl:element>
    </xsl:template>
    
    <!-- Termini di tipo "literary" (correnti letterarie) -->
    <xsl:template match="tei:term[@type='literary']">
        <xsl:element name="span">
            <xsl:attribute name="class">entity literary</xsl:attribute>
            <xsl:attribute name="data-cat">literary</xsl:attribute>
            <xsl:apply-templates />
        </xsl:element>
    </xsl:template>
    
    <!-- Termini di tipo "theme" -->
    <xsl:template match="tei:term[@type='theme']">
        <xsl:element name="span">
            <xsl:attribute name="class">entity theme</xsl:attribute>
            <xsl:attribute name="data-cat">theme</xsl:attribute>
            <xsl:apply-templates />
        </xsl:element>
    </xsl:template>
    
    <!-- Altri termini -->
    <xsl:template match="tei:term">
        <xsl:element name="span">
            <xsl:attribute name="class">term</xsl:attribute>
            <xsl:apply-templates />
        </xsl:element>
    </xsl:template>
    
    <!-- Lingue straniere -->
    <xsl:template match="tei:foreign">
        <xsl:element name="span">
            <xsl:attribute name="class">entity foreign</xsl:attribute>
            <xsl:attribute name="data-cat">foreign</xsl:attribute>
            <xsl:apply-templates />
        </xsl:element>
    </xsl:template>
    
    <!-- Citazioni -->
    <xsl:template match="tei:quote">
        <xsl:element name="span">
            <xsl:attribute name="class">entity quote</xsl:attribute>
            <xsl:attribute name="data-cat">quote</xsl:attribute>
            <xsl:apply-templates />
        </xsl:element>
    </xsl:template>
    
    <!-- w con @ana: contenitore trasparente (la marcatura è nel choice interno) -->
    <xsl:template match="tei:w[@ana]">
        <xsl:apply-templates />
    </xsl:template>
    
    <!-- Parole senza @ana: solo contenitore neutro -->
    <xsl:template match="tei:w">
        <xsl:apply-templates />
    </xsl:template>
    
    <!-- Varianti grafiche: choice con orig + reg -->
    <xsl:template match="tei:choice[tei:orig and tei:reg]">
        <xsl:element name="span">
            <xsl:attribute name="class">entity variant</xsl:attribute>
            <xsl:attribute name="data-cat">variant</xsl:attribute>
            <xsl:attribute name="title">
                Variante normalizzata: <xsl:value-of select="tei:reg" />
            </xsl:attribute>
            <xsl:apply-templates select="tei:orig" />
        </xsl:element>
    </xsl:template>
    
    <!-- Abbreviazioni: choice con abbr + expan -->
    <xsl:template match="tei:choice[tei:abbr and tei:expan]">
        <xsl:element name="span">
            <xsl:attribute name="class">entity abbreviation</xsl:attribute>
            <xsl:attribute name="data-cat">abbreviation</xsl:attribute>
            <xsl:attribute name="title">
                Espansione: <xsl:value-of select="tei:expan" />
            </xsl:attribute>
            <xsl:apply-templates select="tei:abbr" />
        </xsl:element>
    </xsl:template>
    
    <!-- Correzioni: choice con sic + corr -->
    <xsl:template match="tei:choice[tei:sic and tei:corr]">
        <xsl:element name="span">
            <xsl:attribute name="class">entity correction</xsl:attribute>
            <xsl:attribute name="data-cat">correction</xsl:attribute>
            <xsl:attribute name="title">
                Correzione: <xsl:value-of select="tei:corr" />
            </xsl:attribute>
            <xsl:apply-templates select="tei:sic" />
        </xsl:element>
    </xsl:template>
    
    <!-- Elementi orig/abbr/sic: passano il contenuto -->
    <xsl:template match="tei:orig | tei:abbr | tei:sic">
        <xsl:apply-templates />
    </xsl:template>
    
    <!-- reg, expan, corr non si stampano (sono nei title degli span sopra) -->
    <xsl:template match="tei:reg | tei:expan | tei:corr" />
    
    <!-- Distinct con type="archaic": sono gli arcaismi -->
    <xsl:template match="tei:distinct[@type='archaic']">
        <xsl:element name="span">
            <xsl:attribute name="class">entity archaism</xsl:attribute>
            <xsl:attribute name="data-cat">archaism</xsl:attribute>
            <xsl:if test="@ana">
                <xsl:attribute name="data-ana">
                    <xsl:value-of select="substring-after(@ana, '#')" />
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates />
        </xsl:element>
    </xsl:template>
    
    <!-- Misure -->
    <xsl:template match="tei:measure">
        <xsl:element name="span">
            <xsl:attribute name="class">measure</xsl:attribute>
            <xsl:apply-templates />
        </xsl:element>
    </xsl:template>
    
    <!-- Rendering tipografico: hi -->
    <xsl:template match="tei:hi[@rend='italic']">
        <i><xsl:apply-templates /></i>
    </xsl:template>
    
    <xsl:template match="tei:hi[@rend='bold']">
        <b><xsl:apply-templates /></b>
    </xsl:template>
    
    <xsl:template match="tei:hi">
        <xsl:apply-templates />
    </xsl:template>
    
    <!-- Unclear: parole di lettura incerta -->
    <xsl:template match="tei:unclear">
        <xsl:element name="span">
            <xsl:attribute name="class">entity damaged unclear</xsl:attribute>
            <xsl:attribute name="data-cat">damaged</xsl:attribute>
            <xsl:attribute name="title">
                Lettura incerta: <xsl:value-of select="@reason" />
            </xsl:attribute>
            <xsl:apply-templates />
        </xsl:element>
    </xsl:template>
    
    <!-- Gap: lacuna -->
    <xsl:template match="tei:gap">
        <xsl:element name="span">
            <xsl:attribute name="class">entity damaged gap</xsl:attribute>
            <xsl:attribute name="data-cat">damaged</xsl:attribute>
            <xsl:attribute name="title">
                Testo illeggibile: <xsl:value-of select="@reason" />
                <xsl:if test="@extent">
                    (<xsl:value-of select="@extent" />)
                </xsl:if>
            </xsl:attribute>
            •
        </xsl:element>
    </xsl:template>
    
    <!-- pc force="inter": trattini di sillabazione -->
    <xsl:template match="tei:pc[@force='inter']">
        <xsl:element name="span">
            <xsl:attribute name="class">hyphen-soft</xsl:attribute>
            -
        </xsl:element>
    </xsl:template>
    
    <!-- Altri pc: passano il contenuto -->
    <xsl:template match="tei:pc">
        <xsl:apply-templates />
    </xsl:template>
    
    <!-- Riferimenti interni: link solo se ha un target -->
    <xsl:template match="tei:ref">
        <xsl:choose>
            <xsl:when test="@target">
                <xsl:element name="a">
                    <xsl:attribute name="href">
                        <xsl:value-of select="@target" />
                    </xsl:attribute>
                    <xsl:attribute name="class">ref-link</xsl:attribute>
                    <xsl:apply-templates />
                </xsl:element>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates />
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <!-- Nomi generici -->
    <xsl:template match="tei:name">
        <xsl:element name="span">
            <xsl:attribute name="class">name</xsl:attribute>
            <xsl:apply-templates />
        </xsl:element>
    </xsl:template>
    
    <!-- surname/forename/roleName: passano il contenuto -->
    <xsl:template match="tei:surname | tei:forename | tei:roleName">
        <xsl:apply-templates />
    </xsl:template>
    
    <!-- div: passa al contenuto interno -->
    <xsl:template match="tei:div">
        <xsl:apply-templates />
    </xsl:template>
    
    <!-- Paragrafi nel teiHeader (projectDesc, editorialDecl): semplice <p> HTML -->
    <xsl:template match="tei:p">
        <p><xsl:apply-templates /></p>
    </xsl:template>
    
    <!-- gi e att nel teiHeader: solo formattazione code -->
    <xsl:template match="tei:gi">
        <code>&lt;<xsl:apply-templates />&gt;</code>
    </xsl:template>
    
    <xsl:template match="tei:att">
        <code>@<xsl:apply-templates /></code>
    </xsl:template>
    
    <!-- mentioned nel teiHeader: italico semplice -->
    <xsl:template match="tei:mentioned">
        <i><xsl:apply-templates /></i>
    </xsl:template>
    
    
</xsl:stylesheet>

