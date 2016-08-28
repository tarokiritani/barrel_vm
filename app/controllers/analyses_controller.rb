class AnalysesController < ApplicationController
  
  def index
    ctype = params[:strain]=="unknown" ? "unknown" : "tdTomato"
	puts ctype
	analyses = Analysis.joins(:cell).where(cells: {cell_type: ctype}).where(analysis_type: ["free whisking", "active touch"])
	if ctype == "unknown"
	  @analyses = analyses
	else
	  @analyses = analyses.select{|a| a.cell.mouse[:species_strain].downcase().include? params[:strain]}
	end
	@strain = params[:strain]
  end

  def show
	@analysis = Analysis.find(params[:id])
	Aws.config.update({
	    :access_key_id => ENV['AWS_ACCESS_KEY_ID'],:secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
	})
	s3 = Aws::S3::Client.new(region: 'us-west-2')
	obj = s3.get_object({bucket:'elasticbeanstalk-us-west-2-680684803586', key:'xsgs/'+@analysis.file.sub!("txt","vm")})
	vm = obj.body.read.split(",")
	sec = (1..vm.length).map{|x| (x/10000.0).to_s}
	@vm = sec.zip(vm).map{|x,y| x+","+y}.join("\n")+"\n"
	#obj = s3.get_object({bucket:'elasticbeanstalk-us-west-2-680684803586', key:'xsgs/whisker'+@analysis.file})
	#@angle = obj.body.read 
	@angle = "sec,angle\\n1,10\\n2,34\\n10,22\\n20,11\\n30,21\\n40,23\\n50,11\\n60,22\\n"
	@ons = [10,20,30]
	@offs = [15,25,35]
  end
end
