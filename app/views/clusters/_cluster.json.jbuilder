json.extract! cluster, :id, :clustername, :clusterendpoints, :clusterstatus, :clusterusername, :clusterpassword, :created_at, :updated_at
json.url cluster_url(cluster, format: :json)
