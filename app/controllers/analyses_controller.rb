class AnalysesController < ApplicationController
	
  def index
    ctype = params[:strain]=="unknown" ? "unknown" : "tdTomato"
	analyses = Analysis.joins(:cell).where(cells: {cell_type: ctype}).where(analysis_type: ["free whisking", "active touch"])
	if ctype == "unknown"
	  @analyses = analyses
	else
	  selectedneurons = analyses.select{|a| a.cell.mouse[:species_strain].downcase().include? params[:strain]}
	  @analyses = Analysis.where(id: selectedneurons.map(&:id))
	end
	@analyses = @analyses.includes(:cell).order("cells.depth", "analysis_type").paginate(:per_page => 15, :page => params[:page])
	@strain = params[:strain]
  end

  def show
	@analysis = Analysis.find(params[:id])
	Aws.config.update({
	    :access_key_id => ENV['AWS_ACCESS_KEY_ID'],:secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
	})
	s3 = Aws::S3::Client.new(region: 'us-west-2')
	xsgobj = s3.get_object({bucket:'elasticbeanstalk-us-west-2-680684803586', key:'xsgs/' + @analysis.file + '.txt'})
	@vm = xsgobj.body.read
	whiskobj = s3.get_object({bucket:'elasticbeanstalk-us-west-2-680684803586', key:'xsgs/' + @analysis.file + '.whisk'})
	@angle = whiskobj.body.read
	@ons = []
	@offs = []
	if @analysis.analysis_type == "active touch"
	  contactobj = s3.get_object({bucket:'elasticbeanstalk-us-west-2-680684803586', key:'xsgs/' + @analysis.file + '.contact'})
	  contacts = contactobj.body.read
	  @ons = '[' + contacts.lines[0] + ']'
	  @offs = '[' + contacts.lines[1] + ']'
	end
  end
end
