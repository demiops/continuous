class DeleteClusterJob < ApplicationJob
  queue_as :default

  def perform(cluster)
    # Do something later
    cluster.destroyContinuousStack
  end
end
