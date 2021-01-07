/*
 * 
  Esta es la ruta del api para las series.
 *
 */
const url_host = 'https://apiserieslyg.herokuapp.com';

const series = {
  'top_series': '$url_host/api/series?top=',
  'search': '$url_host/api/series?search=',
  'all_series': '$url_host/api/series',
};

const capitulos = '$url_host/api/series/capitulos?idSerie=';
