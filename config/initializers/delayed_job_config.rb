Delayed::Worker.max_attempts = 3
Delayed::Worker.delay_jobs = !Rails.env.test?

# Delayed::Worker.logger = Logger.new(File.join(Rails.root, 'log', 'delayed_job.log'))
