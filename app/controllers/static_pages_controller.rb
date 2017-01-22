class StaticPagesController < ApplicationController
  def home
  end
  
  def about
  end
  
  def contact
  end
  
  def groupdata
     Aws.config.update({
 	    :access_key_id => ENV['AWS_ACCESS_KEY_ID'],:secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
 	})
   	s3 = Aws::S3::Client.new(region: 'us-west-2')
 	  jupyter = s3.get_object({bucket:'elasticbeanstalk-us-west-2-680684803586', key:'electrophysiology.html'})
 	  @jupyter = jupyter.body.read
  end
end