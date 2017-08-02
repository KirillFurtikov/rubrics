crumb :root do
  link t('main'), root_path
end

crumb :clients do
  link ClientsController.controller_name.humanize, clients_path
end

crumb :client do |client|
  if client.id
    link client.model_name.human, client
  else
    link %Q(Новый #{client.model_name.human}).capitalize, client
  end
  parent :clients
end

crumb :request do |client, request|
  if request.id
    link request.title, client_request_path(client, request)
  else
    link %Q(Новый #{request.model_name.human}).capitalize, new_client_request_path(client)
  end
  parent :requests, client
end

crumb :requests do |client|
  link request.model_name.human, client_requests_path(client)
  parent :client, client
end