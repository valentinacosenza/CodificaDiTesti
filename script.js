//Script per l'interattività della dashboard

//Ordine delle sezioni per i pulsanti Precedente/Successivo
$(document).ready(function() {
    var sezioni = ["art1", "art2", "bibliografia", "news", "glossario", "info"];

    var etichette = {
        "art1": "Articolo 1",
        "art2": "Articolo 2",
        "bibliografia": "Bibliografia",
        "news": "Notizie",
        "glossario": "Glossario",
        "info": "Info"
    };

    //Funzione che mostra una sezione e nasconde le altre e aggiorna lo stato dei pulsanti
    function mostraSezione(id) {
        $(".page-section").removeClass("active");
        $("#" + id).addClass("active");

        if ($("#" + id).hasClass("no-toolbar")) {
            $(".toolbar").hide();
        } else {
            $(".toolbar").show();
        }

        $(".page-indicator").text(etichette[id]);

        var indice = sezioni.indexOf(id);
        $(".btn-prev").prop("disabled", indice === 0);
        $(".btn-next").prop("disabled", indice === sezioni.length - 1);

        window.scrollTo(0, 0);
    }

    //Click sui link del menu
    $(".navMenu a").click(function(e) {
        e.preventDefault();
        var id = $(this).attr("href").substring(1); 
        mostraSezione(id);
    });

    //Click su "Precedente"
    $(".btn-prev").click(function() {
        var idAttuale = $(".page-section.active").attr("id");
        var indice = sezioni.indexOf(idAttuale);
        if (indice > 0) {
            mostraSezione(sezioni[indice - 1]);
        }
    });

    //Click su "Successivo"
    $(".btn-next").click(function() {
        var idAttuale = $(".page-section.active").attr("id");
        var indice = sezioni.indexOf(idAttuale);
        if (indice < sezioni.length - 1) {
            mostraSezione(sezioni[indice + 1]);
        }
    });

    mostraSezione("art1");

    //Accendi e spegni i pulsanti e le entità
    $(".cat-btn").click(function() {
        var categoria = $(this).data("cat");

        $(this).toggleClass("attivo");

        $(".page-section.active .entity[data-cat='" + categoria + "']").toggleClass("on");
    });

    //Pulsante Reset
    $(".cat-reset").click(function() {
        $(".entity").removeClass("on");
        $(".cat-btn").removeClass("attivo");
    });

    //Quando cambio sezione si azzerano le parole evidenziate
    $(".navMenu a, .btn-prev, .btn-next").click(function() {
        $(".entity").removeClass("on");
        $(".cat-btn").removeClass("attivo");
    });

    //Quando passo su una zona dell'immagine, evidenzia la riga corrispondente nel testo
    $(".zone-overlay").hover(
    function() {
        var facs = $(this).data("facs");
        evidenziaRiga(facs);
    },
    function() {
        rimuoviEvidenziazioneRiga();
    });

});

//Evidenzia la riga corrispondente nel testo quando si passa il mouse su una zona dell'immagine
function evidenziaRiga(facs) {
    rimuoviEvidenziazioneRiga();

    var testoPane = $(".page-section.active .testo").get(0);
    if (!testoPane) return;

    //Cerca il marker di riga normale
    var marker = $(testoPane).find(".lb-marker[data-facs='" + facs + "']").get(0);

    //Se non c'è, cerca head, hr, div.signed, div.footnote con quel facs
    var elemento = marker || $(testoPane).find("h3[data-facs='" + facs + "'], hr[data-facs='" + facs + "'], div.signed[data-facs='" + facs + "'], div.footnote[data-facs='" + facs + "']").get(0);

    if (!elemento) return;

    var elemRect = elemento.getBoundingClientRect();
    var testoRect = testoPane.getBoundingClientRect();
    var scrollTop = testoPane.scrollTop;

    var lineHeight = parseFloat(window.getComputedStyle(testoPane).lineHeight);
    if (isNaN(lineHeight)) lineHeight = 22;

    var altezza = marker ? lineHeight : elemento.getBoundingClientRect().height;
    var topPos = elemRect.top - testoRect.top + scrollTop;

    var highlight = $('<div class="riga-evidenziata-temp"></div>');
    highlight.css({
        position: "absolute",
        left: 0,
        right: 0,
        top: topPos + "px",
        height: altezza + "px",
        pointerEvents: "none",
        zIndex: 1
    });
    $(testoPane).css("position", "relative");
    $(testoPane).append(highlight);
}

//Rimuove l'evidenziazione della riga nel testo
function rimuoviEvidenziazioneRiga() {
    $(".riga-evidenziata-temp").remove();
}
