

function Confirm(id, table, nom)
{
    if (table == "rubrique"){
        var tab = "rubrique_news";
    } else {
        var tab = table;
    }

	var host = 'http://' + window.location.href.split('/')[2] + '/' + window.location.href.split('/')[3] + '/';

    if (confirm("Es-tu sûr de vouloir supprimer le champ : "+ nom + " de la " + table + " ?")) {
         location.href = host + 'deleteForm/'+tab+'/'+id+'';
    }
}

