require 'rest-client'
require 'json'

class ExternalRequestsService
  def self.list_deputies
    url = 'https://dadosabertos.camara.leg.br/api/v2/deputados?ordem=ASC&ordenarPor=nome'

    res = RestClient.get url, accept: :json

    JSON.parse(res.body).symbolize_keys[:dados]
  end

  def self.list_senators
    url = 'http://legis.senado.leg.br/dadosabertos/senador/lista/atual'

    res = RestClient.get url, content_type: :json, accept: :json

    JSON.parse(res.body).symbolize_keys[:ListaParlamentarEmExercicio]
        .symbolize_keys[:Parlamentares].symbolize_keys[:Parlamentar]
  end
end
