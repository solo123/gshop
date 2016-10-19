class StaticReportsController < ResourcesController
	private
		def static_report_params
			params.require(:static_report).permit(:report_num, :col, :row, :val)
    end
end

