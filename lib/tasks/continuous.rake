namespace :continuous do
  desc "Get the latest status of continuous stacks from cloud providers"
  task cluster_status: :environment do
    puts "Getting status from all continuous stacks"
    Cluster.all.each do |c|
      c.getContinuousStack
      c.save
    end
  end
end
