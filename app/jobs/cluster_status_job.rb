class ClusterStatusJob < ApplicationJob
  queue_as :default

  def perform(cluster)
    # Do something later
    cluster.getContinuousStack    
  end
end
